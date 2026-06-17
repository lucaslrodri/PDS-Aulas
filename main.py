from __future__ import annotations

import json
import re
import shutil
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parent
DATA_FILE = ROOT / "data" / "pds-plano.json"
PRESENTATIONS_DIR = ROOT / "docs" / "presentations"
UNIT_DIR_PATTERN = re.compile(r"^pds-(\d+)-([a-z0-9-]+)$")


def github_links(repo: str, branch: str, pdf_path: str) -> tuple[str, str]:
    pdf_path = pdf_path.strip("/")
    view_url = f"https://github.com/{repo}/blob/{branch}/{pdf_path}"
    download_url = f"https://raw.githubusercontent.com/{repo}/{branch}/{pdf_path}"
    return view_url, download_url


def get_folder_name(unit_number: int, title: str) -> str:
    """Generate folder name from unit number and title."""
    slug = (
        title.lower()
        .replace(" ", "-")
        .replace("$", "")
        .replace("(", "")
        .replace(")", "")
        .replace("–", "-")
    )
    slug = "".join(c for c in slug if c.isalnum() or c in "-")
    slug = "-".join(filter(None, slug.split("-")))
    return f"pds-{unit_number:02d}-{slug}"


def export_slide(typ_path: Path, output_html: Path) -> None:
    """Compile a Typst slide to HTML via Touying (incremental by mtime)."""
    if (
        output_html.exists()
        and output_html.stat().st_mtime >= typ_path.stat().st_mtime
    ):
        return

    output_html.parent.mkdir(parents=True, exist_ok=True)
    cmd = [
        "touying",
        "compile",
        str(typ_path),
        "--format",
        "html",
        "--output",
        str(output_html),
        "--root",
        str(ROOT),
    ]
    print(f"[macros] Compilando slide: {typ_path.name} -> {output_html.name}")
    subprocess.run(cmd, check=True)


def export_presentations() -> None:
    """Export every unit slide (pds-NN-slug/<same>.typ) to docs/presentations."""
    if shutil.which("touying") is None:
        print("[macros] 'touying' não encontrado; pulando exportação de slides.")
        return

    for path in ROOT.iterdir():
        if not path.is_dir() or not UNIT_DIR_PATTERN.match(path.name):
            continue

        typ_path = path / f"{path.name}.typ"
        if not typ_path.exists():
            continue

        export_slide(typ_path, PRESENTATIONS_DIR / f"{path.name}.html")


def define_env(env):
    # Exporta os slides Typst -> HTML antes de renderizar a página.
    export_presentations()

    data = json.loads(DATA_FILE.read_text(encoding="utf-8"))

    repo = data.get("repository", "lucaslrodri/PDS-Aulas")
    branch = data.get("branch", "main")
    course = data["course"]
    course_code = course.get("subject-code", "")

    home = {
        "title": (
            f'{course_code} - {course["subject"]}'.strip(" - ")
            if course_code
            else course["subject"]
        ),
        "logo_alt": "Logo da UFAC",
        "logo_src": "./assets/ufac.png",
    }
    labels = {
        "open_pdf": "Abrir PDF",
        "download_pdf": "Download PDF",
        "presentation": "Apresentação",
    }

    # Build units from program-content, filtering topics
    units_context: list[dict[str, object]] = []
    unit_counter = 0

    for item in course.get("program-content", []):
        # Skip non-topic items (provas, trabalhos, etc)
        if item.get("isTopic") is False:
            continue

        unit_counter += 1
        folder_name = get_folder_name(unit_counter, item["title"])
        folder_path = ROOT / folder_name

        # Skip if folder doesn't exist
        if not folder_path.is_dir():
            continue

        pdf_path = f"{folder_name}/{folder_name}.pdf"
        has_slide = (folder_path / f"{folder_name}.typ").exists()

        # Build topic list with semicolon separator
        topics_text = "; ".join(topic.rstrip(";") for topic in item.get("topics", []))

        view_url, download_url = github_links(repo, branch, pdf_path)

        actions = [
            {
                "label": labels["open_pdf"],
                "icon": ":fontawesome-regular-file-pdf:",
                "href": view_url,
                "markdown": f"[:fontawesome-regular-file-pdf:]({view_url}){{: .icon-card aria-label=\"{labels['open_pdf']}\" target=_blank }}",
            },
            {
                "label": labels["download_pdf"],
                "icon": ":octicons-download-16:",
                "href": download_url,
                "markdown": f"[:octicons-download-16:]({download_url}){{: .icon-card aria-label=\"{labels['download_pdf']}\" target=_blank }}",
            },
        ]

        if has_slide:
            presentation_html = f"presentations/{folder_name}.html"
            actions.append(
                {
                    "label": labels["presentation"],
                    "icon": ":material-presentation:",
                    "href": "./" + presentation_html,
                    "markdown": f"[:material-presentation:](./{presentation_html}){{: .icon-card .icon-outlined aria-label=\"{labels['presentation']}\" target=_blank }}",
                }
            )

        units_context.append(
            {
                "number": unit_counter,
                "title": item["title"],
                "meetings": item.get("meetings", 0),
                "topics": topics_text,
                "actions": actions,
            }
        )

    env.variables["home"] = home
    env.variables["units"] = units_context

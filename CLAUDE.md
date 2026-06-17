# CLAUDE.md

Guia para trabalhar neste repositório. Idioma do projeto: **português (pt-BR)**.

## O que é

Site em **MkDocs Material** com o material da disciplina de Processamento Digital
de Sinais (PDS). O conteúdo de cada aula é escrito em **Typst** (`.typ`),
compilado para **PDF** (apostila) e para **HTML** (slides, via Touying). O site
publica uma página inicial com links para esses artefatos e é hospedado no
GitHub Pages.

## Arquitetura

A página inicial é gerada dinamicamente em tempo de build pelo plugin
**mkdocs-macros**, não por scripts externos. Há uma única fonte de dados.

- **`data/pds-plano.json`** — fonte única de verdade. Contém `repository`,
  `branch` e `course` (com `program-content`, que lista as unidades temáticas e
  as provas/trabalhos via `isTopic: false`).
- **`main.py`** (raiz) — módulo do plugin mkdocs-macros. É o coração da geração:
  - `define_env(env)` é chamado no evento `on_config` (antes do build). Ele:
    1. Exporta os slides `.typ` → HTML (Touying), de forma incremental.
    2. Lê `data/pds-plano.json`, monta os contextos `home` e `units` e os
       expõe como variáveis Jinja (`env.variables[...]`).
  - `get_folder_name(n, title)` deriva o nome da pasta da unidade
    (`pds-NN-slug`) a partir do título.
  - `github_links(...)` monta as URLs de "Abrir PDF" (blob) e "Download" (raw).
- **`docs/index.md`** — template Markdown+Jinja renderizado pelo macros. Usa
  `{{ home.* }}` e itera `{{ units }}`, inserindo `action.markdown` por ação. A
  seção "Plano de aula" está fixa no Markdown (não vem do JSON). No topo (no
  lugar do logo) há uma demo interativa de convolução que recria a figura do
  notebook `convolution-kirby`: topo `imagem ∗ kernel = bordas` (vermelho/ciano,
  hover mostra a vizinhança 3×3 × pesos = pixel de saída, dinâmico) e, abaixo,
  os histogramas `P_X ∗ P_Y = P_{X+Y}`. Container `.ik-demo` animado por
  `docs/assets/image-kernels.js` (CSS em `custom.css`, JS em `extra_javascript`).
  A imagem de entrada é `assets/kirby-pixel.png` (Kirby 30×30 do notebook),
  configurável via `data-src`/`data-cols`.
- **`mkdocs.yml`** — config do site. Plugin `macros` ativo (carrega `main.py`
  automaticamente, por convenção de nome no raiz).

### Convenção de pastas de unidade

Cada unidade temática que possui material fica numa pasta `pds-NN-slug/`
contendo `pds-NN-slug.typ` e `pds-NN-slug.pdf` (mesmo nome da pasta). O regex
`UNIT_DIR_PATTERN = ^pds-(\d+)-([a-z0-9-]+)$` em `main.py` as descobre. Uma
unidade só ganha link de "Apresentação" se existir o `.typ` correspondente
(os slides são exportados para `docs/presentations/pds-NN-slug.html`).

## Fluxo de build

`mkdocs build`/`serve`/`gh-deploy` dispara `define_env` em `main.py`, que (1)
compila os slides Typst→HTML que estiverem desatualizados e (2) injeta os dados
na página. **Não há script de "gerar capítulos" nem de "exportar slides"** — tudo
acontece no build. A exportação de slides é incremental: só recompila um `.typ`
cujo HTML esteja ausente ou mais antigo (comparação de mtime). Em `mkdocs serve`,
slides já compilados são pulados, mantendo o reload rápido.

## Notebooks de figuras (`notebooks/`)

Figuras didáticas geradas com matplotlib (numpy/scipy). Não fazem parte do build
do site; as dependências ficam no grupo opcional `figures` do `pyproject.toml`
(não instalado por padrão). Rodar/editar:

```
uv run --group figures jupyter lab          # ou:
uv run --group figures jupyter nbconvert --to notebook --execute --inplace notebooks/<nb>.ipynb
```

- `convolution-kirby.ipynb` — recria a figura de convolução do 3blue1brown
  (Sobel num sprite de Kirby pixel-art + soma de distribuições). Saídas:
  `convolution-kirby.svg/.png` e `favicon-kirby.svg` (este copiado para
  `docs/assets/` para uso como favicon do site). Fundo branco; contornos em
  vermelho/ciano (zero = branco).
- `filter-dashboard.ipynb` — dashboard interativa (ipywidgets) p/ escolher
  imagem e filtro (`sobel`, `sharpen`, `outline`, `emboss`) e ver
  `imagem ∗ kernel = resultado`. As imagens vêm de `docs/assets/` (`kirby.png`,
  `kirby-chapeu.jpg`, `kirby-sono.jpeg`), via dict `IMAGE_FILES`; são compostas
  sobre branco e reamostradas (~36 px, com anti-aliasing gaussiano) para
  dissolver a grade dos perler beads. Requer kernel vivo (VSCode/Jupyter); o
  `nbconvert --execute` headless não roda o widget.

## Tasks (poethepoet, via uv)

- `uv run poe sync` — sincroniza o ambiente (`uv sync`)
- `uv run poe serve` — servidor local (`mkdocs serve`)
- `uv run poe build` — build do site (gera slides + página)
- `uv run poe deploy` — publica no branch `gh-pages` (`mkdocs gh-deploy --force`)

## CI (`.github/workflows/`)

- **`deploy-mkdocs.yml`** — em push na `main`: instala Typst/fontes/deps e roda
  `mkdocs gh-deploy`. O build em si exporta os slides e gera a página (via
  `main.py`); não há passos separados de scripts.
- **`compile-typst.yml`** — em push que toca `**.typ`: compila os `.typ` cujo
  nome é igual ao da pasta para PDF e faz commit dos PDFs (`[skip ci]`). Os
  pacotes Typst `@local/*` são clonados de `github.com/lucaslrodri/<pkg>`.

## Convenções importantes

- **Uma fonte de dados:** alterações de conteúdo da home (unidades, títulos,
  tópicos, datas) vão em `data/pds-plano.json`, não no Markdown.
- **Não reintroduzir geradores externos:** a lógica de página/slides vive em
  `main.py`. Evite scripts paralelos que dupliquem `define_env`.
- **`docs/` não é versionado** (é saída/working dir do site); idem `site/`.
- Os `.typ` usam pacotes locais `@local/*` resolvidos só no CI/máquina do autor.
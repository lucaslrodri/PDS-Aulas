---
hide:
  - navigation
---

# {{ home.title }}

<div class="ik-demo" data-src="assets/kirby-pixel.png" data-cols="30">
  <div class="ik-top">
    <div class="ik-stage"><canvas class="ik-canvas ik-in"></canvas><div class="ik-box ik-box-in"></div></div>
    <span class="ik-op">∗</span>
    <div class="ik-mid">
      <div class="ik-terms"></div>
      <div class="ik-sum"><span class="ik-eq2">=</span><span class="ik-result">–</span></div>
    </div>
    <span class="ik-op ik-op-eq">=</span>
    <div class="ik-stage"><canvas class="ik-canvas ik-out"></canvas><div class="ik-box ik-box-out"></div></div>
  </div>
  <div class="ik-divider"></div>
  <div class="ik-bot">
    <div class="ik-hist" data-dist="px"></div>
    <span class="ik-op">∗</span>
    <div class="ik-hist" data-dist="py"></div>
    <span class="ik-op">=</span>
    <div class="ik-hist" data-dist="pxy"></div>
  </div>
</div>

<p align="center"><em>Material de apoio da disciplina com acesso rápido aos arquivos em PDF, download direto e apresentação online para slides.</em></p>

## Plano de aula

---
<div class="icon-actions" markdown="1">
[:fontawesome-regular-file-pdf:](https://github.com/lucaslrodri/PDS-Aulas/blob/main/pds-plano-de-aula/pds-plano-de-aula.pdf){: .icon-card aria-label="Abrir PDF" target=_blank }

[:octicons-download-16:](https://raw.githubusercontent.com/lucaslrodri/PDS-Aulas/main/pds-plano-de-aula/pds-plano-de-aula.pdf){: .icon-card aria-label="Download PDF" target=_blank }
</div>
---

## Conteúdo da disciplina

{% for unit in units %}

### Unidade temática {{ unit.number }}: {{ unit.title }} :material-calendar-text:{ .tooltip-info title="{{ unit.meetings }} Encontros" }

> {{ unit.topics }}

---
<div class="icon-actions" markdown="1">
{% for action in unit.actions %}
{{ action.markdown }}
{% endfor %}
</div>
---
{% endfor %}

## Ministrante

<div class="docente-card">
  <div class="docente-avatar-wrapper">
    <img class="docente-avatar" src="assets/glaceon_avatar.svg" alt="Avatar do docente">
  </div>
  <div class="docente-info">
    <span class="docente-label">Docente</span>
    <strong class="docente-name">Prof. Dr. Lucas Lima Rodrigues</strong>
    <a class="docente-github" href="https://github.com/lucaslrodri" target="_blank" rel="noopener">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-hidden="true"><path d="M8 0c4.42 0 8 3.58 8 8a8.013 8.013 0 0 1-5.45 7.59c-.4.08-.55-.17-.55-.38 0-.27.01-1.13.01-2.2 0-.75-.25-1.23-.54-1.48 1.78-.2 3.65-.88 3.65-3.95 0-.88-.31-1.59-.82-2.15.08-.2.36-1.02-.08-2.12 0 0-.67-.22-2.2.82-.64-.18-1.32-.27-2-.27-.68 0-1.36.09-2 .27-1.53-1.03-2.2-.82-2.2-.82-.44 1.1-.16 1.92-.08 2.12-.51.56-.82 1.28-.82 2.15 0 3.06 1.86 3.75 3.64 3.95-.23.2-.44.55-.51 1.07-.46.21-1.61.55-2.33-.66-.15-.24-.6-.83-1.23-.82-.67.01-.27.38.01.53.34.19.73.9.82 1.13.16.45.68 1.31 2.69.94 0 .67.01 1.3.01 1.49 0 .21-.15.45-.55.38A7.995 7.995 0 0 1 0 8c0-4.42 3.58-8 8-8Z"/></svg>
      @lucaslrodri
    </a>
  </div>
</div>
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

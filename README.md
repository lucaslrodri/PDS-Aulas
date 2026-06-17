# PDS-Aulas

Repositório de apoio para as aulas de Processamento Digital de Sinais do curso de Engenharia Elétrica da UFAC. Ministrado pelo prof. Dr. Lucas Lima Rodrigues.

## Site em Mkdocs

Site em MkDocs para acesso fácil às aulas e materiais da disciplina.

A página inicial é gerada no build pelo plugin mkdocs-macros (`main.py`), a
partir de `data/pds-plano.json`. O mesmo build compila os slides Typst em HTML
(Touying). Não há scripts auxiliares: `mkdocs build` faz tudo.

## Tasks via uv

- Listar tasks: `uv run poe`
- Sincronizar ambiente: `uv run poe sync`
- Rodar local: `uv run poe serve`
- Build do site (gera slides + página): `uv run poe build`
- Deploy no gh-pages: `uv run poe deploy`

## Licença

[![CC BY-NC-SA 4.0](https://mirrors.creativecommons.org/presskit/buttons/88x31/svg/by-nc-sa.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

Este material está licenciado sob [Creative Commons Atribuição-NãoComercial-CompartilhaIgual 4.0 Internacional (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/). Ver `LICENSE` para o texto completo.
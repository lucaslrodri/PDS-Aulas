#import "@preview/touying:0.7.3": *
#import "@local/touying-ufac:0.0.1": *

#show: ufac-theme.with(aspect-ratio: "16-9", progress-bar: false, config-info(
  title: [Introdução aos sistemas de controle],
  subtitle: [Parte I - Introdução],
  author: [Prof. Dr. Lucas Lima Rodrigues],
  subject: [Processamento Digital de Sinais],
  subject-code: [CCET387],
))

#title-slide()

= Apresentação do curso

== Plataformas de apoio

=== WhatsApp (Grupo)

Link do grupo: \
#note-box(color: colors.safe)[#icon-inline(
    "link",
    color: luma(100),
  ) #safe[https://chat.whatsapp.com/K8iED9YNFFl2aQX13lgIfo]
]
#figure(
  image("assets/pds-grupo.png", height: 50%),
)

== Google Classroom
#grid(
  columns: (1fr, 1fr),
  align: horizon,
  text(size: 1.35em)[Código da turma: *3xiikhzd*], figure(image("assets/codigo-da-turma.png", width: 95%)),
)

== Ementa oficial

#block(height: 66%)[
  #columns(2)[
    - Introdução e breve *histórico* sobre o controle automático;
    - *Modelagem* matemática de sistemas dinâmicos;
    - Técnicas de *linearização*;
    - Função de transferência;
    - *Diagrama de blocos* de diagrama de fluxo;
    #colbreak()
    - *Estabilidade*;
    - Resposta transitória e em regime permanente;
    - Sensitividade;
    - Método do *lugar das raízes*;
    - Teoria e técnica de projeto de controladores tais como PID, Lead, Lag e Lead-Lag.
  ]
]
#note-box(color: colors.primary)[
  Os tópicos descritos serão desenvolvidos para sistemas *contínuos* e *discretos* no tempo.
]


== Estrutura do curso

#let unidades-tematicas = (
  "Introdução aos sistemas de controle",
  "Modelagem matemática de sistemas de controle",
  "Análise da resposta de sistemas de controle",
  "Análise e projeto de sistemas de controle",
)

Consiste em #unidades-tematicas.len() unidades temáticas:

#for (unidade, assunto) in unidades-tematicas.enumerate(start: 1) [
  / Unidade #numbering("I", unidade): #assunto
]

---

=== Unidade I: Introdução aos sistemas de controle
- Introdução e breve histórico sobre o controle automático;
- Classificação de sistemas de controle;

=== Unidade II: Modelagem matemática de sistemas de controle
- Revisão de sistemas lineares;
- Algebra de blocos;
- Modelagem matemática de sistemas dinâmicos;
- Técnicas de linearização;

---

=== Unidade III: Análise da resposta de sistemas de controle
- Resposta transitória e em regime permanente;
- Indentificação e classificação de sistemas;
- Estabilidade;
- Sensitividade;

=== Unidade IV: Análise e projeto de sistemas de controle
- Método do lugar das raízes;
- Compensação Lead, Lag e Lead-Lag usando o método do lugar das raízes;
- Controladores PID;

== Cronograma previsto

#block[
  #set text(size: .892em)
  #table(
    align: center + horizon,
    columns: (1fr, auto, auto, auto),
    [Assunto], [Encontros], [Aulas], [Carga horária],
    [I - Introdução aos sistemas de controle], [3], [6], [5h00min],
    [II - Modelagem matemática de sistemas de controle], [17], [34], [28h20min],
    dark[P1 - Prova 1], [1], [2], [1h40min],
    [III - Análise da resposta de sistemas de controle], [15], [30], [25h],
    dark[P2 - Prova 2], [1], [2], [1h40min],
    [IV - Análise e projeto de sistemas de controle], [15], [30], [25h],
    dark[P3 - Prova 3], [1], [2], [1h40min],
    dark[A4 - Projeto final], [1], [2], [1h40min],
    [*Total*], [*54*], [*108*], [*90h*],
  )
]

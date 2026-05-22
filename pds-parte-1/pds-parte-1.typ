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

=== Github (Aulas e materiais)
#figure(image("./assets/github-printscreen.png", height: 60%))

#note-box(color: colors.safe)[#icon-inline(
    "link",
    color: luma(100),
  ) #safe[https://github.com/lucaslrodri/PDS-Aulas.git]
]

== Ementa oficial

#block(height: 75%)[
  #columns(2)[
    - Sinais e sistemas de tempo discreto;
    - Transformada de Fourier de tempo discreto (DFT);
    - Aplicações da DFT - Análise espectral de sinais;
    - Série Discreta de Fourier;
    - Transformada Discreta de Fourier;
    - Resposta em frequência;
    - Transformada Z;
    // #colbreak()
    - Amostragem e reconstrução de sinais;
    - Sistemas FIR e IIR;
    - Projeto de filtros digitais tipo FIR e IIR;
    - Análise de sistemas de tempo discreto;
  ]
]

== Objetivos do curso

#fancy-box(title: [Objetivo principal])[
  Capacitar o aluno para desenvolver sistemas de processamento de sinais digitais e realizar sua implementação em dispositivos dedicados.
]

---

=== Objetivos específicos
- Realizar aplicações envolvendo análise espectral e filtragem digital;
- Realizar amostragem e reconstrução de sinais;
- Desenvolver algoritmos para processamento digital de sinais;
- Realizar o projeto de filtros Digitais IIR e FIR.

== Estrutura do curso

#let unidades-tematicas = (
  "Sinais de tempo discreto",
  "Sistemas de tempo discreto",
  "Transformada de Fourier de tempo discreto (DFT)",
  "Série de Fourier de tempo discreto",
  "Transformada Z",
  "Amostragem e reconstrução de sinais",
  "Filtros digitais FIR",
  "Filtros digitais IIR",
)

Consiste em #unidades-tematicas.len() unidades temáticas:

#for (unidade, assunto) in unidades-tematicas.enumerate(start: 1) [
  / Unidade #numbering("I", unidade): #assunto
]

---

=== Unidade I: Sinais de tempo discreto
- Sinais discretos;
- Propriedades e operações com Sinais Discretos;
- Sinais elementares;
- Propriedades de Sinais Discretos.

---

=== Unidade II: Sistemas de tempo discreto
- Sistemas discretos;
- Propriedades e operações com sistemas discretos;
- Sistemas Lineares e Invariantes no Tempo (SLIT);
- Propriedades de SLIT.

---

=== Unidade III: Transformada de Fourier de tempo discreto (DFT)
- Resposta no domínio da frequência;
- Transformada de Fourier de Tempo Discreto (DFT);
- Propriedades da DFT;
- Implementação da DFT e Transformada Rápida de Fourier (FFT);
- Aplicações da DFT.

---

=== Unidade IV: Série de Fourier de tempo discreto
- Série de Fourier de Tempo Discreto;
- Propriedades da Série de Fourier de Tempo Discreto;
- Relação entre a DFT e a Série de Fourier de Tempo Discreto.

---

=== Unidade V: Transformada Z
- Definição de transformada Z;
- Propriedades da transformada Z;
- Relação entre a DFT e a transformada Z;
- Transformada unilateral e bilateral;
- Aplicações da transformada Z.

---

=== Unidade VI: Amostragem e reconstrução de sinais
- Definição de amostragem;
- _Aliasing_ e Teorema de amostragem de Nyquist-Shannon;
- Taxa de amostragem e quantização (Relacionada à amostragem);
- Reconstrução de sinais a partir de amostras;
- Superamostragem e subamostragem;
- Aplicações da amostragem.

---

=== Unidade VII: Filtros digitais FIR
- Definição e classificação de filtros digitais;
- Janelamento de filtros FIR;
- Implementação e aplicação de filtros digitais FIR.

---

=== Unidade VIII: Filtros digitais IIR
- Filtros analógicos (Butterworth, Chebyshev, Elíptico);
- Conversão de filtros analógicos para digitais;
- Implementação e aplicação de filtros digitais IIR;
- Comparação entre filtros FIR e IIR.

== Cronograma previsto

// #let primary-cell(body, side: "center") = {
//   if side == "left" {
//     table.cell(fill: colors.primary, stroke: colors.light)[
//       #set text(fill: colors.light, weight: "bold")
//       #body
//     ]
//   }else if side == "right" {
//     table.cell(fill: colors.primary, stroke: colors.light)[
//       #set text(fill: colors.light, weight: "bold")
//       #body
//     ]
//   }else {
//     table.cell(fill: colors.primary, stroke: colors.light)[
//       #set text(fill: colors.light, weight: "bold")
//       #body
//     ]
//   }
// }

#block[
  #set text(size: .892em)
  #table(
    align: center + horizon,
    columns: (1fr, auto, auto, auto),
    table.header([Assunto], [Encontros], [Aulas], [Carga horária]),
    [I - Sinais de tempo discreto], [4], [8], [6h40m],
    [II - Sistemas de tempo discreto], [4], [8], [6h40m],
    [$P_1$ - Prova 1], [1], [2], [1h40m],
    [III - Transformada de Fourier de tempo discreto (DFT)], [4], [8], [6h40m],
    [IV - Série de Fourier de tempo discreto], [4], [8], [6h40m],
    [V - Transformada Z], [4], [8], [6h40m],
    [$P_2$ - Prova 2], [1], [2], [1h40m],
    [VI - Amostragem e reconstrução de sinais], [4], [8], [6h40m],
    [VII - Filtros digitais FIR], [4], [8], [6h40m],
    [VIII - Filtros digitais IIR], [4], [8], [6h40m],
    [$P_3$ - Prova 3], [1], [2], [1h40m],
    [$T$ - Trabalho final], [1], [2], [1h40m],
    [*Carga horária total*], [*36*], [*72*], [*60h*],
  )
]

== Bibliografia

=== Principal

#figure(
  image("assets/livro-principal.jpg", height: 70%),
  caption: [NALON, José Alexandre. *Introdução ao Processamento Digital de Sinais*. Rio de Janeiro: LTC, 2009. 220 p.],
)

=== Adicional

- CHEN, C. T., *Digital Signal Processing – Spectral computation and filter design*, Oxford University Press, 2001.
- PROAKIS J. G., MANOLAKIS D. G., *Digital signal processing - principles, algorithms and applications*, Prentice Hall, 1996.
- SCHILLING, Robert J.; HARRIS, Sandra L. *Digital signal processing using MATLAB*, Cengage Learning, 2016.

---

=== Complementar

- ALKIN, O., *Digital Signal Processing: A Laboratory Approach Using DSP*, Prentice Hall, 1994.
- HU, G. S. *Introduction to digital signal processing*. Beijing: Tsinghua University Press, 2005.
- TAN, Lizhe; JIANG, Jean. *Digital signal processing: fundamentals and applications*. Academic Press, 2018.
- KARL, John H. *An introduction to digital signal processing*. Elsevier, 2012.
- FRERKING, Marvin. *Digital signal processing in communications systems*. Springer Science & Business Media, 2013.
- OPPENHEIM, A. V., SCHAFER, R. W., *Discrete-Time Signal Processing*, Prentice Hall, 1999.


== Avaliações

=== Visão geral

As avaliações das disciplinas serão compostas por:
- 3 provas escritas ($P_i$ com $i in {1, 2, 3}$);
- 3 Listas de exercícios ($L_i$ com $i in {1, 2, 3}$, uma para cada prova);
- 1 trabalho final ($T$).

---

=== Notas parciais $A_i$

Cada prova e cada lista irá compor uma nota parcial dada por:

$
  A_i = "0,7" dot P_i + "0,3" dot L_i
$

Sendo $i in {1, 2, 3}$.

---

=== Notas parciais $N_1$ e $N_2$

As notas parciais, $N_1$ e $N_2$, serão dadas por:

#grid(columns: (1fr, 1fr))[
  $
    N_1 = (A_1 + A_2)/2
  $
][
  $
    N_2 = (A_3 + T)/2
  $
]

=== Nota final $N_f$

A nota final, $N_f$, será dada por:

$
  N_f = (N_1 + N_2)/2
$

Caso o discente não atinja média 8,0, será realizada uma avaliação que terá o valor do exame final.

=== Sobre os Exercícios

- Compreendem em exercícios teóricos e práticos;
- Os exercicios devem ser entregues até o dia da prova correspondente.

==== Exercícios teóricos
- Devem ser entregues a mão digitalizados em pdf no Classroom.
==== Exercícios práticos
- Devem ser entregue o código (Python ou Matlab) e o relatório (Em pdf) no Classroom.

---

=== Trabalho final

- Tema livre sobre a aplicação de técnicas de processamento digital de sinais e filtros digitais;
- Exemplo:
  - Projeto de um filtro digital para remoção de ruído em um sinal de áudio;
  - Projeto de um filtro digital para remoção de interferência em um sinal de ECG;
  - Etc.
- Cada equipe irá implementar o projeto proposto considerando uma classe de filtros diferente (FIR ou IIR);
- O trabalho deve ser apresentado na sala na forma de *seminários*.



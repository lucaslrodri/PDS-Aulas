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

= Definição de sinais

== O que é um sinal?

#v(1em)
#align(center)[
  "Um *fenômeno* que transporta informação"
]
#v(1em)

#figure(
  image("./assets/definicao-sinal-tempo.png", height: 50%),

)

---

== Exemplos de sinais

#side-by-side[
===== *Correntes* e *tensões* em um circuito elétrico

#figure(image("assets/circuito-rc-sistema.jpeg", height: 30%))
#figure(image("assets/corrente-e-tensao-circuito-eletrico-sinal.jpeg", height: 40%))
][
===== *Velocidade* e *aceleração* de um carro em movimento

#figure(image("assets/carro-em-movimento-sinais.png"))
]

#side-by-side[
  ===== *Luz* que uma máquina fotográfica recebe ao tirar uma foto e a própria *foto* gerada
  #figure(image("assets/foto-camera-fotografica-sinais.png"))
][
  ===== Sinal de *áudio (Som)* obtido em um arquivo mp3
  #figure(image("assets/sinal-audio-mp3.png"))
]

== Sinais unidimensionais e multidimensionais

#side-by-side[
  ===== #warning[Unidimensional:] Exemplo - eletrocardiograma (ECG)

  #figure(image("assets/sinal-eletrocardiograma.png"), caption: [Depende de *uma variável*.])
][
  ===== #warning[Multidimensional:] Exemplo - Imagem
  #figure(image("assets/imagem-mapa-brasil-sinal.png", height: 70%), caption: [Depende de *mais de uma variável*.])
]

== Sinal de tempo contínuo

#figure(
  table(
    columns: (1fr, 1fr),
    [Notação], [Variável independente],
    [$x(t)$], [$t in bb(R)$]
  )
)
#v(1.5em)
#grid(
  columns: (1fr, 1fr),
  align: horizon,
  [A variável independente é *contínua*],[
    #image("assets/sinal-continuo-no-tempo.png")
  ]
)

== Sinal de tempo discreto

#figure(
  table(
    columns: (1fr, 1fr),
    [Notação], [Variável independente],
    [$x[n]$], [$n in bb(Z)$]
  )
)

#v(1em)
#grid(
  columns: (1fr, 1fr),
  align: horizon,
  [A variável independente assume apenas *valores inteiros*],
  image("assets/sinal-discreto-tempo-inteiro.png")
)

== Sinais contínuos vs. sinais discretos

#quote-box[Sinais de *tempo contínuo:* A variável independente é #dark[contínua].]

#quote-box[Sinais de *tempo discreto:* A variável independente assume #dark[apenas valores inteiros].]

#v(0.5em)
#figure(
  table(
    columns: (1fr, 1fr, 1fr),
    align: (left, center, center),
    [], [Tempo contínuo], [Tempo discreto],
    [Notação], [$x(t)$], [$x[n]$],
    [Variável independente], [$t in bb(R)$], [$n in bb(Z)$]
  )
)

== Sinais amostrados

- #danger[Apenas] #dark[sinais discretos] podem ser armazenados e processados nos #dark[computadores] (*Sinais digitais*);

- Um *sinal contínuo* pode ser convertido em um sinal *discreto* (amostrado) através de um processo conhecido como *amostragem*.

#figure(image("assets/conversao-analogico-digital.png"))

---

#align(center)[
  "Um #dark[sinal contínuo] pode ser *convertido* em um sinal #dark[discreto] (amostrado) através de um processo conhecido como *amostragem*"
]

#grid(
  columns: (1fr, 1fr),
  align: horizon,
  [
    #align(center)[
    #rect[
    $
     x[n] eq.delta x(n T)
    $
    ]
    ]
    $
    t = n T
    $
  ],
  image("assets/amostragem-sinal-continuo-discreto.png")
)

- $T$ é conhecido como *período de amostragem*
- No exemplo $T = "0,5" s$

= Sinais de tempo discreto

== Definição de Sinal em Tempo Discreto

- Um sinal em *tempo discreto* pode ser representado por uma sequência de números.

=== Exemplo:

$
  x[n], n in bb(Z)
$

Cada número $x(n)$ corresponde à amplitude do sinal em um instante $n T$.

== Intervalo entre amostras

Uma função discreta pode ser obtida diretamente de uma função contínua pela operação de amostragem:

$
  x[n] = x_c (n T_a)
$

  - $n$ é um *inteiro* (índice da amostra).,
  - $T_a$ é o *intervalo* entre pontos consecutivos(período de amostragem).,
  - Seu inverso é denotado $f_a= 1/T_a$, e é chamado *frequência de amostragem*.

#example-slide(source: [Amostragem de temperatura em uma barra])[
- Temperatura medida por sensores *uniformemente espaçados* em uma barra metálica 
- $x$ é *comprimento* entre as amostras (Período de amostragem).

#figure(image("assets/temperatura-em-uma-barra.png"))

]

== Notações Usuais

=== Notação 1

  $
    x[n] in bb(Z)
  $
  - Mais comum;
  - $x[n]$ é a *n-ésima amostra*;
  - Alguns autores podem usar $x(n)$ ao invés de $x[n]$.

---
=== Notação 2
$
  x(n T_a), n in bb(Z)
$

- Alternativa;
- O intervalo $T_a$ aparece *explicitamente*.

#example-slide(source: [Amostras a cada $"0,03"$ s])[
  Se as amostras estão separadas por $"0,03"$ s, então $T_a = "0,03"$ s. Logo:

  ===== Notação 1: $x[n]$
  $
    dots, x[0], x[1], x[2], x[3], x[4], dots
  $

  ===== Notação 2: $x(n T_a)$

  $
    dots, x(0 dot "0,03"), x(1 dot "0,03"), x(2 dot "0,03"), x(3 dot "0,03"), x(4 dot "0,03"), dots
  $

  $
    dots, x(0), x("0,03"), x("0,06"), x("0,09"), x("0,12"), dots
  $
]

#example-slide(source: [Exemplo de sinal discreto com $T_a = "0,25"$ s])[
  Sejam $x_c ( t) = "0,2"t$ e $T_a = 0,25" s"$:

  #figure(
    table(
      columns: 4,
      table.header([$n$],[$n T_a$],[$x_c (n T_a)$],[$x[n]$]),
      $0$, $"0,0"$, $0$, $0$,
      $1$, $"0,25"$, $"0,05"$, $"0,05"$,
      $2$, $"0,5"$, $"0,1"$, $"0,1"$,
      $3$, $"0,75"$, $"0,15"$, $"0,15"$,
      $dots.v$, $dots.v$, $dots.v$, $dots.v$
  )
 )

 #figure(image("assets/exemplo-sistema-discreto-02-s.png", height: 14em), caption: [Em pontilhado, a função contínua original.])
]

#example-slide(source: [Exemplo de sinal discreto com $T_a = "0,1"$ s])[
  Sejam $x_c ( t) = "0,2"t$ e $T_a = 0,25" s"$:

  #figure(
  table(
    columns: 4,
    table.header([$n$],[$n T_a$],[$x_c (n T_a)$],[$x[n]$]),
    $0$, $"0,0"$, $1$, $1$,
    $1$, $"0,1"$, $cos (0,1 pi)$, $cos (0,1 pi)$,
    $2$, $"0,2"$, $cos (0,2 pi)$, $cos (0,2 pi)$,
    $3$, $"0,3"$, $cos (0,3 pi)$, $cos (0,3 pi)$,
    $dots.v$, $dots.v$, $dots.v$, $dots.v$
  )
 )

 $ 
 x[n]=x_c (n T_a)
  $ 
 #figure(image("assets/exemplo-sistema-discreto-01-s.png", height: 14em), caption: [Em pontilhado, a função contínua original.])
]

= Propriedades e operações com sinais discretos

== Operações algébricas

São as mesmas operações algébricas dos números reais, aplicadas amostra por amostra:

#fancy-box(title: [Soma de sinais])[
  $
    y[n] = x_1 [n] + x_2 [n]
  $  
]

#fancy-box(title: [Subtração de sinais])[
  $
    y[n] = x_1 [n] - x_2 [n]
  $  
]

---

#fancy-box(title: [Multiplicação de sinais])[
  $
    y[n] = x_1 [n] dot x_2 [n]
  $  
]

#fancy-box(title: [Divisão de sinais])[
  $
    y[n] = (x_1 [n]) / (x_2 [n]), "se " x_2 [n] != 0
  $  
]

e assim por diante.


== Mudança na escala de amplitude

- A amplitude de uma sequência é o valor de cada amostra;
- Modificar a amplitude = multiplicar a sequência por um escalar;

=== Operação:

$
  y[n] = c dot x[n]
$

=== Efeito:

- Se $c > 1$, o sinal é amplificado (*Sinal maior*);
- Se $0 < c < 1$, o sinal é atenuado (*Sinal menor*).

== Mudança na escala do tempo

=== Operação: 

$ y[n] = x[M n] $

com $M in bb(Z)$

=== Condições:

- $M$ deve ser inteiro (garantir amostras inteiras);

=== Efeitos:

- $M < 0$ $->$ espelhamento (*reversão* ou inversão temporal).
- $|M| > 1$ $->$ compressão (*Descarta amostras*).
- $|M| < 1$ $->$ expansão (*Alonga o sinal*).

#example-slide(source: [Reversão ou espelhamento temporal])[

Reflete o sinal em torno do eixo das ordenadas ($n=0$)
#side-by-side(align: horizon, height: 80%)[
  #figure(image("assets/sinal-original-reversao.png"), caption: [
    Sinal original
  ])
][
  #figure(image("assets/sinal-revertido-reversao-temporal.png"), caption: [
    Sinal revertido
  ])
]
]

#example-slide(source: [Compressão temporal])[
  Sejam $x[n] = cos(pi n "/" 4)$ e $y[n] = x[2n]$.
  
  === Solução

  #side-by-side(align: horizon, height: 50%)[
  O gráfico de $x[n]$ é dado por:

  #figure(image("assets/compressao-cosseno.png"))
  ][
  A sequência $y[n]=cos(pi n "/" 2)$

  #figure(image("assets/compressao-cosseno-2.png"))
  ]

  Alguns valores são perdidos na compressão temporal, pois $y[n]$ é amostrado a cada 2 amostras de $x[n]$.
]

#example-slide(source: [Compressão temporal - Exemplo 2])[
  Alguns valores podem ser *perdidos* na compressão temporal:
  #side-by-side(align: horizon, height: 80%)[
  #figure(image("assets/compressao-temporal-sinal-original.png"), caption: [Sinal original])
  ][
  #figure(image("assets/compressao-temporal-sinal-comprimido.png"), caption: [Sinal comprimido])
  ]
]

#example-slide(source: [Compressão temporal - Exemplo 3])[
  Alguns valores podem ser *perdidos* na compressão temporal:
  #side-by-side(align: horizon, height: 80%)[
  #figure(image("assets/compressao-temporal-sinal-original-ex-2.png"), caption: [Sinal original])
  ][
  #figure(image("assets/compressao-temporal-sinal-comprimido-ex-2.png"), caption: [Sinal comprimido])
  ]
]
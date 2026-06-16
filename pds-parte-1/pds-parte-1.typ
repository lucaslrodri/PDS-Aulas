#import "@preview/touying:0.7.3": *
#import "@local/touying-ufac:0.0.1": *
#import "@preview/lilaq:0.6.0" as lq


#show: ufac-theme.with(aspect-ratio: "16-9", progress-bar: false, config-info(
  title: [Sinais de tempo discreto],
  subtitle: [Parte I - Introdução],
  author: [Prof. Dr. Lucas L. Rodrigues e Omar. A. Vilcanqui],
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
    [$x(t)$], [$t in bb(R)$],
  ),
)
#v(1.5em)
#grid(
  columns: (1fr, 1fr),
  align: horizon,
  [A variável independente é *contínua*],
  [
    #image("assets/sinal-continuo-no-tempo.png")
  ],
)

== Sinal de tempo discreto

#figure(
  table(
    columns: (1fr, 1fr),
    [Notação], [Variável independente],
    [$x[n]$], [$n in bb(Z)$],
  ),
)

#v(1em)
#grid(
  columns: (1fr, 1fr),
  align: horizon,
  [A variável independente assume apenas *valores inteiros*], image("assets/sinal-discreto-tempo-inteiro.png"),
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
    [Variável independente], [$t in bb(R)$], [$n in bb(Z)$],
  ),
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
  image("assets/amostragem-sinal-continuo-discreto.png"),
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
      table.header([$n$], [$n T_a$], [$x_c (n T_a)$], [$x[n]$]),
      $0$, $"0,0"$, $0$, $0$,
      $1$, $"0,25"$, $"0,05"$, $"0,05"$,
      $2$, $"0,5"$, $"0,1"$, $"0,1"$,
      $3$, $"0,75"$, $"0,15"$, $"0,15"$,
      $dots.v$, $dots.v$, $dots.v$, $dots.v$,
    ),
  )

  #figure(
    image("assets/exemplo-sistema-discreto-02-s.png", height: 14em),
    caption: [Em pontilhado, a função contínua original.],
  )
]

#example-slide(source: [Exemplo de sinal discreto com $T_a = "0,1"$ s])[
  Sejam $x_c ( t) = "0,2"t$ e $T_a = 0,25" s"$:

  #figure(
    table(
      columns: 4,
      table.header([$n$], [$n T_a$], [$x_c (n T_a)$], [$x[n]$]),
      $0$, $"0,0"$, $1$, $1$,
      $1$, $"0,1"$, $cos (0,1 pi)$, $cos (0,1 pi)$,
      $2$, $"0,2"$, $cos (0,2 pi)$, $cos (0,2 pi)$,
      $3$, $"0,3"$, $cos (0,3 pi)$, $cos (0,3 pi)$,
      $dots.v$, $dots.v$, $dots.v$, $dots.v$,
    ),
  )

  $
    x[n]=x_c (n T_a)
  $
  #figure(
    image("assets/exemplo-sistema-discreto-01-s.png", height: 14em),
    caption: [Em pontilhado, a função contínua original.],
  )
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

#figure(
  image("assets/mudanca-escala-amplitude.png", width: 60%),
  caption: [Multiplicação por um escalar.],
)

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

== Deslocamento no tempo

#side-by-side[
  === Operação:

  $
    y[n] = x[n - k], k in bb(Z)
  $

  === Efeito:

  - $k > 0$ $->$ atraso: Desloca as amostras à *direita*;
  - $k < 0$ $->$ avanço: Desloca as amostras à *esquerda*.

][#figure(
  image("assets/deslocamento-temporal-esquerda.png", width: 80%),
  caption: [Deslocamento a esquerda no gráfico de sequëncia],
)]

=== Implementação:

- Usando em sistemas digitais via memórias.
- Cada atraso é uma unidade em memória.

#example-slide(source: [Implementação de um atraso unitário])[
  ```c
  int previous_temp = 0; // Registrador de memória do atraso unitário (Z^-1)
  // aqui vai um código aleatório
  // Declaração da função do atraso unitário
  int processUnitDelay(int current_temp) {
    // 1. Pega o valor armazenado no ciclo anterior
    int output = previous_temp;

    // 2. Atualiza a memória com o valor mais recente
    previous_temp = current_temp;

    // 3. Retorna a amostra atrasada
    return output;
  }
  ```

  === Solução em hardware:

  #quote-box[
    https://www.tinkercad.com/things/cHqhEMUTZmc-unit-delay-pds
  ]
]

#example-slide(source: [Diferença de sinais])[
  Um sinal discreto é dado por:
  $
    x[n] = cases(
      1", se" n = -1 "e" n = 1,
      0", caso contrário "
    )
  $

  + Faça esbolce o gráfico de $x[n]$.
  + Encontre $y[n] = x[n] - x[n-1]$ e esbolce gráficamente.

  #pagebreak()

  === Solução

  #let x-fn(n) = if n == -1 or n == 1 { 1 } else { 0 }
  #let y-fn(n) = x-fn(n) - x-fn(n - 1)
  #let ns = range(-3, 4)

  / Parte 1: Esboço de $x[n]$
  #figure(lq.diagram(
    xlabel: [$n$],
    ylabel: [$x[n]$],
    xlim: (-3.5, 3.5),
    ylim: (-0.5, 1.5),
    height: 6cm,
    lq.stem(ns, ns.map(x-fn), base-stroke: black),
  ))
  #pagebreak()
  / Parte 2: $y[n] = x[n] - x[n-1]$

  #side-by-side(height: auto)[
    $
      x[n] = cases(
        1", se" n = -1 "e" n = 1,
        0", caso contrário"
      )
    $
    $
      x[n - 1] = cases(
        1", se" n = 0 "e" n = 2,
        0", caso contrário"
      )
    $
  ][
    Logo $y[n] = x[n] - x[n-1]$:
    #figure(lq.diagram(
      xlabel: [$n$],
      ylabel: [$y[n]$],
      xlim: (-3.5, 3.5),
      ylim: (-1.5, 1.5),
      height: 6cm,
      lq.stem(ns, ns.map(y-fn), base-stroke: black),
    ))
  ]
]

== Transformação linear da variável independente (Tempo)

Uma transformação linear na variável independente é dada por:

$
  n -> alpha n + beta
$

E consequentemente, a operação correspondente em um sinal discreto é dada por:

$
  x[n] -> x[alpha n + beta]
$

---
$
  x[n] -> x[alpha n + beta]
$

=== Analisando o efeito de $alpha$

- Se $|alpha| > 1$, tem-se uma *compressão* linear;
- Se $|alpha| < 1$, tem-se uma *dilatação* linear;
- Se $alpha < 0$, tem-se uma *inversão* temporal;
  - Com compressão ou dilatação, dependendo do valor de $|alpha|$;

---
$
  x[n] -> x[alpha n + beta]
$


=== Analisando o efeito de $beta$

- Se $beta > 0$, o sinal é *atrasado*;
- Se $beta < 0$, o sinal é *adiantado*.

#fancy-box(title: [Observação])[
  No caso de múltiplas operações começa-se pelo:
  - $beta$
  - e depois pelo $alpha$.
]

#exercise-slide()[
  Um sinal de tempo discreto $x[n]$ é definido por:
  $
    x[n] = cases(
      1 ", se" n=1","2,
      -1 ", se" n=-1","-2,
      0 ", se" n = 0 "ou" |n| > 2
    )
  $

  + Esboce o gráfico de $x[n]$.
  + Encontre $y[n] = x[2 n + 3]$ e esboce graficamente.

]



== Diferenças e acumulação

=== Diferença:
Análoga à derivada.

$
  (d x_c (t))/(d t) approx (Delta x_c (t))/(Delta t)
$

$
  (d x_c (t))/(d t) approx 1/T_a (x[n] - x[n-1])
$

A *primeira diferença* é dada por:

$
  Delta x[n] = x[n] - x[n-1]
$
=== Acumulação:
Análoga à integral.

$
  y[n] = sum_(k=-infinity)^(n) x[k]
$

---

=== Relação entre diferença e acumulação

#quote-box[
  São operações inversas entre si.
]

Aplicando a primeira diferença na acumulação, temos:

$
  Delta y[n] = y[n] - y[n-1] = sum_(k=-infinity)^n x[n] - sum_(k=-infinity)^(n-1) x[n] = x[n]
$

---

Da mesma forma, calculando a acumulação da primeira diferença, temos:

$
  sum_(k=-infinity)^n Delta x[k] = sum_(k=-infinity)^n (x[k] - x[k-1]) \
  = sum_(k=-infinity)^n x[k] - sum_(k=-infinity)^n x[k-1] \
  = sum_(k=-infinity)^n x[k] - sum_(k=-infinity)^(n-1) x[k] \
  = x[n]
$

#exercise-slide(source: [Acumulador])[
  Implemente um acumulador no TinkerCad usando a lógica do Arduino. Siga como base o exemplo de código dado no exercício de delay unitário.
]

== Partes real e imaginária

Uma sequência complexa pode ser decomposta por:

$
  x[n] = x_R [n] + j x_I [n]
$

Onde:

#bullet-list[
  #set list(indent: 1em)
  - Parte real: $Re(x[n]) = x_R[n]$
  - Parte imaginária: $Im(x[n]) = x_I[n]$
]
Usando o operador de *complexo conjugado*, temos:

$
  x^* [n] = x_R [n] - j x_I [n]
$

#columns(2)[
  $
    x_R [n] = (x[n] + x^* [n])/2
  $
  #colbreak()
  $
    x_I [n] = (x[n] - x^* [n])/(2j)
  $
]

== Paridade e simetria conjugada

#quote-box(color: colors.safe)[
  / Sequência par: $x[n] = x[-n]$ (Simetria par)
]

#quote-box(color: colors.danger)[
  / Sequência ímpar: $x[n] = -x[-n]$ (Simetria ímpar)
]



#fancy-box(title: [Considerações])[
  Uma sequência pode ser
  - Par, Ímpar ou nenhuma das duas;
  - #danger[Nunca] par e ímpar ao mesmo tempo, exceto se for a sequência nula.
]

---

=== Decomposição

Pode-se decompor uma sequência em partes par e ímpar:

$
  x[n] = x_e [n] + x_o [n]
$

Onde:
#columns(2)[
  $
    x_e [n] = (x[n] + x[-n])/2
  $
  #colbreak()
  $
    x_o [n] = (x[n] - x[-n])/2
  $
]

E:
- $x_e [n]$ é a parte *par* (_even_) de $x[n]$;
- $x_o [n]$ é a parte *ímpar* (_odd_) de $x[n]$.

#example-slide(source: [Exemplo de decomposição em partes par e ímpar])[
  Determine se a seguinte sequência é par, ímpar ou nenhuma das duas:

  $
    x[n] = n^2
  $

  === Solução

  / Passo 1: Calculando $x[-n]$:
  $
    x[-n] = (-n)^2 = n^2
  $

  #pagebreak()

  / Passo 2: Decompondo em partes par e ímpar:
  Para a parte par:
  $
    x_e [n] = (x[n] + x[-n])/2 = (n^2 + n^2)/2 = n^2
  $
  Para a parte impar:
  $
    x_o [n] = (x[n] - x[-n])/2 = (n^2 - n^2)/2 = 0
  $
  Logo o sinal é par.
]

#exercise-slide()[
  Verifique se as sequências abaixo são pares, ímpares ou nenhuma das duas. Decomponha cada sequência em partes par e ímpar.

  + $x[n] = n^3$
  + $x[n] = n + 1$


  #pagebreak()
  === Resposta
  + $x[n] = n^3$

  #columns(2)[
    Parte par:
    $
      x_e [n] = 0
    $
    #colbreak()
    Parte ímpar:
    $
      x_o [n] = n^3
    $
  ]
  Logo o sinal é ímpar.

  + $x[n] = n + 1$
  #columns(2)[
    Parte par:
    $
      x_e [n] = 1
    $
    #colbreak()
    Parte ímpar:
    $
      x_o [n] = n
    $
  ]
  Logo o sinal é nenhuma das duas.
]

#exercise-slide[
  Considere o sinal discreto definido por:
  $
    x[n] = cases(
      1", se  " n>=0,
      0", caso contrário"
    )
  $

  + Represente graficamente o sinal.
  + Decomponha o sinal em parte par ($x_e [n]$) e ímpar ($x_o [n]$).

  #pagebreak()
  === Resposta

  #let x-fn(n) = if n >= 0 { 1 } else { 0 }
  #let xe-fn(n) = if n == 0 { 1 } else { 0.5 }
  #let xo-fn(n) = if n > 0 { 0.5 } else if n < 0 { -0.5 } else { 0 }
  #let ns = range(-5, 6)

  + Representação gráfica de $x[n]$:

  #figure(lq.diagram(
    xlabel: [$n$],
    ylabel: [$x[n]$],
    xlim: (-5.5, 5.5),
    ylim: (-0.5, 1.5),
    height: 5cm,
    lq.stem(ns, ns.map(x-fn), base-stroke: black),
  ))

  #pagebreak()

  // + Decomposição em partes par e ímpar:

  // / Passo 1: Calculando $x[-n]$:
  // $
  //   x[-n] = cases(
  //     1", se  " n<=0,
  //     0", caso contrário"
  //   )
  // $

  // / Passo 2: Parte par $x_e [n] = (x[n] + x[-n]) \/ 2$:
  // $
  //   x_e [n] = cases(
  //     (1+0)/2 = 1/2 \, & n > 0,
  //     (1+1)/2 = 1 \, & n = 0,
  //     (0+1)/2 = 1/2 \, & n < 0
  //   )
  //   = cases(
  //     1 \, & n = 0,
  //     1/2 \, & n != 0
  //   )
  // $

  // / Passo 3: Parte ímpar $x_o [n] = (x[n] - x[-n]) \/ 2$:
  // $
  //   x_o [n] = cases(
  //     (1-0)/2 = 1/2 \, & n > 0,
  //     (1-1)/2 = 0 \, & n = 0,
  //     (0-1)/2 = -1/2 \, & n < 0
  //   )
  //   = cases(
  //     1/2 \, & n > 0,
  //     0 \, & n = 0,
  //     -1/2 \, & n < 0
  //   )
  // $

  $
    x_e [n] = cases(
      1 \, & n = 0,
      1/2 \, & n != 0
    ) quad "e" quad x_o [n] = cases(
      1/2 \, & n > 0,
      0 \, & n = 0,
      -1/2 \, & n < 0
    )
  $

  Representações gráficas:

  #columns(2)[
    #figure(lq.diagram(
      xlabel: [$n$],
      ylabel: [$x_e [n]$],
      xlim: (-5.5, 5.5),
      ylim: (-0.5, 1.5),
      height: 4cm,
      lq.stem(ns, ns.map(xe-fn), base-stroke: black),
    ))
    #colbreak()
    #figure(lq.diagram(
      xlabel: [$n$],
      ylabel: [$x_o [n]$],
      xlim: (-5.5, 5.5),
      ylim: (-1, 1),
      height: 4cm,
      lq.stem(ns, ns.map(xo-fn), base-stroke: black),
    ))
  ]
]

#exercise-slide[
  Dados os sinais a seguir. Determine se o sinal é par ou ímpar. Se o sinal não for par nem ímpar encontre a componente par e ímpar:

  + $x[n] = 2^n$
  + $x[n] = (-2)^n$
  + $x[n] = e^(j omega n)$
  + $x[n] = n^2 mod 3$

  #pagebreak()
  === Resposta

  #set text(size: .85em)
  #table(
    columns: (auto, 1fr, 1fr, 1fr),
    align: center + horizon,
    table.header([Sinal], [Classificação], [$x_e [n]$], [$x_o [n]$]),
    [$2^n$], [nenhuma], [$(2^n + 2^(-n))/2$], [$(2^n - 2^(-n))/2$],
    [$(-2)^n$], [nenhuma], [$(-1)^n (2^n + 2^(-n))/2$], [$(-1)^n (2^n - 2^(-n))/2$],
    [$e^(j omega n)$], [nenhuma], [$cos(omega n)$], [$j sin(omega n)$],
    [$n^2 mod 3$], [*par*], [$n^2 mod 3$], [$0$],
  )
]

= Perioticidade de sinais discretos


== Sinais periódicos

Um sinal *discreto*, diz-se *periódico* quando existe $N in bb(Z)^+$, tal que:

$
  x[n] = x[n + N], quad forall n in bb(Z)
$

- O parâmetro $N in bb(Z)^+$ é chamado de *período do sinal*.

---

=== Aplicações de sinais periódicos

#quote-box(color: colors.safe)[Sequências periódicas são fundamentais no estudo de sinais digitais;]
#quote-box(color: colors.primary)[Suas propriedades influenciam diretamente o *projeto de sistemas digitais*;]
#quote-box(
  color: colors.danger,
)[Análise de perioticidade é a base para #danger[filtragem, compressão e transmissão de sinais];]


== Período fundamental

Periodo fundamental ($N_0$) é o *menor valor positivo e inteiro* tal que:

$
  x[n] = x[n + N_0], quad forall n in bb(Z)
$

=== Sinal aperiódico

Se não existe $N_0$ que satisfaça a condição acima, diz-se que a sequência *não é periódica*.

== Período

Se $x[n]$ é periódico com período fundamental $N_0$, então:

$
  x[n] = x[n + m N_0], quad forall n in bb(Z)
$

com $m = 1, 2, 3, 4, dots$.

#fancy-box(title: [Isto é:])[
  - $x[n]$ *também é periódico* com período $2N_0$, $3N_0$, $4N_0$, etc.
]


== Período de um sinal constante

Um sinal constante discreto:

$
  x[n] = c
$

é *periódico* com período fundamental $N_0 = 1$.

#example-slide(source: [Período de um sinal periódico])[
  Mostre que o sinal:

  $
    x[n] = sin(pi/4 n)
  $

  é periódico.

  === Solução


  Substituindo $n = n + N$ na expressão do sinal, temos:
  $
    x[n + N] = sin(pi/4 (n + N)) = sin(pi/4 n + pi/4 N)
  $

  Sabemos que a função seno é periódica com o período $2 pi$.

  #pagebreak()

  Logo, para que $x[n]$ seja periódico, é necessário que:

  $
    (pi N) /4 = 2 pi m, quad m in bb(Z)
  $

  Portanto:

  $
    N = 8 m, quad m in bb(Z)
  $

  Escolhendo o menor valor positivo de $N$ que satisfaz a condição acima, temos:

  $
    N_0 = 8
  $
]

== Soma de sinais periódicos

Sejam:
- $x_1 [n]$ uma sequência periódica com período fundamental $N_1$;
- $x_2 [n]$ uma sequência periódica com período fundamental $N_2$.

E:

$
  y[n] = x_1 [n] + x_2 [n]
$

---

Para que $y[n]$ seja periódico:

$
  y[n] = y[n + N], quad forall n in bb(Z)
$

É necessário que exista um período $N$ tal que:

$
  N = k_1 N_1 = k_2 N_2, quad k_1, k_2 in bb(Z)^+
$

Ou seja, $N$ deve ser um múltiplo comum de $N_1$ e $N_2$.

$
  "mmc"(N_1, N_2)
$

#example-slide(source: [Período da soma de sinais periódicos])[
  Sejam:
  $ x_1[n] = cos(pi/3 n) $
  $ x_2[n] = sin(pi/2 n) $
  Encontre o período fundamental de $y[n] = x_1 [n] + x_2 [n]$.

  #pagebreak()

  === Solução

  ===== Período fundamental de $x_1[n]$:

  $
    (pi N_1) / 3 = 2 pi m_1 => N_1 = 6 m_1, quad m_1 in bb(Z)^+
  $

  O menor valor positivo é $N_1 = 6$.

  ===== Período fundamental de $x_2[n]$:

  $
    (pi N_2) / 2 = 2 pi m_2 => N_2 = 4 m_2, quad m_2 in bb(Z)^+
  $

  O menor valor positivo é $N_2 = 4$.

  #pagebreak()

  ===== Período fundamental de $y[n]$:

  O período de $y[n]$ é o mmc de $N_1$ e $N_2$:

  $
    N_0 = "mmc"(N_1, N_2) = "mmc"(6, 4) = 12
  $

  ===== Verificação gráfica:


  #let x1-fn(n) = calc.cos(n * calc.pi / 3)
  #let x2-fn(n) = calc.sin(n * calc.pi / 2)
  #let y-fn(n) = x1-fn(n) + x2-fn(n)
  #let ns-plot = range(-10, 11)


  #columns(3)[
    #figure(
      lq.diagram(
        xlabel: [$n$],
        ylabel: [$x_1[n]$],
        xlim: (-10.5, 10.5),
        ylim: (-1.5, 1.5),
        height: 3cm,
        lq.stem(ns-plot, ns-plot.map(x1-fn), base-stroke: black),
      ),
    )
    #colbreak()

    #figure(
      lq.diagram(
        xlabel: [$n$],
        ylabel: [$x_2[n]$],
        xlim: (-10.5, 10.5),
        ylim: (-1.5, 1.5),
        height: 3cm,
        lq.stem(ns-plot, ns-plot.map(x2-fn), base-stroke: black),
      ),
    )
    #colbreak()

    #figure(
      lq.diagram(
        xlabel: [$n$],
        ylabel: [$y[n]$],
        xlim: (-10.5, 10.5),
        ylim: (-2.5, 2.5),
        height: 3cm,
        lq.stem(ns-plot, ns-plot.map(y-fn), base-stroke: black),
      ),
    )

  ]

]

#exercise-slide()[
  Determine se os sinais $x[n]$ a seguir são periódicos. Se forem periódicos, encontre o período fundamental.

  + $x[n] = cos(n)$
  + $x[n] = cos(pi n)$
  + $x[n] = n mod 3$
  + $x[n] = cos((3 pi)/4 n + pi/8)$
  + $x[n] = cos(pi/3 n) + sin(pi/5 n)$
  + $x[n] = cos^2(pi/8 n)$

  #pagebreak()

  === Solução

  + $x[n] = cos(n)$, não periódico
  + $x[n] = cos(pi n)$, periódico com período fundamental $N_0 = 2$
  + $x[n] = n mod 3$, periódico com período fundamental $N_0 = 3$
  + $x[n] = cos((3 pi)/4 n + pi/8)$, periódico com período fundamental $N_0 = 8$
  + $x[n] = cos(pi/3 n) + sin(pi/5 n)$, periódico com período fundamental $N_0 = 30$
  + $x[n] = cos^2(pi/8 n)$, periódico com período fundamental $N_0 = 16$


]

= Sinais de potência e sinais de energia

== Caso contínuo

Num circuito elétrico com uma só resistência, $R$, a potência instantânea $p(t)$ é dada por:

#grid(columns: (1fr, 1fr), align: (left + horizon, right + horizon))[
  $
    p(t) = R i(t)^2 = v(t)i(t) = 1/ R v(t)^2
  $
][
  #figure(image("assets/potencia-resistor.png", height: 6em))
]

E a energia dissipada na resistência, $E$, é dada por:

$
  E(t_1, t_2) = integral_(t_1)^(t_2) p(t) d t = integral_(t_1)^(t_2) R i(t)^2 d t = integral_(t_1)^(t_2) 1/R v(t)^2 d t
$

---

A potência média dissipada no mesmo intervalo de tempo é dada por:

$
  P(t_1, t_2) = (1/(t_2 - t_1)) E(t_1, t_2)
$

$
  P(t_1, t_2) = (1/(t_2 - t_1)) integral_(t_1)^(t_2) p(t) d t = (1/(t_2 - t_1)) integral_(t_1)^(t_2) 1/R v(t)^2 d t
$

== Generalizando o caso contínuo

=== Potência instantânea

A potência instantânea de um sinal contínuo $x_c (t)$ é dada por:

$
  p(t) = x_c (t)^2
$

---

=== Energia no intervalo $t in [t_1, t_2]$:

A Energia sobre o mesmo sinal $x_c (t)$ no intervalo $t in [t_1, t_2]$ é dada por:

$
  E(t_1, t_2) = integral_(t_1)^(t_2) x_c (t)^2 d t
$

=== Potência média no intervalo $t in [t_1, t_2]$:

E a potëncia média é dada por:

$
  P(t_1, t_2) = (1/(t_2 - t_1)) integral_(t_1)^(t_2) x_c (t)^2 d t
$

== Caso discreto

=== Potência instantânea

A potência instantânea de um sinal discreto $x[n]$ é dada por:

$
  p[n] = x[n]^2
$

---

=== Energia no intervalo $n in [n_1, n_2]$:

A energia é dada por:

$
  E[n_1, n_2] = sum_(n=n_1)^(n_2) x[n]^2
$

=== Potência média no intervalo $n in [n_1, n_2]$:

A potência média é dada por:

$
  P[n_1, n_2] = (1/(n_2 - n_1 + 1)) sum_(n=n_1)^(n_2) x[n]^2
$


== Caso discreto (Extensão infinita)

#quote-box[
  Consideramos $n in (-infinity, infinity)$
]

#side-by-side(height: 12em)[
  === Energia total
  $
    E_infinity = lim_(N->infinity) sum_(n=-N)^(N) x[n]^2
  $
][
  === Potência média
  $
    P_infinity = lim_(N->infinity) (1/(2N+1)) sum_(n=-N)^(N) x[n]^2
  $
]

== Classificação de sinais quanto a potência e energia

Define-se 3 classes:
#bullet-list[
  #set list(indent: 1em)
  - Sinais de energia finita;
  - Sinais de potência média finita;
  - Sinais de potência média infinita.
]
---
=== Sinal de Energia finita

Quando:

$
  E_infinity = lim_(N->infinity) sum_(n=-N)^(N) x[n]^2 < infinity
$

#quote-box[
  Isto é, quando a série é *convergente*.
]

Neste caso:
- A energia toma valores finitos ($E_infinity < infinity$);
- E a potëncia média é nula ($P_infinity = 0$).

---

=== Sinal de potência média finita

Quando:

$
  P_infinity = lim_(N->infinity) (1/(2N+1)) sum_(n=-N)^(N) x[n]^2 < infinity
$

Neste caso:
- A potência média toma valores finitos ($P_infinity < infinity$);
- E a energia é infinita ($E_infinity = infinity$).

---

=== Sinal de potência e energia infinita

Sinais cuja a energia e potência média, num intervalo infinito, são ambas infinitos:

$
  E_infinity -> infinity, quad P_infinity -> infinity
$

#example-slide(source: [Sinais de potência e energia])[
  Calcule $E_infinity$ e $P_infinity$ para o sinal discreto $x[n] = 4$.

  === Solução

  / Relembrando:

  #side-by-side(height: 10em)[
    $
      sum_(n=n_1)^(n_2) c = c (n_2 - n_1 + 1)
    $
  ][
    $
      sum_(n=-N)^(N) c = c (2N + 1)
    $
  ]
  #pagebreak()

  / Cálculo de $E_infinity$:

  $
    E_infinity = lim_(N->infinity) sum_(n=-N)^(N) 4^2 = lim_(N->infinity) sum_(n=-N)^(N) 16 = lim_(N->infinity) 16 (2N + 1) = infinity
  $

  / Cálculo de $P_infinity$:
    $
      P_infinity & = lim_(N->infinity) (1/(2N+1)) sum_(n=-N)^(N) 4^2 \
                 & = lim_(N->infinity) (1/(2N+1)) sum_(n=-N)^(N) 16 \
                 & = lim_(N->infinity) (1/(2N+1)) 16 (2N + 1) = 16
    $
]

== Somatório de uma sequência constante

$
  sum_(n=n_1)^(n_2) c = c (n_2 - n_1 + 1)
$

#fancy-box(title: [Prova])[
  #side-by-side(height: 8em, align: horizon)[
    #v(1fr)
    $
      sum_(n=n_1)^(n_2) c = c + c + ... + c
    $
    #v(1fr)
  ][
    Temos então: ($n_2 - n_1 + 1$) vezes que o valor $c$ aparece, logo:

    $
      sum_(n=n_1)^(n_2) c = c (n_2 - n_1 + 1)
    $
  ]
]

== Somatório de uma sequência exponencial

  $
    sum_(n=n_1)^(n_2) r^n = (r^(n_1) - r^(n_2 + 1))/(1 - r), quad r != 1
  $

  Ou:

  $
    sum_(n=n_1)^(n_2) r^n = (r^(n_2 + 1) - r^(n_1))/(r - 1), quad r != 1
  $

#fancy-box(title: [Prova], breakable: true)[
  $
    sum_(n=n_1)^(n_2) r^n = r^(n_1) + r^(n_1 + 1) + ... + r^(n_2)
  $
  Multiplicando ambos os lados por $r$:
  $
    r sum_(n=n_1)^(n_2) r^n = r^(n_1 + 1) + r^(n_1 + 2) + ... + r^(n_2 + 1)
  $
  Subtraindo a segunda equação da primeira, temos:
  $
    (1 - r) sum_(n=n_1)^(n_2) r^n = r^(n_1) - r^(n_2 + 1)
  $
  Logo:
  $
    sum_(n=n_1)^(n_2) r^n = (r^(n_1) - r^(n_2 + 1))/(1 - r), quad r != 1
  $

  Ou ainda:

  $
    sum_(n=n_1)^(n_2) r^n = (r^(n_2 + 1) - r^(n_1))/(r - 1), quad r != 1
  $
]

== Somatório de uma sequência exponencial (casos especiais)

// === Caso $n_1 = -infinity$ e $n_2 -> infinity$

// $
//   sum_(n=-infinity)^(infinity) r^n = infinity, quad |r| >= 1
// $

=== Caso $n_1 = 0$ e $n_2 -> infinity$

$
  sum_(n=0)^(infinity) r^n = 1 / (1 - r), quad |r| < 1
$

---

=== Caso $n_1 = 1$ e $n_2 -> infinity$

$
  sum_(n=1)^(infinity) r^n = r / (1 - r), quad |r| < 1
$

=== Caso $n_1 = 0$ e $n_2< infinity$

$
  sum_(n=0)^(n_2) r^n = (1 - r^(n_2 + 1)) / (1 - r), quad r != 1
$

---

=== Caso $n_1 = 1$ e $n_2< infinity$

$
  sum_(n=1)^(n_2) r^n = (r - r^(n_2 + 1)) / (1 - r), quad r != 1
$


#example-slide(source: [Tirando o primeiro termo de um somatório])[
  Calcule o somatório $sum_(n=1)^(infinity) r^n$ usando o resultado de $sum_(n=0)^(infinity) r^n$.

  === Solução

  / Relembrando:

  $
    sum_(n=0)^(infinity) r^n = 1 / (1 - r), quad |r| < 1
  $

  / Calculando $sum_(n=1)^(infinity) r^n$:

  $
    sum_(n=1)^(infinity) r^n = sum_(n=0)^(infinity) r^n - r^0 = (1 / (1 - r)) - 1 = r / (1 - r), quad |r| < 1
  $
]

#example-slide(source: [Mudança de variável em um somatório])[
  Calcule o somatório $sum_(n=-infinity)^(infinity) r^n$ usando o resultado de $sum_(n=0)^(infinity) r^n$.

  === Solução

  / Relembrando:

  $
    sum_(n=0)^(infinity) r^n = 1 / (1 - r), quad |r| < 1
  $

  / Calculando $sum_(n=-infinity)^(infinity) r^n$:

  $
    sum_(n=-infinity)^(infinity) r^n = sum_(n=-infinity)^(-1) r^n + sum_(n=0)^(infinity) r^n
  $

  #pagebreak()

  Fazendo a mudança de variável $m = -n$, temos:

  $
    sum_(n=-infinity)^(-1) r^n = sum_(m=1)^(infinity) r^(-m)
  $
  E usando o resultado de $sum_(n=1)^(infinity) r^n$, temos:
  $
    sum_(m=1)^(infinity) r^(-m) = r^(-1) / (1 - r^(-1)) = 1 / (r - 1), quad |r| > 1
  $
  Logo:
  $
    sum_(n=-infinity)^(infinity) r^n = (1 / (r - 1)) + (1 / (1 - r)) = 0, quad
    |r| > 1
  $
]

== Somatório de uma sequência aritmética (Rampa)

$
  sum_(n=n_1)^(n_2) n = ((n_1 + n_2)(n_2 - n_1 + 1))/2
$

Isto é:

$
  S = ("Soma dos termos" dot "Número de termos") / 2
$

=== Caso $n_1 = 0$ e $n_2 = N$

$
  sum_(n=0)^(N) n = (N (N + 1))/2
$

== Somatório de uma sequência quadrática

$
  sum_(n=0)^(N) n^2 = 1/6 N (N + 1) (2 N + 1)
$

=== Caso geral

Podemos definir o caso geral como:

$
  sum_(n=n_1)^(n_2) n^2 = sum_(n=0)^(n_2) n^2 - sum_(n=0)^(n_1 - 1) n^2
$

$
  sum_(n=n_1)^(n_2) n^2 = (n_2 (n_2 + 1) (2 n_2 + 1))/6 - (n_1(n_1 - 1)(2 n_1 - 1))/6
$

#exercise-slide()[
  Calcule os seguintes somatórios:

  + $ sum_(n=-3)^(3) 2^n $
  + $ sum_(n=0)^(infinity) (1/3)^n $
  + $ sum_(n=1)^(infinity) (1/2)^n $
  + $ sum_(n=1)^(5) n^2 $
]

#example-slide(source: [Duplo somatório])[
  Calcule o somatório:

  $
    sum_(i=1)^(n) sum_(j=1)^(n) (j^2 + i)
  $

  === Solução

  / Relembrando:

  $
    sum_(n=1)^(N) n^2 = (N (N+1)(2N+1))/6
  $

  #pagebreak()

  / Somando primeiro em $j$ (com $i$ constante):
  $
    sum_(j=1)^(n) (j^2 + i) = (n (n+1)(2n+1))/6 + n i
  $

  / Somando em $i$:
  $
    sum_(i=1)^(n) [(n (n+1)(2n+1))/6 + n i] = & (n^2 (n+1)(2n+1))/6 + (n^2 (n+1))/2 \
                                            = & (n^2 (n+1)(n+2))/3
  $

  #pagebreak()
  Logo:
  $
    sum_(i=1)^(n) sum_(j=1)^(n) (j^2 + i) = (n^2 (n+1)(n+2))/3
  $

]

#exercise-slide(source: [Duplo somatório])[
  Determine:

  #columns(2)[
    + $ sum_(i=1)^(2) sum_(j=1)^(3) 1/(i + j) $
    + $ sum_(i=1)^(n) sum_(j=1)^(m) e^(i + j) quad ("para " n, m >= 1) $
    + $ sum_(i=1)^(n) sum_(j=1)^(n) (2 i j^2 + 1) quad ("para " n >= 1) $
    + $ sum_(i=1)^(7) sum_(j=5)^(10) (2 j - 3 i j) $
    #colbreak()
    + $ sum_(j=1)^(10) sum_(k=1)^(j) (2 k)/j $
    + $ sum_(i=5)^(10) sum_(k=0)^(20) (i k - 5 k) $
    + $ sum_(i=0)^(n) sum_(k=1)^(n) k (2^i + 1) $
  ]
]

#example-slide(source: [Energia e potência de um sinal constante])[
  Calcule a energia de:

  $
    x[n] = 4
  $

  === Solução

  / Relembrando:
    $
      sum_(n=n_1)^(n_2) c = c (n_2 - n_1 + 1)
    $
    $
      sum_(n=-N)^(N) c = c (2N + 1)
    $
    Calculando a energia total:

    $
      E_infinity = lim_(N -> infinity) sum_(n=-N)^(N) |x[n]|^2 = lim_(N -> infinity) sum_(n=-N)^(N) 16 = lim_(N -> infinity) 16 (2N + 1) = infinity
    $

    A potência média é dada por:
    $
      P_infinity = & lim_(N -> infinity) (1/(2N + 1)) sum_(n=-N)^(N) |x[n]|^2 \
                 = & lim_(N -> infinity) (1/(2N + 1)) sum_(n=-N)^(N) 16 = lim_(N -> infinity) (1/(2N + 1)) 16 (2N + 1) = 16
    $

    É um sinal de potência média finita.
]

#example-slide(source: [Energia e potência de um sinal exponencial])[
  Calcule a energia e potência média do sinal:

  $
    x[n] = (1/2)^n u[n]
  $

  === Solução

  / Relembrando:

  $
    sum_(n=0)^(infinity) r^n = 1 / (1 - r), quad |r| < 1
  $

  #pagebreak()
  Calculando a energia total:

  $
    E_infinity = lim_(N -> infinity) sum_(n=-N)^(N) |x[n]|^2 = lim_(N -> infinity) sum_(n=0)^(N) (1/4)^n = lim_(N -> infinity) (1 - (1/4)^(N + 1)) / (1 - 1/4) = 4/3
  $

  A potência média é dada por:
  $
    P_infinity = & lim_(N -> infinity) (1/(2N + 1)) sum_(n=-N)^(N) |x[n]|^2 \
               = & lim_(N -> infinity) (1/(2N + 1)) sum_(n=0)^(N) (1/4)^n = lim_(N -> infinity) (1/(2N + 1)) ((1 - (1/4)^(N + 1)) / (1 - 1/4)) = 0
  $

  É um sinal de energia finita.
  Logo, sinais de energia finita e sinais de potência média finita são classes distintas de sinais.
]

#example-slide(source: [Energia e potência de um sinal periódico])[

]


= Sinais elementares

== Introdução

- Vamos agora apresentar sinais básicos discretos;

- Estes aparecem *frequentemente* em processamento digital de sinais;

- E também serve para construir outros sinais.

== Impulso unitário

#side-by-side(align: horizon)[
  O *impulso unitário* (ou amostra unitária) é definido por:

  $
    delta[n] = cases(
      1", se " n = 0,
      0", se " n != 0
    )
  $

  #quote-box(color: colors.primary)[É o sinal discreto mais simples e serve de base para representar qualquer outro sinal.]
][
  #let d-fn(n) = if n == 0 { 1 } else { 0 }
  #let ns = range(-4, 5)
  #figure(lq.diagram(
    xlabel: [$n$],
    ylabel: [$delta[n]$],
    xlim: (-4.5, 4.5),
    ylim: (-0.5, 1.5),
    height: 6cm,
    lq.stem(ns, ns.map(d-fn), base-stroke: black),
  ))
]

== Impulso unitário deslocado

#side-by-side(align: horizon)[
  Deslocando o impulso em $m$ amostras, obtemos um impulso centrado em $n = m$:

  $
    delta[n - m] = cases(
      1", se " n = m,
      0", se " n != m
    )
  $

  No exemplo ao lado, $m = 2$.
][
  #let d-fn(n) = if n == 2 { 1 } else { 0 }
  #let ns = range(-4, 5)
  #figure(lq.diagram(
    xlabel: [$n$],
    ylabel: [$delta[n - 2]$],
    xlim: (-4.5, 4.5),
    ylim: (-0.5, 1.5),
    height: 6cm,
    lq.stem(ns, ns.map(d-fn), base-stroke: black),
  ))
]

== Degrau unitário

#side-by-side(align: horizon)[
  O *degrau unitário* é definido por:

  $
    u[n] = cases(
      1", se " n >= 0,
      0", se " n < 0
    )
  $

  #quote-box[Diferente do caso contínuo, no tempo discreto $u[n]$ é *bem definido* em $n = 0$, onde vale $1$.]
][
  #let u-fn(n) = if n >= 0 { 1 } else { 0 }
  #let ns = range(-4, 5)
  #figure(lq.diagram(
    xlabel: [$n$],
    ylabel: [$u[n]$],
    xlim: (-4.5, 4.5),
    ylim: (-0.5, 1.5),
    height: 6cm,
    lq.stem(ns, ns.map(u-fn), base-stroke: black),
  ))
]

== Rampa unitária

#side-by-side(align: horizon)[
  A *rampa unitária* cresce linearmente para $n >= 0$:

  $
    r[n] = cases(
      n", se " n >= 0,
      0", se " n < 0
    )
  $

  Pode ser escrita também como $r[n] = n thin u[n]$.
][
  #let r-fn(n) = if n >= 0 { n } else { 0 }
  #let ns = range(-4, 7)
  #figure(lq.diagram(
    xlabel: [$n$],
    ylabel: [$r[n]$],
    xlim: (-4.5, 6.5),
    ylim: (-0.5, 6.5),
    height: 6cm,
    lq.stem(ns, ns.map(r-fn), base-stroke: black),
  ))
]

== Sinal exponencial real

O *sinal exponencial real* é definido por:

$
  x[n] = C alpha^n, quad C, alpha in bb(R)
$

Dependendo do valor de $alpha$, o sinal apresenta comportamentos distintos:

- $|alpha| > 1$: a magnitude *cresce* exponencialmente com $n$;
- $|alpha| < 1$: a magnitude *decresce* exponencialmente com $n$;
- $alpha > 0$: todas as amostras têm o *mesmo sinal* (o de $C$);
- $alpha < 0$: o sinal *alterna* de sinal a cada amostra;
- $alpha = 1$: o sinal é *constante* ($x[n] = C$);
- $alpha = -1$: o sinal alterna entre $-C$ e $C$.

---

=== Casos com $alpha > 0$ (não alterna)

#side-by-side(height: 11em)[
  #let e-fn(n) = calc.pow(1.25, n)
  #let ns = range(0, 9)
  #figure(lq.diagram(
    title: [$alpha > 1$ (crescente)],
    xlabel: [$n$],
    ylabel: [$x[n]$],
    xlim: (-0.5, 8.5),
    ylim: (0, 6.5),
    height: 5.5cm,
    lq.stem(ns, ns.map(e-fn), base-stroke: black),
  ))
][
  #let e-fn(n) = calc.pow(0.75, n)
  #let ns = range(0, 9)
  #figure(lq.diagram(
    title: [$0 < alpha < 1$ (decrescente)],
    xlabel: [$n$],
    ylabel: [$x[n]$],
    xlim: (-0.5, 8.5),
    ylim: (0, 1.2),
    height: 5.5cm,
    lq.stem(ns, ns.map(e-fn), base-stroke: black),
  ))
]

---

=== Casos com $alpha < 0$ (alterna de sinal)

#side-by-side(height: 11em)[
  $-1 < alpha < 0$ (alternado decrescente)
  #let e-fn(n) = calc.pow(-0.75, n)
  #let ns = range(0, 9)
  #figure(lq.diagram(
    xlabel: [$n$],
    ylabel: [$x[n]$],
    xlim: (-0.5, 8.5),
    ylim: (-1.2, 1.2),
    height: 5.5cm,
    lq.stem(ns, ns.map(e-fn), base-stroke: black),
  ))
][
  $alpha < -1$ (alternado crescente)
  #let e-fn(n) = calc.pow(-1.25, n)
  #let ns = range(0, 9)
  #figure(lq.diagram(
    xlabel: [$n$],
    ylabel: [$x[n]$],
    xlim: (-0.5, 8.5),
    ylim: (-7, 7),
    height: 5.5cm,
    lq.stem(ns, ns.map(e-fn), base-stroke: black),
  ))
]

== Sinal senoidal

#side-by-side(align: horizon)[
  A *sequência senoidal* é dada por:

  $
    x[n] = A cos(omega_0 n + theta)
  $

  - $A$: amplitude;
  - $omega_0$: frequência (rad/amostra);
  - $theta$: fase (rad).

  #quote-box(color: colors.primary)[Ao contrário do caso contínuo, uma senoide discreta *nem sempre é periódica*.]
][
  #let s-fn(n) = calc.cos(2 * calc.pi * n / 12)
  #let ns = range(0, 25)
  #figure(lq.diagram(
    xlabel: [$n$],
    ylabel: [$x[n]$],
    xlim: (-0.5, 24.5),
    ylim: (-1.3, 1.3),
    height: 6cm,
    lq.stem(ns, ns.map(s-fn), base-stroke: black),
  ), caption: [$ x[n] = cos((pi n) / 6) $ Periódico com $N = 12$.])
]

== Relação entre o impulso e o degrau

O impulso pode ser obtido pela *diferença* do degrau:

$
  delta[n] = u[n] - u[n-1]
$

Reciprocamente, o degrau é a *acumulação* dos impulsos:

$
  u[n] = sum_(m=-infinity)^(n) delta[m] = sum_(k=0)^(infinity) delta[n - k]
$

#quote-box[Essas relações são o análogo discreto da derivada e da integral entre $delta(t)$ e $u(t)$ no tempo contínuo.]

== Relação entre rampa, degrau e impulso

#side-by-side(height: auto)[
  #fancy-box(title: [Diferença])[
    $ r[n] arrow.r u[n] arrow.r delta[n] $

    $
      u[n] &= r[n+1] - r[n] \
      delta[n] &= u[n] - u[n-1]
    $
  ]
][
  #fancy-box(title: [Acumulação])[
    $ delta[n] arrow.r u[n] arrow.r r[n] $

    $
      u[n] &= sum_(k=-infinity)^(n) delta[k] \
      r[n] &= sum_(k=-infinity)^(n-1) u[k]
    $
  ]
]

A *diferença* "desce" na hierarquia (rampa $arrow.r$ degrau $arrow.r$ impulso); a *acumulação* "sobe" (impulso $arrow.r$ degrau $arrow.r$ rampa).

#example-slide(source: [Construindo o degrau a partir de impulsos])[
  Cada impulso $delta[n - k]$ coloca uma amostra de altura $1$ em $n = k$. Somando a partir de $k = 0$, construímos o degrau: $u[n] = sum_(k=0)^(infinity) delta[n - k]$.

  #let ps-fn(n) = if n >= 0 and n <= 3 { 1 } else { 0 }
  #let u-fn(n) = if n >= 0 { 1 } else { 0 }
  #let ns = range(-3, 9)
  #side-by-side(height: auto)[
    #figure(lq.diagram(
      title: [Soma parcial ($K = 3$)],
      xlabel: [$n$],
      ylabel: [],
      xlim: (-3.5, 8.5),
      ylim: (-0.5, 1.5),
      height: 4.8cm,
      lq.stem(ns, ns.map(ps-fn), base-stroke: black),
    ))
  ][
    #figure(lq.diagram(
      title: [$u[n]$ (quando $K -> infinity$)],
      xlabel: [$n$],
      ylabel: [],
      xlim: (-3.5, 8.5),
      ylim: (-0.5, 1.5),
      height: 4.8cm,
      lq.stem(ns, ns.map(u-fn), base-stroke: black),
    ))
  ]
]

== Mais exemplos de sinais degrau

A partir do degrau, deslocamentos e reflexões geram outros sinais úteis:

#side-by-side(height: auto)[
  / Degrau atrasado $u[n - 3]$:
  #let u-fn(n) = if n >= 3 { 1 } else { 0 }
  #let ns = range(-3, 9)
  #figure(lq.diagram(
    title: [$u[n - 3]$],
    xlabel: [$n$],
    ylabel: [],
    xlim: (-3.5, 8.5),
    ylim: (-0.5, 1.5),
    height: 5.5cm,
    lq.stem(ns, ns.map(u-fn), base-stroke: black),
  ))
][
  / Degrau refletido $u[-n]$:
  #let u-fn(n) = if n <= 0 { 1 } else { 0 }
  #let ns = range(-6, 6)
  #figure(lq.diagram(
    title: [$u[-n]$],
    xlabel: [$n$],
    ylabel: [],
    xlim: (-6.5, 5.5),
    ylim: (-0.5, 1.5),
    height: 5.5cm,
    lq.stem(ns, ns.map(u-fn), base-stroke: black),
  ))
]

#example-slide(source: [Construindo sinais com degraus])[
  / Pulso retangular:

  #side-by-side(height: auto, align: horizon)[
    A *diferença de dois degraus* produz um pulso de duração finita:

    $
      p[n] = u[n] - u[n - 5] = cases(
        1", " 0 <= n <= 4,
        0", c.c."
      )
    $

    $u[n]$ "liga" o sinal em $n = 0$ e $-u[n - 5]$ o "desliga" em $n = 5$.
  ][
    #let p-fn(n) = if n >= 0 and n <= 4 { 1 } else { 0 }
    #let ns = range(-3, 9)
    #figure(lq.diagram(
      title: [$p[n] = u[n] - u[n - 5]$],
      xlabel: [$n$],
      ylabel: [],
      xlim: (-3.5, 8.5),
      ylim: (-0.5, 1.5),
      height: 5.5cm,
      lq.stem(ns, ns.map(p-fn), base-stroke: black),
    ))
  ]

  #pagebreak()

  / Sinal em escada:

  #side-by-side(height: auto, align: horizon)[
    Combinando degraus escalados e deslocados, obtemos sinais constantes por partes:

    $
      x[n] = u[n] + u[n - 2] - 2 u[n - 4]
    $

    - $1$ para $0 <= n <= 1$;
    - $2$ para $2 <= n <= 3$;
    - $0$ caso contrário.
  ][
    #let x-fn(n) = (if n >= 0 { 1 } else { 0 }) + (if n >= 2 { 1 } else { 0 }) - 2 * (if n >= 4 { 1 } else { 0 })
    #let ns = range(-2, 8)
    #figure(lq.diagram(
      title: [$x[n]$],
      xlabel: [$n$],
      ylabel: [],
      xlim: (-2.5, 7.5),
      ylim: (-0.5, 2.5),
      height: 5.5cm,
      lq.stem(ns, ns.map(x-fn), base-stroke: black),
    ))
  ]
]

== Propriedade de amostragem do impulso

Como $delta[n]$ só é não nulo em $n = 0$, multiplicar um sinal por um impulso *seleciona uma única amostra*:

$
  x[n] delta[n] = x[0] delta[n]
$

De forma geral, para um impulso centrado em $n = n_0$:

$
  x[n] delta[n - n_0] = x[n_0] delta[n - n_0]
$

== Decomposição de um sinal em impulsos

A propriedade de amostragem leva a um resultado fundamental: *qualquer sinal discreto* pode ser escrito como uma soma de impulsos deslocados, cada um ponderado pelo valor da amostra correspondente:

$
  x[n] = sum_(k=-infinity)^(infinity) x[k] delta[n - k]
$

#quote-box(color: colors.primary)[Essa decomposição é a base da *soma de convolução*, que será usada para descrever a resposta de sistemas lineares e invariantes no tempo (SLIT).]

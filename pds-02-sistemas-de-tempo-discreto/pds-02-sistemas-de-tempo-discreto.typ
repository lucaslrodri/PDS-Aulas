#import "@preview/touying:0.7.3": *
#import "@local/touying-ufac:0.0.1": *
#import "@preview/lilaq:0.6.0" as lq


#show: ufac-theme.with(aspect-ratio: "16-9", progress-bar: false, config-info(
  title: [Sistemas de tempo discreto],
  subtitle: [II - Sistemas de tempo discreto],
  author: [Prof. Dr. Lucas L. Rodrigues e Omar. A. Vilcanqui],
  subject: [Processamento Digital de Sinais],
  subject-code: [CCET387],
))

// Bloco simples para representar um sistema H: x[n] -> y[n]
#let sys-block(input, output, lbl: $H$, color: colors.primary) = align(center)[
  #grid(
    columns: (auto, auto, auto, auto, auto),
    align: horizon,
    column-gutter: .5em,
    $#input$,
    text(size: 1.4em)[$arrow.r.long$],
    rect(inset: .9em, radius: 4pt, stroke: 1.2pt + color)[#text(size: 1.2em)[$#lbl$]],
    text(size: 1.4em)[$arrow.r.long$],
    $#output$,
  )
]

#title-slide()

== Conteúdo da unidade

Na unidade anterior estudamos os *sinais* de tempo discreto. Agora vamos estudar os *sistemas* que operam sobre eles.

#v(0.5em)
#bullet-list[
  #set list(indent: 1em)
  - Sistemas discretos;
  - Propriedades e operações com sistemas discretos;
  - Sistemas Lineares e Invariantes no Tempo (SLIT);
  - Propriedades de SLIT.
]

#v(0.5em)
#quote-box(color: colors.primary)[
  Sistemas SLIT são a base do *projeto de filtros digitais*, um dos objetivos centrais da disciplina.
]

= Sistemas discretos

== O que é um sistema discreto?

Um *sistema discreto* transforma um sinal de entrada $x[n]$ em um sinal de saída $y[n]$, de forma controlada:

#fancy-box(title: [Definição])[
  $
    y[n] = H{x[n]}
  $
  onde $H$ representa a *transformação* executada pelo sistema.
]

#v(0.8em)
#sys-block($x[n]$, $y[n]$)

== Para que servem?

O objetivo de amostrar um sinal é permitir seu *processamento digital* para:

#bullet-list[
  #set list(indent: 1em)
  - Extrair informações;
  - Transmitir ou armazenar;
  - Melhorar ou recuperar a qualidade;
  - Controlar processos e dispositivos.
]

#v(0.5em)
Em geral, os sistemas de processamento digital são complexos e podem ser *subdivididos* em partes menores (blocos).

== Por que estudar sistemas simples?

Sistemas com as propriedades de *linearidade* e *invariância no tempo* podem ser analisados de forma simples.

#v(0.5em)
Sua implementação computacional é facilitada, pois utiliza apenas três operações elementares:

#side-by-side(height: auto)[
  #quote-box(color: colors.primary)[/ Soma: somador]
][
  #quote-box(color: colors.primary)[/ Multiplicação: processador]
][
  #quote-box(color: colors.primary)[/ Atraso: memória]
]

#v(0.5em)
#quote-box(color: colors.safe)[
  Estas três operações bastam para implementar uma enorme classe de sistemas digitais úteis.
]

== Exemplo: sistema de médias móveis

#side-by-side(align: horizon)[
  O sistema de *médias móveis* (de 3 pontos) é definido por:

  $
    y[n] = 1/3 (x[n] + x[n-1] + x[n-2])
  $

  A saída é a *média aritmética* de três amostras consecutivas da entrada.

  #quote-box(color: colors.primary)[Suaviza o sinal, atenuando variações bruscas (ruído).]
][
  #let u-fn(n) = if n >= 0 { 1 } else { 0 }
  #let y-fn(n) = (u-fn(n) + u-fn(n - 1) + u-fn(n - 2)) / 3
  #let ns = range(-3, 8)
  #figure(lq.diagram(
    xlabel: [$n$],
    ylabel: [$y[n]$],
    xlim: (-3.5, 7.5),
    ylim: (-0.2, 1.3),
    height: 6cm,
    lq.stem(ns, ns.map(y-fn), base-stroke: black),
  ), caption: [Resposta ao degrau $u[n]$: a transição é suavizada.])
]

== Exemplo: acumulador e diferença

#side-by-side[
  #fancy-box(title: [Acumulador])[
    $
      y[n] = H{x[n]} = sum_(k=-infinity)^(n) x[k]
    $
    Análogo discreto da *integral*.
  ]

  Quando a entrada é o impulso $delta[n]$, a saída é o degrau:
  $
    H{delta[n]} = sum_(k=-infinity)^(n) delta[k] = u[n]
  $
][
  #fancy-box(title: [Primeira diferença])[
    $
      y[n] = H{x[n]} = x[n] - x[n-1]
    $
    Análogo discreto da *derivada*.
  ]

  Quando a entrada é o degrau $u[n]$, a saída é o impulso:
  $
    H{u[n]} = u[n] - u[n-1] = delta[n]
  $
]

= Propriedades de sistemas discretos

== Visão geral

Os sistemas discretos podem ser classificados segundo várias propriedades:

#side-by-side(height: auto)[
  #bullet-list[
    #set list(indent: 1em)
    - *Linearidade*;
    - *Invariância no tempo*;
    - *Memória*;
    - *Causalidade*.
  ]
][
  #bullet-list[
    #set list(indent: 1em)
    - *Realimentação*;
    - *Estabilidade*;
    - *Invertibilidade*.
  ]
]

#v(0.5em)
#quote-box(color: colors.primary)[
  As duas primeiras (linearidade e invariância no tempo) definem a classe mais importante: os *sistemas SLIT*.
]

== Linearidade

Um sistema é *linear* se satisfaz os princípios da *homogeneidade* e da *superposição*:

#fancy-box(title: [Homogeneidade])[
  $
    H{a thin x[n]} = a thin H{x[n]}
  $
]

#fancy-box(title: [Superposição (aditividade)])[
  $
    H{x_1 [n] + x_2 [n]} = H{x_1 [n]} + H{x_2 [n]}
  $
]

---

As duas condições podem ser condensadas em uma só (generalizando para $M$ parcelas):

$
  H{a_1 x_1 [n] + a_2 x_2 [n] + dots.c + a_M x_M [n]} \
  = a_1 H{x_1 [n]} + a_2 H{x_2 [n]} + dots.c + a_M H{x_M [n]}
$

Ou, de forma compacta:

#fancy-box(title: [Condição de linearidade])[
  $
    H{ sum_(i=1)^(M) a_i thin x_i [n] } = sum_(i=1)^(M) a_i thin H{x_i [n]}
  $
]

#example-slide(source: [Linearidade do sistema de médias móveis])[
  Mostre que o sistema de médias móveis $y[n] = 1/3 (x[n] + x[n-1] + x[n-2])$ é linear.

  === Solução

  / Homogeneidade (multiplicação por escalar):
  $
    H{a thin x[n]} & = 1/3 (a thin x[n] + a thin x[n-1] + a thin x[n-2]) \
                   & = a dot 1/3 (x[n] + x[n-1] + x[n-2]) = a thin H{x[n]}
  $

  #pagebreak()

  / Superposição (soma de duas sequências):
  $
    H{x_1 [n] + x_2 [n]} & = 1/3 [(x_1 [n] + x_2 [n]) + (x_1 [n-1] + x_2 [n-1]) \
                       + & (x_1 [n-2] + x_2 [n-2])] \
                       & = 1/3 (x_1 [n] + x_1 [n-1] + x_1 [n-2]) \
                       + & 1/3 (x_2 [n] + x_2 [n-1] + x_2 [n-2]) \
                       & = H{x_1 [n]} + H{x_2 [n]}
  $

  Portanto, o sistema de médias móveis é *linear*.
]

#exercise-slide(source: [Linearidade da primeira diferença])[
  Mostre que o sistema dado pela *primeira diferença* $y[n] = x[n] - x[n-1]$ é linear.

  #pagebreak()
  === Resposta

  / Homogeneidade:
  $
    H{a thin x[n]} = a thin x[n] - a thin x[n-1] = a (x[n] - x[n-1]) = a thin H{x[n]}
  $

  / Superposição:
  $
    H{x_1 [n] + x_2 [n]} & = (x_1 [n] + x_2 [n]) - (x_1 [n-1] + x_2 [n-1]) \
                       & = (x_1 [n] - x_1 [n-1]) + (x_2 [n] - x_2 [n-1]) = H{x_1 [n]} + H{x_2 [n]}
  $

  Logo, o sistema é *linear*.
]

== Invariância no tempo

Um sistema é *invariante no tempo* se um deslocamento na entrada produz *apenas o mesmo deslocamento* na saída:

#fancy-box(title: [Condição de invariância no tempo])[
  Se $y[n] = H{x[n]}$, então:
  $
    y[n - k] = H{x[n - k]}, quad forall k in bb(Z)
  $
]

Também chamada de *invariância ao deslocamento*.

#example-slide(source: [Sistema variante no tempo])[
  Verifique se o sistema $y[n] = H{x[n]} = e^(-n) x[n]$ é invariante no tempo.

  === Solução

  / Transformação aplicada à entrada deslocada:
  $
    H{x[n - k]} = e^(-n) x[n - k]
  $

  / Saída deslocada:
  $
    y[n - k] = e^(-(n - k)) x[n - k] = e^(k) e^(-n) x[n - k]
  $

  Como $H{x[n-k]} != y[n-k]$, o sistema *não é invariante no tempo*.
]

#example-slide(source: [Compressor / reamostrador])[
  Verifique se o sistema $y[n] = H{x[n]} = x[M n]$, com $M in bb(Z)$, é invariante no tempo.

  === Solução

  / Saída deslocada:
  $
    y[n - k] = x[M(n - k)] = x[M n - M k]
  $

  / Transformação da entrada deslocada:
  $
    H{x[n - k]} = x[M n - k]
  $

  Como $x[M n - M k] != x[M n - k]$, a condição não é satisfeita: o sistema é *variante no tempo*.
]

== Memória

#fancy-box(title: [Definição])[
  Um sistema é *sem memória* (ou *instantâneo*) se a saída em $n_0$ depende *apenas* da entrada nesse mesmo instante. Caso contrário, é *com memória*.
]

#side-by-side(height: auto)[
  #quote-box(color: colors.safe)[
    / Sem memória: $y[n] = 2 x[n]$
  ]
][
  #quote-box(color: colors.danger)[
    / Com memória: $y[n] = x[n] + x[n-1]$
  ]
]

== Causalidade

#fancy-box(title: [Definição])[
  Um sistema é *causal* (ou *realizável*) se a saída em $n_0$ depende apenas da entrada nesse instante e em instantes *anteriores* (nunca futuros).
]

#side-by-side(height: auto)[
  #quote-box(color: colors.safe)[
    / Causal: $y[n] = x[n] + x[n-1]$
  ]
][
  #quote-box(color: colors.danger)[
    / Não causal: $y[n] = x[n] + x[n+1]$
  ]
]

#quote-box(color: colors.primary)[Sistemas que operam em *tempo real* precisam ser causais: não há acesso a amostras futuras.]

== Realimentação

#fancy-box(title: [Definição])[
  Um sistema é *com realimentação* (_feedback_) se a saída depende da entrada e de valores *anteriores da própria saída*.
]

#side-by-side(height: auto)[
  #quote-box(color: colors.safe)[
    / Com realimentação: $y[n] = 1/2 x[n] + 1/4 y[n-1]$
  ]
][
  #quote-box(color: colors.danger)[
    / Sem realimentação: $y[n] = x[n] + x[n-1]$
  ]
]

== Estabilidade

#fancy-box(title: [Estabilidade BIBO (_Bounded-Input Bounded-Output_)])[
  Um sistema é *estável* se, para toda entrada *limitada*, a saída também é *limitada*:
  $
    |x[n]| <= M_x < infinity quad => quad |y[n]| <= M_y < infinity
  $
]

#side-by-side(height: auto)[
  #quote-box(color: colors.safe)[
    / Estável: $y[n] = 1/2 x[n] + 1/4 y[n-1]$
  ]
][
  #quote-box(color: colors.danger)[
    / Instável: $y[n] = 2 y[n-1] + x[n]$
  ]
]

== Invertibilidade

Um sistema é *inversível* se for possível recuperar a entrada a partir da saída. Existe $H^(-1)$ tal que:

$
  H^(-1){H{x[n]}} = x[n]
$

O sistema $H^(-1)$ é o *inverso* de $H$. Para ser inversível, $H$ deve ser *biunívoca*: cada entrada gera uma saída única, e vice-versa.

#example-slide(source: [Inverso de um atraso])[
  Seja o sistema $H{x[n]} = x[n - k]$ (um atraso de $k$ amostras). Ele é *inversível*, com inverso $H^(-1){x[n]} = x[n + k]$ (um avanço):

  $
    H^(-1){H{x[n]}} = H^(-1){x[n - k]} = x[n - k + k] = x[n]
  $
]

#exercise-slide()[
  Para cada sistema abaixo, classifique-o quanto a: memória, causalidade, estabilidade e invariância no tempo.

  + $y[n] = x[n] - x[n - 2]$
  + $y[n] = n thin x[n]$
  + $y[n] = x[-n]$
  + $y[n] = sum_(k=-infinity)^(n) x[k]$
]

= Sistemas Lineares e Invariantes no Tempo (SLIT)

== Definição

Um sistema é *SLIT* (em inglês, _LTI_) quando é, ao mesmo tempo, *linear* e *invariante no tempo*.

#fancy-box(title: [Por que são importantes?])[
  - Fácil implementação e descrição simples;
  - Amplamente estudados e aplicados no processamento de sinais;
  - Base de inúmeras técnicas práticas (incluindo *filtros digitais*).
]

#quote-box(color: colors.danger)[Sistemas SLIT não resolvem todos os problemas; algumas aplicações exigem *sistemas não lineares*.]

== Resposta ao impulso

#side-by-side(align: horizon)[
  Um sistema SLIT é *completamente descrito* por sua *resposta ao impulso*: a saída quando a entrada é o impulso unitário.

  #fancy-box(title: [Resposta ao impulso])[
    $
      h[n] = H{delta[n]}
    $
  ]
][
  #sys-block($delta[n]$, $h[n]$)

  #v(1em)
  #quote-box(color: colors.primary)[
    Conhecendo $h[n]$, conseguimos prever a saída para *qualquer* entrada.
  ]
]

== Da resposta ao impulso à convolução

Qualquer entrada pode ser escrita como soma de impulsos deslocados (decomposição vista na Unidade I):

$
  x[n] = sum_(k=-infinity)^(infinity) x[k] thin delta[n - k]
$

Aplicando o sistema e usando a *linearidade*:

$
  y[n] & = H{ sum_(k=-infinity)^(infinity) x[k] thin delta[n - k] } \
       & = sum_(k=-infinity)^(infinity) x[k] thin H{delta[n - k]}
$

---

Pela *invariância no tempo*, $H{delta[n - k]} = h[n - k]$. Logo:

#fancy-box(title: [Soma de convolução])[
  $
    y[n] = sum_(k=-infinity)^(infinity) x[k] thin h[n - k] = x[n] * h[n]
  $
]

#quote-box(color: colors.primary)[
  A saída de um sistema SLIT é a *convolução* da entrada com a resposta ao impulso.
]

== Calculando a convolução

Para obter uma amostra específica, por exemplo $y[0]$:

$
  y[0] = sum_(k=-infinity)^(infinity) x[k] thin h[-k]
$

Cada amostra de saída é a soma do produto, amostra a amostra, entre a entrada $x[k]$ e a resposta ao impulso *espelhada e deslocada* $h[n - k]$.

#fancy-box(title: [Receita prática])[
  + *Espelhe* $h[k] -> h[-k]$;
  + *Desloque* para a posição $n$: $h[n - k]$;
  + *Multiplique* ponto a ponto por $x[k]$ e *some*.
]

#example-slide(source: [Convolução de sequências finitas])[
  Sejam $x[n] = 2 delta[n] + delta[n-1] - delta[n-2]$ e $h[n] = delta[n] - delta[n-1]$.

  Isto é, $x[n] = {2, 1, -1}$ e $h[n] = {1, -1}$ (a partir de $n = 0$).

  === Solução

  Calculando amostra a amostra $y[n] = sum_k x[k] h[n - k]$:

  $
    y[0] &= x[0] h[0] = 2 \
    y[1] &= x[0] h[1] + x[1] h[0] = 2(-1) + 1(1) = -1 \
    y[2] &= x[1] h[1] + x[2] h[0] = 1(-1) + (-1)(1) = -2 \
    y[3] &= x[2] h[1] = (-1)(-1) = 1
  $

  #pagebreak()

  Logo, $y[n] = {2, -1, -2, 1}$ (a partir de $n = 0$).

  #let xs = ((0, 2), (1, 1), (2, -1))
  #let hs = ((0, 1), (1, -1))
  #let ys = ((0, 2), (1, -1), (2, -2), (3, 1))

  #side-by-side(height: auto)[
    #figure(lq.diagram(
      title: [$x[n]$],
      xlabel: [$n$], ylabel: [],
      xlim: (-1.5, 4.5), ylim: (-2.5, 2.5),
      height: 4cm,
      lq.stem(xs.map(p => p.at(0)), xs.map(p => p.at(1)), base-stroke: black),
    ))
  ][
    #figure(lq.diagram(
      title: [$h[n]$],
      xlabel: [$n$], ylabel: [],
      xlim: (-1.5, 4.5), ylim: (-2.5, 2.5),
      height: 4cm,
      lq.stem(hs.map(p => p.at(0)), hs.map(p => p.at(1)), base-stroke: black),
    ))
  ][
    #figure(lq.diagram(
      title: [$y[n] = x[n] * h[n]$],
      xlabel: [$n$], ylabel: [],
      xlim: (-1.5, 4.5), ylim: (-2.5, 2.5),
      height: 4cm,
      lq.stem(ys.map(p => p.at(0)), ys.map(p => p.at(1)), base-stroke: black),
    ))
  ]
]

== Filtros lineares

Sistemas que convertem $x[n]$ em $y[n]$ selecionando características do sinal são chamados *filtros*:

- *Selecionam* características desejadas;
- *Bloqueiam* ou *atenuam* características indesejadas.

Se o sistema é *linear*, ele é determinado por sua resposta ao impulso $h[n]$, e a saída é obtida por convolução:

$
  y[n] = x[n] * h[n]
$

---

Filtros lineares atuam sobre as *frequências* do sinal:

#side-by-side(height: auto)[
  #bullet-list[
    #set list(indent: 1em)
    - *Passa-baixas*: mantém baixas frequências (variações suaves);
    - *Passa-altas*: mantém altas frequências (variações bruscas).
  ]
][
  #bullet-list[
    #set list(indent: 1em)
    - *Passa-faixa*: mantém frequências intermediárias;
    - *Rejeita-faixa*: bloqueia frequências intermediárias.
  ]
]

#quote-box(color: colors.danger)[
  Um *filtro ideal* rejeita perfeitamente as frequências indesejadas, mas *não é realizável* na prática (exige infinitas amostras).
]

#example-slide(source: [Resposta ao impulso de um filtro ideal])[
  Um *filtro passa-baixas ideal* com frequência de corte $omega_c$ tem resposta ao impulso:

  $
    h[n] = sin(omega_c thin n) / (pi n)
  $

  #side-by-side(align: horizon, height: auto)[
    - Definida para todo $n$, com $-infinity < n < infinity$;
    - Por isso o filtro ideal *não é realizável*: exigiria infinitas amostras.

    No exemplo ao lado, $omega_c = pi"/"4$.
  ][
    #let h-fn(n) = if n == 0 { 0.25 } else { calc.sin(calc.pi / 4 * n) / (calc.pi * n) }
    #let ns = range(-12, 13)
    #figure(lq.diagram(
      xlabel: [$n$], ylabel: [$h[n]$],
      xlim: (-12.5, 12.5), ylim: (-0.1, 0.3),
      height: 5.5cm,
      lq.stem(ns, ns.map(h-fn), base-stroke: black),
    ))
  ]
]

= Propriedades de sistemas SLIT

== Propriedades = propriedades da convolução

Como sistemas SLIT são representados pela *convolução* com $h[n]$, falar das propriedades do sistema equivale a falar das *propriedades da convolução*.

#v(0.5em)
#side-by-side(height: auto)[
  #bullet-list[
    #set list(indent: 1em)
    - Elemento neutro;
    - Extensão;
    - Comutatividade;
    - Distributividade.
  ]
][
  #bullet-list[
    #set list(indent: 1em)
    - Associatividade;
    - Causalidade;
    - Estabilidade;
    - Resposta a senoides.
  ]
]

== Elemento neutro

O elemento neutro da convolução é o *impulso unitário*:

$
  x[n] * delta[n] = x[n]
$

/ Justificativa:
$
  x[n] * delta[n] = sum_(k=-infinity)^(infinity) x[k] thin delta[n - k] = x[n]
$

/ Propriedade de deslocamento:
$
  x[n] * delta[n - k] = x[n - k]
$

== Extensão (comprimento)

#fancy-box(title: [Comprimento do resultado])[
  Se $x[n]$ tem $N_x$ amostras e $h[n]$ tem $N_h$ amostras, então $y[n] = x[n] * h[n]$ tem:
  $
    N_y = N_x + N_h - 1
  $
  amostras.
]

#quote-box(color: colors.primary)[
  Conhecer a extensão da sequência é útil para *alocação de memória* em sistemas digitais.
]

No exemplo anterior: $N_x = 3$, $N_h = 2$ $=>$ $N_y = 3 + 2 - 1 = 4$. #safe[✓]

== Comutatividade

A convolução é *comutativa*:

$
  x[n] * h[n] = h[n] * x[n]
$

/ Justificativa:
$
  x[n] * h[n] = sum_(k=-infinity)^(infinity) x[k] thin h[n - k]
$

Fazendo a mudança de variável $m = n - k$:

$
  = sum_(m=-infinity)^(infinity) h[m] thin x[n - m] = h[n] * x[n]
$

== Distributividade (paralelismo)

A convolução é *distributiva* em relação à soma:

$
  x[n] * (h_1 [n] + h_2 [n]) = x[n] * h_1 [n] + x[n] * h_2 [n]
$

#side-by-side(align: horizon, height: auto)[
  Corresponde a sistemas conectados em *paralelo*: a resposta ao impulso equivalente é a *soma* das respostas.
][
  #fancy-box(title: [Paralelo])[
    $
      h_"eq" [n] = h_1 [n] + h_2 [n]
    $
  ]
]

== Associatividade (cascateamento)

A convolução é *associativa*:

$
  x[n] * (h_1 [n] * h_2 [n]) = (x[n] * h_1 [n]) * h_2 [n]
$

#side-by-side(align: horizon, height: auto)[
  Corresponde a sistemas conectados em *cascata* (série): a resposta ao impulso equivalente é a *convolução* das respostas.
][
  #fancy-box(title: [Cascata])[
    $
      h_"eq" [n] = h_1 [n] * h_2 [n]
    $
  ]
]

== Causalidade

#fancy-box(title: [Condição de causalidade para SLIT])[
  Um sistema SLIT é *causal* se, e somente se:
  $
    h[n] = 0, quad "para " n < 0
  $
]

/ Justificativa:
$
  y[n] = sum_(k=-infinity)^(infinity) x[k] thin h[n - k]
$

Como $h[n - k] = 0$ para $n - k < 0$ (ou seja, $k > n$):

$
  y[n] = sum_(k=-infinity)^(n) x[k] thin h[n - k]
$

A saída em $n$ depende apenas de entradas em instantes $k <= n$.

== Estabilidade

#fancy-box(title: [Condição de estabilidade para SLIT])[
  Um sistema SLIT é *estável* (BIBO) se, e somente se, a resposta ao impulso é *absolutamente somável*:
  $
    sum_(k=-infinity)^(infinity) |h[k]| < infinity
  $
]

---

/ Demonstração (resumida):
Seja a entrada limitada $|x[n]| <= M_x < infinity$. Aplicando a desigualdade triangular à convolução:

$
  |y[n]| = |sum_(k=-infinity)^(infinity) h[k] thin x[n - k]| <= sum_(k=-infinity)^(infinity) |h[k]| thin |x[n - k]|
$

Como $|x[n - k]| <= M_x$:

$
  |y[n]| <= M_x sum_(k=-infinity)^(infinity) |h[k]|
$

Para que $y[n]$ seja limitado, basta que $sum_(k) |h[k]| < infinity$.

== Resposta a sinais senoidais

Uma propriedade notável dos sistemas SLIT é a *fidelidade às senoides*: uma entrada exponencial complexa gera uma saída de *mesma frequência*.

Seja $x[n] = e^(j omega n)$. A saída é:

$
  y[n] & = sum_(k=-infinity)^(infinity) h[k] thin e^(j omega (n - k)) \
       & = e^(j omega n) underbrace(sum_(k=-infinity)^(infinity) h[k] thin e^(-j omega k), H(omega))
$

---

Logo:

$
  y[n] = H(omega) thin e^(j omega n) = |H(omega)| thin e^(j (omega n + angle H(omega)))
$

#fancy-box(title: [Conclusão])[
  A saída é uma senoide da *mesma frequência* $omega$, com *amplitude* e *fase* possivelmente modificadas.
]

#side-by-side(height: auto)[
  #quote-box(color: colors.primary)[
    As exponenciais complexas são *autofunções* dos sistemas SLIT.
  ]
][
  #quote-box(color: colors.safe)[
    $H(omega)$ é a *resposta em frequência* do sistema — tema da próxima unidade.
  ]
]

#exercise-slide(source: [Estabilidade e causalidade])[
  Para cada resposta ao impulso, diga se o sistema SLIT é *causal* e/ou *estável*.

  + $h[n] = (1/2)^n u[n]$
  + $h[n] = 2^n u[n]$
  + $h[n] = delta[n] - delta[n - 1]$
  + $h[n] = u[n]$
  + $h[n] = (1/2)^(|n|)$

  #pagebreak()
  === Resposta

  #set text(size: .9em)
  #table(
    columns: (auto, 1fr, 1fr),
    align: (left, center, center),
    table.header([$h[n]$], [Causal?], [Estável?]),
    [$(1/2)^n u[n]$], [Sim], [Sim ($sum = 2$)],
    [$2^n u[n]$], [Sim], [Não ($sum -> infinity$)],
    [$delta[n] - delta[n-1]$], [Sim], [Sim ($sum = 2$)],
    [$u[n]$], [Sim], [Não ($sum -> infinity$)],
    [$(1/2)^(|n|)$], [Não ($h[n] != 0$ p/ $n<0$)], [Sim ($sum = 3$)],
  )
]

== Resumo da unidade

#bullet-list[
  #set list(indent: 1em)
  - Um *sistema discreto* transforma $x[n]$ em $y[n] = H{x[n]}$;
  - Propriedades: linearidade, invariância no tempo, memória, causalidade, realimentação, estabilidade e invertibilidade;
  - Sistemas *SLIT* são lineares e invariantes no tempo, e ficam *completamente descritos* pela resposta ao impulso $h[n]$;
  - A saída é a *convolução*: $y[n] = x[n] * h[n]$;
  - Propriedades da convolução: elemento neutro, comutatividade, distributividade (paralelo), associatividade (cascata), causalidade ($h[n]=0$ p/ $n<0$) e estabilidade ($sum |h[n]| < infinity$).
]

#v(0.5em)
#quote-box(color: colors.primary)[
  A próxima unidade estuda a *resposta em frequência* $H(omega)$ e a Transformada de Fourier de Tempo Discreto.
]

#import "@local/ufac-syllabus:0.0.1": *

#show: ufac-syllabus.with(
  instructor: "Lucas L. Rodrigues / Omar A. C. Vilcanqui",
  semester: (2026, 1),
  subject: "Processamento Digital de Sinais",
  subject-code: "CCET387",
  prerequisites: ("CCET488",),
  credits: ("4", "0", "0"),
  subject-datetime: "13h20 – 15h00 (Terças e Quintas)",
  syllabus: [
    Introdução; Sinais e sistemas de tempo discreto; Representação em frequência - Transformada de Fourier de Tempo Discreto; Reposta em frequência; Sistemas FIR e IIR; Amostragem e reconstrução de sinais; Série Discreta de Fourier; Transformada Discreta de Fourier; Aplicações da DFT - Análise espectral de sinais; Transformada Z; Análise de sistemas de tempo discreto; Filtros digitais; Projeto de filtros digitais tipo FIR e IIR.
  ],
  main-objective: [
    Capacitar o aluno para desenvolver sistemas de processamento de sinais digitais e realizar sua implementação em dispositivos dedicados.
  ],
  specific-objectives: (
    [Realizar aplicações envolvendo análise espectral e filtragem digital.],
    [Realizar amostragem e reconstrução de sinais.],
    [Desenvolver algoritmos para processamento digital de sinais.],
    [Realizar o projeto de filtros Digitais IIR e FIR.],
  ),
  program-content: (
    (
      title: "Sinais de tempo discreto",
      meetings: 4,
      topics: [
        - Sinais discretos
        - Propriedades e operações com Sinais Discretos
        - Sinais elementares
        - Propriedades de Sinais Discretos
      ],
    ),
    (
      title: "Sistemas de tempo discreto",
      meetings: 4,
      topics: [
        - Sistemas discretos
        - Propriedades e operações com sistemas discretos
        - Sistemas Lineares e Invariantes no Tempo (SLIT)
        - Propriedades de SLIT
      ],
    ),
    (
      title: [$P_1$ – Prova 1],
      meetings: 1,
      isTopic: false,
      break-after: true,
    ),
    (
      title: "Transformada de Fourier de tempo discreto (DFT)",
      meetings: 4,
      topics: [
        - Resposta no domínio da frequência
        - Transformada de Fourier de Tempo Discreto (DFT)
        - Propriedades da DFT
        - Implementação da DFT e Transformada Rápida de Fourier (FFT)
        - Aplicações da DFT
      ],
    ),
    (
      title: "Série de Fourier de tempo discreto",
      meetings: 4,
      topics: [
        - Série de Fourier de Tempo Discreto
        - Propriedades da Série de Fourier de Tempo Discreto
        - Relação entre a DFT e a Série de Fourier de Tempo Discreto
      ],
    ),
    (
      title: "Transformada Z",
      meetings: 4,
      topics: [
        - Definição de transformada Z
        - Propriedades da transformada Z
        - Relação entre a DFT e a transformada Z
        - Transformada unilateral e bilateral
        - Aplicações da transformada Z
      ],
    ),
    (
      title: [$P_2$ – Prova 2],
      meetings: 1,
      isTopic: false,
    ),
    (
      title: "Amostragem",
      meetings: 4,
      topics: [
        - Definição de amostragem
        - _Aliasing_ e Teorema de amostragem de Nyquist-Shannon
        - Taxa de amostragem e quantização (Relacionada à amostragem)
        - Reconstrução de sinais a partir de amostras
        - Superamostragem e subamostragem
        - Aplicações da amostragem
      ],
    ),
    (
      title: "Filtros digitais FIR",
      meetings: 4,
      topics: [
        - Definição e classificação de filtros digitais
        - Janelamento de filtros FIR
        - Implementação e aplicação de filtros digitais FIR
      ],
    ),
    (
      title: "Filtros digitais IIR",
      meetings: 4,
      topics: [
        - Filtros analógicos (Butterworth, Chebyshev, Elíptico)
        - Conversão de filtros analógicos para digitais
        - Implementação e aplicação de filtros digitais IIR
        - Comparação entre filtros FIR e IIR
      ],
    ),
    (
      title: [$P_3$ – Prova 3],
      meetings: 1,
      isTopic: false,
    ),
    (
      title: [$T$ – Trabalho final],
      meetings: 1,
      isTopic: false,
    ),
  ),
  assignments: [
    As avaliações das disciplinas serão compostas por:
    - 3 provas escritas ($P_i$ com $i in {1, 2, 3}$)
    - 3 Listas de exercícios ($L_i$ com $i in {1, 2, 3}$, uma para cada prova)
    - 1 trabalho final ($T$)

    Cada prova e cada lista irá compor uma nota parcial dada por:

    $
      A_i = "0,8" dot P_i + "0,2" dot L_i
    $

    A nota parcial, $N_1$, será dada por:

    $
      N_1 = (A_1 + A_2)/2
    $

    E a nota parcial, $N_2$, será dada por:
    $
      N_2 = (A_3 + T)/2
    $

    Por fim a média final, $N_f$, será dada por:
    $
      N_f = (N_1 + N_2)/2
    $

    Caso o discente não atinja média 8,0, será realizada uma avaliação que terá o valor do exame final.
  ],
  main-bibliography: [
    + NALON, José Alexandre. Introdução ao Processamento Digital de Sinais. Rio de Janeiro: LTC, 2009. 220 p.
    + DINIZ, Paulo SR; DA SILVA, Eduardo AB; NETTO, Sergio L. Processamento digital de sinais-: Projeto e análise de sistemas. Bookman Editora, 2014.
    + CHEN, C. T., “Digital Signal Processing – Spectral computation and filter design”, Oxford University Press, 2001.
    + PROAKIS J. G., MANOLAKIS D. G., “Digital signal processing - principles, algorithms and applications”, Prentice Hall, 1996.
    + SCHILLING, Robert J.; HARRIS, Sandra L. Digital signal processing using MATLAB. Cengage Learning, 2016.
  ],
  complementary-bibliography: [
    + ALKIN, O., “Digital Signal Processing: A Laboratory Approach Using DSP”, Prentice Hall, 1994.
    + HU, G. S. Introduction to digital signal processing. Beijing: Tsinghua University Press, 2005.
    + TAN, Lizhe; JIANG, Jean. Digital signal processing: fundamentals and applications. Academic Press, 2018.
    + KARL, John H. An introduction to digital signal processing. Elsevier, 2012.
    + FRERKING, Marvin. Digital signal processing in communications systems. Springer Science & Business Media, 2013.
    + OPPENHEIM, A. V., SCHAFER, R. W., “Discrete-Time Signal Processing”, Prentice Hall, 1999.
  ],
)


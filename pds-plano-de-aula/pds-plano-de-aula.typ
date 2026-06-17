#import "@local/ufac-syllabus:0.0.1": *

#let plano = json("../data/pds-plano.json")
#let course = plano.at("course")
#let bibliography = plano.at("bibliography")
#let semester = course.at("semester")

#let specific-objectives = course.at("specific-objectives").map(item => [#item])
#let program-content = (
  course
    .at("program-content")
    .map(section => (
      title: section.at("title"),
      meetings: section.at("meetings"),
      isTopic: section.at("isTopic", default: true),
      break-after: section.at("break-after", default: false),
      topics: section.at("topics", default: ()).map(topic => [#topic]),
    ))
)

#show: ufac-syllabus.with(
  instructor: course.at("instructor"),
  semester: (semester.at(0), semester.at(1)),
  subject: course.at("subject"),
  subject-code: course.at("subject-code"),
  prerequisites: course.at("prerequisites"),
  credits: course.at("credits"),
  subject-datetime: course.at("subject-datetime"),
  syllabus: course.at("syllabus"),
  main-objective: course.at("main-objective"),
  specific-objectives: specific-objectives,
  program-content: program-content,
  assignments: [
    As avaliações das disciplinas serão compostas por:
    - 3 provas escritas ($P_i$ com $i in {1, 2, 3}$);
    - 3 Listas de exercícios ($L_i$ com $i in {1, 2, 3}$, uma para cada prova);
    - 1 trabalho final ($T$).

    Cada prova e cada lista irá compor uma nota parcial dada por:

    $
      A_i = "0,7" dot P_i + "0,3" dot L_i
    $

    Sendo $i in {1, 2, 3}$.

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
    #for item in bibliography.at("main") [
      + #item
    ]

    #v(2em)
  ],
  complementary-bibliography: [
    #for item in bibliography.at("complementary") [
      + #item
    ]
  ],
)


// edited on 10/04/2025

// ============================
// VARIABLES TO MODIFY
// ============================

// List of authors
#let authors = (
  "Peter PARKER",
)

// Information about the student
#let studentInfo = [*Élève ingénieur en 3#super[ème] année* #linebreak()
  Promotion 2025 #linebreak()
  Année 2024/2025]

// Title of the report
#let title = [Étude d'une plateforme d'intervention en temps réel pour les Avengers]

// Details about the internship
#let internshipDetails = [Stage effectué du *1er mars au 30 août 2025*, au sein de la société *ShieldTech*, située à New York.

  Sous la responsabilité de : #linebreak()
  - M. *Steve Rogers,* Directeur de la Stratégie #linebreak()
  - Mme *Natasha Romanoff*, Responsable des Opérations Secrètes #linebreak()
]

// ============================
// CONFIGURATION
// ============================

#let project(body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)

  // Set the page properties
  set page(paper: "a4", margin: auto, number-align: center)

  // Set the text properties
  set text(font: "New Computer Modern", size: 12pt, lang: "fr", region: "fr")
  /* for English: lang: 'en' and region: 'us'
  For other languages/regions, refer to this page:
  lang: https://en.wikipedia.org/wiki/ISO_639
  region: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2 */

  // Set the heading properties
  set heading(numbering: "I.1.a)")
  // config. of the spacing after headings
  show heading: set block(spacing: 1em)
  // show heading.where(level: 1): set block(spacing: 1.5em)

  // Set the list properties
  set list(indent: 15pt, marker: [--]) // config. of lists

  // Set the equation numbering
  set math.equation(numbering: "(1)")

  // Configure the figure caption alignment:
  // if figure caption has more than one line,
  // it makes it left-aligned
  show figure.caption: it => {
    layout(size => [
      #let text-size = measure(it.supplement + it.separator + it.body)
      #let my-align
      #if text-size.width < size.width {
        my-align = center
      } else {
        my-align = left
      }
      #align(my-align, it)
    ])
  }

  // Configure the raw block properties
  show raw.where(block: true): set par(justify: false)

  // First page configuration
  align(center + horizon)[
    #block(text(weight: 700, size: 22pt, [*ENSEA*]))

    #block(text(
      weight: 700,
      size: 16pt,
      [*École Nationale Supérieure de l'Électronique et de ses Applications*],
    ))

    #block(
      text(
        weight: 400,
        size: 14pt,
        [Établissement public, sous tutelle du ministère de l'Enseignement Supérieur et de la Recherche #linebreak()
          Habilité par la CTI à délivrer le diplôme d’Ingénieur #linebreak()
          Membre de la Conférence des grandes écoles #linebreak()
          Membre de CY-Alliance],
      ),
    )

    #linebreak()
    #stack(
      dir: ltr, // left-to-right
      spacing: 5em, // space between contents
      image("assets/logo-ENSEA.jpg", width: 25%),
      image("../media/avengers-logo.png", width: 25%),
    )

    #linebreak()
    #block(text(weight: 700, size: 22pt, [RAPPORT DE STAGE]))

    #linebreak()
    #block(text(weight: 700, size: 16pt, [#(
        authors.map(strong).join(", ", last: " et ")
      )]))

    #block(text(weight: 400, size: 14pt, studentInfo))

    #linebreak()
    #block(text(weight: 700, size: 19pt, title))
  ]

  linebreak()
  set par(justify: true)
  block(text(weight: 400, [#internshipDetails]))

  pagebreak()
  // Definition of the following pages with different margins
  set page(
    margin: (top: 100pt, bottom: 150pt),

    header: context [
      #stack(
        dir: ltr,
        align(left + bottom, image("assets/logo-ENSEA.jpg", width: 8%)),
        align(right + bottom)[#highlight[*A COMPLETER*]],
      )
      #box(width: 100%, height: 1pt, fill: black)
    ],

    footer: context [
      #box(width: 100%, height: 1pt, fill: black)
      #align(
        right + top,
      )[*École Nationale Supérieure de l’Électronique et de ses Applications* #linebreak()
        6, avenue du Ponceau • CS20707 Cergy • 95014 Cergy-Pontoise Cedex • France #linebreak()
        #link("tel:+33130736666")[+33 (0)1 30 73 66 66] • #link("www.ensea.fr")[www.ensea.fr]]

      #set align(center + top)
      #counter(page).display("— 1/1 —", both: true)
    ],
  )

  // Contents configuration
  show outline.entry.where(
    // make level 1 headings bold
    level: 1,
  ): it => {
    v(12pt, weak: false)
    strong(it)
  }

  outline(
    // set the maximum level up to which elements are included in the outline
    depth: 2,
  )
  pagebreak()

  // Figure contents configuration
  outline(title: none, target: figure)
  pagebreak()

  [
    #bibliography("../references.bib")
  ]
  pagebreak()

  body
}

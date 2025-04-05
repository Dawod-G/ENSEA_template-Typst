// edited on 05/04/2025

/* #import "@preview/codelst:2.0.2": sourcecode // for code blocks
#sourcecode[```py
code
```] */

/* #figure(
image("media/im1.png", width: 80%),
caption: "") */

/* #figure(
  table(
  columns: (auto, auto, auto),
  inset: 5pt,
  align: left,
  table.header(
    [*A*], [*B*], [*C*],
  ),
  [A1], [B1], [C1],

  [A2], [B2], [C2],
),
caption: ""
) */

// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let authors = (
  "Peter PARKER",
  "Tony STARK",
  "Bruce BANNER",
)

// Information about the student
#let studentInfo = [*Élève ingénieur en 3#super[ème] année* #linebreak()
  Promotion 2025 #linebreak()
  Année 2024/2025]

// Title of the lab
#let title = "Étude d'une plateforme d'intervention en temps réel pour les Avengers"

// Description of the lab objectives
#let labDescription = [
  - Développer une interface de gestion des missions accessible en temps réel par tous les Avengers. #linebreak()
  - Intégrer un système de communication sécurisé et instantané pour faciliter la coordination entre les membres de l'équipe. #linebreak()
  - Implémenter des mécanismes de suivi et de gestion des ressources en mission, comme les équipements et le personnel.
]

#let project(body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)

  // Set the page properties
  set page(
    paper: "a4",
    margin: auto,
    number-align: center,
  )

  // Set the text properties
  set text(font: "New Computer Modern", size: 12pt, lang: "fr", region: "fr")
  /*   pour l'anglais : lang: "en" et region: "us"
  lang: https://en.wikipedia.org/wiki/ISO_639
  region: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2 */

  // Set the heading properties
  set heading(numbering: "1.1.")
  show heading: set block(spacing: 1em) // config. of the spacing after headings
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

  // Title row configuration
  align(center + horizon)[
    #block(text(weight: 700, size: 22pt, [*ENSEA*]))

    #block(
      text(
        weight: 700,
        size: 16pt,
        [*École Nationale Supérieure de l'Électronique et de ses Applications*],
      ),
    )

    #linebreak()
    #stack(
      dir: ltr, // left-to-right
      spacing: 5em, // space between contents
      image("media/logo-ENSEA.jpg", width: 25%),
    )

    #linebreak()
    #block(text(weight: 700, size: 22pt, title))

    #linebreak()
    #block(
      text(
        weight: 700,
        size: 16pt,
        [#authors.map(strong).join(", ", last: " et ")],
      ),
    )

    #block(
      text(
        weight: 400,
        size: 14pt,
        studentInfo,
      ),
    )

    #align(left)[
      #linebreak()
      #block(
        text(
          weight: 400,
          size: 14pt,
          [#underline[*Objectifs*] : #labDescription,],
        ),
      )
    ]

    /*       #heading(outlined: false, numbering: none, text(0.85em, smallcaps[objectif]))
    labDescription */
  ]

  pagebreak()
  set par(justify: true)

  // Definition of the following pages with different margins
  set page(
    margin: (top: 100pt),
    header: context [
      #stack(
        dir: ltr,
        image("media/logo-ENSEA.jpg", width: 10%),
        align(right)[#highlight[*A COMPLETER*]],
      )
    ],

    footer: context [
      #set align(center)
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

  /*   outline(depth: 2)
  pagebreak() */

  body
}

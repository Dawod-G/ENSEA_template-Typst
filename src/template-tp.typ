// edited on 15/05/2025

// ============================
// CONFIGURATION
// ============================

#let lab-report(
  title: none,
  authors: none,
  studentInfo: none,
  labDescription: none,
  body,
) = {
  // Check if all mandatory variables are defined.
  if title == none {
    panic(
      "The `title` variable must be defined. It should be a string representing the title of the report.",
    )
  }

  if authors == none {
    panic(
      "The `authors` variable must be defined. It should be a list of strings representing the authors of the report.",
    )
  }

  if studentInfo == none {
    panic(
      "The `studentInfo` variable must be defined. It should be a string with the student's information.",
    )
  }

  if labDescription == none {
    panic(
      "The `labDescription` variable must be defined. It should be a string describing the lab.",
    )
  }

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

  // Config. of the spacing after headings
  show heading.where(level: 1): set block(spacing: 1em)

  // Set the list properties
  set list(indent: 15pt, marker: [--]) // config. of lists

  // Set the equation numbering
  set math.equation(numbering: "(1)")

  show figure.where(kind: image): set figure(supplement: "Figure")

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

  // From the INSA Typst Template by SkytAsul:
  // https://github.com/SkytAsul/INSA-Typst-Template
  show raw.line: it => if it.count > 1 {
    text(fill: luma(150), str(it.number)) + h(2em) + it.body
  } else { it }

  // Display links in blue
  show link: set text(fill: blue.darken(40%))

  // First page configuration
  align(center + horizon)[
    #block(text(weight: 700, size: 22pt, [*ENSEA*]))

    #block(text(
      weight: 700,
      size: 16pt,
      [*École Nationale Supérieure de l'Électronique et de ses Applications*],
    ))

    #linebreak()
    #stack(
      dir: ltr, // left-to-right
      spacing: 5em, // space between contents
      image("assets/logo-ENSEA.jpg", width: 25%),
    )

    #linebreak()
    #block(text(weight: 700, size: 22pt, title))

    #linebreak()
    #block(text(weight: 700, size: 16pt, [#(
        authors.map(strong).join(", ", last: " et ")
      )]))

    #block(text(weight: 400, size: 14pt, studentInfo))

    #align(left)[
      #linebreak()
      #block(text(
        weight: 400,
        size: 14pt,
        [#underline[*Objectifs*] : #labDescription],
      ))
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

        align(left + bottom, image("assets/logo-ENSEA.jpg", width: 8%)),

        align(right + bottom)[
          #box(width: 88%)[
            #title
          ]
        ],
      )
      #box(width: 100%, height: 1pt, fill: black)
    ],

    footer: context [
      #box(width: 100%, height: 1pt, fill: black)

      #stack(
        dir: ltr,

        align(left + horizon)[
          #box(width: 85%)[#(
              authors.join(", ", last: " et ")
            )]],

        align(right + horizon)[
          #box(width: 8%)[
            #counter(page).display("1/1", both: true)
          ]
        ],
      )

      #set align(center)
    ],
  )

  body
}

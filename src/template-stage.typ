// edited on 15/05/2025

#import "@preview/glossy:0.8.0": *
#import "@preview/hydra:0.6.1": anchor, hydra

// ============================
// CONFIGURATION
// ============================

#let lab-internship(
  companyLogo: none,
  authors: none,
  studentInfo: none,
  title: none,
  internshipDetails: none,
  enableFigureContent: true,
  enableTableContent: true,
  enableGlossary: true,
  enableBibliography: true,
  enableAppendices: true,
  body,
) = {
  // Check if all mandatory variables are defined.
  if companyLogo == none {
    panic(
      "The `companyLogo` variable must be defined. It should be a string representing the path to the company logo.",
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

  if title == none {
    panic(
      "The `title` variable must be defined. It should be a string representing the title of the report.",
    )
  }

  if internshipDetails == none {
    panic(
      "The `internshipDetails` variable must be defined. It should be a string describing the details of the internship.",
    )
  }

  // Set the document's basic properties.
  set document(author: authors, title: title)

  // Set the page properties
  set page(paper: "a4", margin: auto, number-align: center)

  // Set the text properties
  set text(font: "New Computer Modern", size: 12pt, lang: "fr", region: "fr")
  // for English: lang: 'en' and region: 'us'
  // For other languages/regions, refer to this page:
  // lang: https://en.wikipedia.org/wiki/ISO_639
  // region: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2

  // Set the heading properties
  set heading(numbering: "I.1.a)")

  // config. of the spacing after headings
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
      image(companyLogo, width: 25%),
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
    // IS alternateFooter 100pt
    // IS NOT alternateFooter 150pt
    margin: (top: 100pt, bottom: 100pt),

    header: context [
      // to use #hydra outside of the page header, an #anchor must be placed
      #anchor(),

      #stack(
        dir: ltr,

        align(left + bottom, image("assets/logo-ENSEA.jpg", width: 8%)),


        align(center + bottom)[
          #box(width: 75%)[
            #title
          ]
        ],


        align(right + bottom, image(companyLogo, width: 8%)),
      )

      #box(width: 100%, height: 1pt, fill: black)
    ],

    footer: context [
      #box(width: 100%, height: 1pt, fill: black)

      // IS NOT alternateFooter
      // #align(
      //   right + top,
      // )[*École Nationale Supérieure de l’Électronique et de ses Applications* #linebreak()
      //   6, avenue du Ponceau • CS20707 Cergy • 95014 Cergy-Pontoise Cedex • France #linebreak()
      //   #link("tel:+33130736666")[+33 (0)1 30 73 66 66] • #link("www.ensea.fr")[www.ensea.fr]]

      // #set align(center + horizon)
      // #counter(page).display("— 1/1 —", both: true)

      // IS alternateFooter
      #stack(
        dir: ltr,

        align(left + horizon)[
          #box(width: 85%)[
            #emph(hydra(1))
          ]
        ],

        align(right + horizon)[
          #box(width: 8%)[
            #counter(page).display("1/1", both: true)
          ]
        ],
      )
    ],
  )

  // Acknowledgements configuration
  heading(numbering: none, outlined: false)[Remerciements]
  import "template/acknowledgements.typ": remerciements
  remerciements()

  pagebreak()
  // Contents configuration
  show outline.entry.where(
    // make level 1 headings bold
    level: 1,
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }

  outline(
    indent: 1em,
    // depth: 2,
  )


  // Figure contents configuration
  if (enableFigureContent) {
    pagebreak()
    heading(numbering: none)[Liste des figures]
    outline(indent: 1em, title: none, target: figure.where(kind: image))
  }

  // Table contents configuration
  if (enableTableContent) {
    pagebreak()
    heading(numbering: none)[Liste des tableaux]
    outline(indent: 1em, title: none, target: figure.where(kind: table))
  }

  pagebreak()
  body

  // Glossary configuration
  let my-theme = (
    // Renders the main glossary section as a single column
    // Parameters:
    //   title: The glossary section title
    //   body: Content containing all groups and entries
    section: (title, body) => {
      heading(level: 1, title)
      body
    },
    // Renders a group of related glossary terms
    // Parameters:
    //   name: Group name (empty string for ungrouped terms)
    //   index: Zero-based group index
    //   total: Total number of groups
    //   body: Content containing the group's entries
    group: (name, index, total, body) => {
      if name != "" and total > 1 {
        heading(level: 2, name)
      }
      body
    },
    // Renders a single glossary entry with term, definition, and page references
    // Parameters:
    //   entry: Dictionary containing term data:
    //     - short: Short form of term
    //     - long: Long form of term (optional)
    //     - description: Term description (optional)
    //     - label: Term's dictionary label
    //     - pages: Linked page numbers where term appears
    //   index: Zero-based entry index within group
    //   total: Total entries in group
    entry: (entry, index, total) => {
      // Format the term parts
      let term = text(entry.short, weight: "bold")

      // Optional long form
      let long-form = if entry.long == none {
        []
      } else {
        [#text(" (" + entry.long + ")")]
      }

      // Optional description
      let description = if entry.description == none {
        []
      } else {
        [: #entry.description]
      }

      // Optional pages (always plural in French example)
      let pages = if entry.pages == none {
        []
      } else {
        [#text(" (pp. " + entry.pages + ")")]
      }

      // Create the complete entry with hanging indent
      block(spacing: 0.5em, pad(
        left: 1em,
        bottom: 0.5em,
        block([#term#entry.label#long-form#description #h(1em) #pages]),
      ))
    },
  )

  if (enableGlossary) {
    pagebreak()
    glossary(
      title: "Glossaire",
      theme: my-theme,
      sort: true,
      ignore-case: false,
    )
  }

  // Bibliography configuration
  if (enableBibliography) {
    pagebreak()
    show bibliography: set heading(numbering: "I.1.a)")
    bibliography("template/references.bib")
  }

  // Appendices configuration
  if (enableAppendices) {
    pagebreak()
    set heading(numbering: none, supplement: "Annexe")
    heading()[Annexes]
    import "template/appendices.typ": annexes
    annexes()
  }
}

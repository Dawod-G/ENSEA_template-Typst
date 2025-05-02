// edited on 02/05/2025

#import "@preview/glossy:0.8.0": *
#show: init-glossary.with(yaml("2-glossary.yaml"))

// ============================
// VARIABLES TO MODIFY
// ============================

#import "template/rapport-tp.typ": *

// ============================
// CONFIGURATION
// ============================

#let quoteBlock = rect.with(fill: luma(240), stroke: (left: 0.25em))

// #show link: set text(fill: blue.darken(40%))
// // Display links in blue.
// // Disabled for now because it also displays footer links in blue.

#show: project.with()

// ============================
// START HERE
// DELETE THE LINES BELOW THIS COMMENT
// ============================

= Titre de niveau 1
#lorem(70)

== Titre de niveau 2
#lorem(50)

=== Titre de niveau 3
#lorem(35)

// Insert a page break
#pagebreak()

= Conclusion
#lorem(350)

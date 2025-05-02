// edited on 02/05/2025

/* #import "@preview/glossy:0.8.0": * */
/* #show: init-glossary.with(yaml("glossary.yaml")) */

// ============================
// VARIABLES TO MODIFY
// ============================

#import "template/rapport-stage.typ": *

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

= Introduction
#lorem(70)

== Une figure pour illustrer la "Liste des figures"
#figure(image("template/assets/logo-ENSEA.jpg", width: 25%), caption: [Logo de l'ENSEA])

== Une tableau pour illustrer la "Liste des tableaux"
#figure(
table(
  columns: 3,
  align: (center, left, right),
  inset: 6pt,
  stroke: 1pt,
  fill: (none, none, none),

  // Header row
  table.header(
    [N°], [Nom de l'étudiant], [Note finale]
  ),

  // Body
    [001], [Alice Dupont], [16,5],
    [002], [Bruno Lefèvre], [14,8],
    [003], [Claire Noël], [12,7],
), caption: [Résultats des étudiants à l'examen]
)

== Une référence pour illustrer la "Bibliographie"
Dans le traité "*Philosophiæ Naturalis Principia Mathematica*" @newton1833philosophiae, Newton énonce ses célèbres lois du mouvement et la loi de la gravitation universelle, posant ainsi les bases de la mécanique classique.

// Insert a page break
#pagebreak()

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

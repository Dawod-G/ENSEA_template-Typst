#import "template/rapport-tp.typ": *
#import "@preview/glossy:0.8.0": *

#show link: set text(fill: blue.darken(40%))
// #show: init-glossary.with(yaml("glossary.yaml"))

#show label("red"): set text(red)

#let quoteBlock = rect.with(fill: luma(240), stroke: (left: 0.25em))

#show: project.with()

= Introduction
#lorem(30)

== In this paper
#lorem(10)

=== Contributions
#lorem(20)

= Related Work
#lorem(150)
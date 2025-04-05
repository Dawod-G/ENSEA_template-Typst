#import "template/rapport-tp.typ": *
#import "@preview/glossy:0.8.0": *

#show link: set text(fill: blue.darken(40%))
// #show: init-glossary.with(yaml("glossary.yaml"))

#show label("red"): set text(red)

#let quoteBlock = rect.with(fill: luma(240), stroke: (left: 0.25em))

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with()

// We generated the example code below so you can see how
// your document will look. Go ahead and replace it with
// your own content!

= Introduction
#lorem(30)

== In this paper
#lorem(10)

=== Contributions
#lorem(20)

= Related Work
#lorem(150)
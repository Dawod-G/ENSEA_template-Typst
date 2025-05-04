// In this file, use level 2 headings(`heading(level: 2)` or `==`)
// to properly organize the appendices under the "Appendices" chapter.

#let annexes() = {
  text[
    #heading(level: 2)[Logo de l'ENSEA (encore)]
    #figure(
      image("media/logo-ENSEA.jpg", width: 25%),
      caption: [Logo de l'ENSEA (encore)],
    )

    == Logo générique
    #figure(image("media/logo.png", width: 25%), caption: [Logo générique])
  ]
}

#let annexes() = {
  text[
    Dans `annexe.typ`, il faut utiliser des titres de niveau 2 (`heading(level: 2)` ou `==`) pour que les annexes soient bien organisées sous la chapitre "Annexes".

    #heading(level: 2)[Logo de l'ENSEA (encore)]
    #figure(
      image("template/assets/logo-ENSEA.jpg", width: 25%),
      caption: [Logo de l'ENSEA (encore)],
    )

    == Logo des Avengers
    #figure(image("media/logo-2.png", width: 25%), caption: [Logo des Avengers])
  ]
}

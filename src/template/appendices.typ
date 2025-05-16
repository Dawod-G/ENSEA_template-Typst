// In this file, use level 2 headings(`heading(level: 2)` or `==`)
// to properly organize the appendices under the "Appendices" chapter.

// ============================
// CONFIGURATION
// ============================

#let annexes() = {
  counter(heading).update(0)

  // From Reddit:
  // https://www.reddit.com/r/typst/comments/18exrv5/hide_previous_level_heading_counters/?rdt=64643
  set heading(
    numbering: (..nums) => {
      // Get the position of the title in the hierarchy
      let nums = nums.pos()

      let level = nums.len() - 1

      // Indentation could be calculated based on the level
      // let indent = level * 1em

      // Define the number to display based on the position in the hierarchy
      let num = nums.last()

      let style = ("1.", "A)", "1)").at(level)

      numbering(style, num)
    },
    supplement: "Annexe",
  )

  // From the Typst forum:
  // https://forum.typst.app/t/how-to-change-numbering-in-appendix/1716/5
  // Reset figure and table counters to 0 at each level-2 heading
  show heading.where(level: 2): hdr => {
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    hdr
  }

  text[
    // ============================
    // START HERE
    // ============================

    #heading(level: 2)[Logo de l'ENSEA (encore)]
    #figure(
      image("media/logo-ENSEA.jpg", width: 25%),
      caption: [Logo de l'ENSEA (encore)],
    )

    == Logo générique
    #figure(image("media/logo.png", width: 25%), caption: [Logo générique])

    // ============================
    // STOP HERE
    // ============================
  ]
}

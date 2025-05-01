// edited on 30/04/2025

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

#quoteBlock[⚠️ Pensez à mettre à jour les librairies suggérées dans ce document vers leur dernière version.]

= Titre de niveau 1
#lorem(70)

== Titre de niveau 2
#lorem(50)

=== Titre de niveau 3
#lorem(35)

// Insert a page break
#pagebreak()

= Listes

== Liste numérotée
+ Première étape
+ Deuxième étape
+ Troisième étape

== Liste à puces
- Élément 1
- Élément 2
- Élément 3

== Combinaison de listes
+ Première étape
  - Élément 1
  - Élément 2
+ Deuxième étape
+ Troisième étape

= Équations
Les formules mathématiques peuvent être affichées sur une ligne séparée si elles commencent et se terminent par un espace, par exemple avec la *Loi de la gravitation universelle de Newton* ci-dessous :

$ F = G (m_1 m_2) / r^2 $ <eq-loiNewton>

#quoteBlock[Dans cette template, les équations sont numérotées automatiquement lorsqu’elles sont placées sur une ligne isolée.]

De cette loi découle l'*énergie potentielle de gravitation* : $U_"potentielle" = -(G M m) / R$.

Pour plus d'informations sur les formules mathématiques : https://typst.app/docs/reference/math/

La librairie `equate` propose de nombreuses améliorations pour les expressions.

Pour plus d'informations : https://typst.app/universe/package/equate/

= Bloc de code
Le code peut être écrit de plusieurs manières, nativement ou en important une librairie.

== Nativement
```py
# Constante de gravitation universelle
G = 6.67430e-11  # en m^3 kg^-1 s^-2

def force_gravitationnelle(m1, m2, r):

    # m1, m2 : masses des deux objets en kg
    # r : distance entre les centres des objets en mètres

    return G * (m1 * m2) / r**2
```

Pour plus d'informations : https://typst.app/docs/reference/text/raw/

== Avec la librairie `codelst`
#import "@preview/codelst:2.0.2": sourcecode

#sourcecode[```py
  # Constante gravitationnelle
  G = 6.67430e-11  # en m^3 kg^-1 s^-2

  def force_gravitationnelle(m1, m2, r):

      # m1, m2 : masses des deux objets en kg
      # r : distance entre les centres des objets en mètres

      return G * (m1 * m2) / r**2
  ```]

Pour plus d'informations : https://typst.app/universe/package/codelst

= Divers

== Insérer une image

=== Sans légende
#align(
  center,
  // pour centrer horizontalement l'image
  image("template/assets/IsaacNewton.jpg", width: 25%),
)

=== Avec légende
#figure(
  image("template/assets/IsaacNewton.jpg", width: 25%),
  caption: [Isaac Newton],
)

Les figures sont automatiquement centrées horizontalement.

Pour plus d'informations : https://typst.app/docs/reference/model/figure

== Insérer un tableau
#figure(
  table(
    columns: 4,
    table.header(
      [*Planète*],
      [*Masse (kg)*],
      [*Distance au Soleil (m)*],
      [*Force gravitationnelle (N)*],
    ),

    [*Mercure*], [3.3011e23], [5.791e10], [2.00e22],
    [*Vénus*], [4.8675e24], [1.082e11], [5.90e22],
    [*Terre*], [5.972e24], [1.496e11], [3.54e22],
    [*Mars*], [6.4171e23], [2.279e11], [1.22e21],
  ),
  caption: "Forces gravitationnelles entre le Soleil et quelques planètes",
)

== Insérer un graphe avec `cetz` et `cetz-plot`
La prise en main de ces packages peut être difficile au début.

Consultez la documentation de #underline[*#link("https://typst.app/universe/package/cetz/")[cetz]*] et de #underline[*#link("https://typst.app/universe/package/cetz-plot/")[cetz-plot]*].

== Citer une source
Pour citer une source, on peut utiliser les méthodes suivantes :
```
- Méthode 1 : @newton1833philosophiae
- Méthode 2 : #cite(<newton1833philosophiae>)
```

// In a block to avoid the following errors:
// - "The document does not contain a bibliography"
// - "Label <random-label> does not exist in the document"
// This happens when the "rapport-stage" template is selected, as it doesn't contain a bibliography.

#underline[*ASTUCES :*] Pour les références scientifiques, vérifier en priorité la disponibilité de la source sur Google Scholar, car la mise en forme BibTeX y est déjà fournie. Si c'est le cas, cliquer sur "Citer", puis sur "BibTeX", ensuite coller le texte dans le fichier "source.bib".

== Liens cliquables
On peut intégrer des liens cliquables à l'aide de la commande `link`. Par exemple, voici un lien vers la #link("https://typst.app/docs/")[documentation de Typst].

Pour plus d'informations : https://typst.app/universe/package/cetz-plot/

== Diagrammes de Gantt avec `gantty`

#import "@preview/gantty:0.2.0": gantt
#gantt(yaml("gantty.yaml"))

Pour plus d'informations : https://typst.app/universe/package/gantty/

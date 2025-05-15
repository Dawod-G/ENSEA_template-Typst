#import "../template-letter.typ": letter

// ============================
// VARIABLES TO MODIFY
// ============================

#show: letter.with(
  // List of authors
  authors: (
    "Jean DUPONT",
  ),
  position: [1Gx TDy TPz],
  date: datetime.today(),
)

// ============================
// START HERE
// DELETE THE LINES BELOW THIS COMMENT
// ============================

= Titre de niveau 1
#lorem(70)

== Titre de niveau 2
#lorem(50)

#figure(image("media/logo-ENSEA.jpg", width: 25%), caption: [Logo de l'ENSEA])

=== Titre de niveau 3
#lorem(35)

```java
// HelloWorld.java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

// Insert a page break
#pagebreak()

= Conclusion
#lorem(350)

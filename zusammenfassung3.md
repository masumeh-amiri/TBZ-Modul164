## Mehrfachbeziehungen:

Eine Mehrfachbeziehung passiert, wenn mehrere Objekte miteinander verbunden sein können.

Beispiel: Ein Schüler kann mehrere Kurse besuchen und ein Kurs kann mehrere Schüler haben.

Das nennt man auch Viele-zu-Viele-Beziehung.

Dafür braucht man oft eine Zwischentabelle (z.B. "Schüler_Kurse"), um die Verbindungen zu speichern.


[Schüler] ---< [Schüler_Kurse] >--- [Kurs]

Ein Schüler kann mehrere Kurse besuchen.

Ein Kurs kann mehrere Schüler haben.

Zwischentabelle Schüler_Kurse:

Schüler_ID

Kurs_ID


## Rekursion (strenge Hierarchie):

Bei einer Rekursion zeigt ein Objekt auf sich selbst.

Strenge Hierarchie bedeutet: klare Ebenen, kein Kreis, immer nur eine Richtung.

Beispiel: In einer Firma hat jeder Mitarbeiter genau einen Chef und dieser Chef hat auch einen Chef usw.

In der Tabelle gibt es dann ein Feld wie "Chef_ID", das wieder auf die gleiche Tabelle zeigt.

[Mitarbeiter]
    |
    |-- Chef_ID (zeigt auf einen anderen Mitarbeiter)


Ein Mitarbeiter hat genau einen Chef.

Chef_ID verweist auf die ID eines anderen Mitarbeiters.

Keine Kreise erlaubt (keiner ist sein eigener Chef).

## Einfache Hierarchie (mit Zwischentabelle):

Hierarchien, wo mehrere Verbindungen möglich sind, brauchen manchmal eine Zwischentabelle.

Beispiel: Ein Produkt kann mehreren Kategorien zugeordnet sein (z.B. "Elektronik" und "Haushalt").

Die Zwischentabelle hilft, diese lockere Verbindung zu speichern (z.B. "Produkt_Kategorie").
### Beispiele zu Mehrfachbeziehungen, Rekursion und einfacher Hierarchie


[Produkt] ---< [Produkt_Kategorie] >--- [Kategorie]
Ein Produkt kann mehreren Kategorien zugeordnet sein.

Eine Kategorie kann mehrere Produkte haben.

Zwischentabelle Produkt_Kategorie:

Produkt_ID

Kategorie_ID






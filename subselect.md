 ## Subselect Aufgaben

### Teil 1 (Skalare Subquery)

#### Welches ist das teuerste Buch in der Datenbank?
![a1](/subquery_pic/subselec1.jpg)
#### Welches ist das billigste Buch in der Datenbank?
![](/subquery_pic/subselect2.jpg)
#### Lassen Sie sich alle Bücher ausgeben, deren Einkaufspreis über dem durchschnittlichen Einkaufspreis aller Bücher in der Datenbank liegt.
![](/subquery_pic/subselect3.jpg)
#### Lassen Sie sich alle Bücher ausgeben, deren Einkaufspreis über dem durchschnittlichen Einkaufspreis der Thriller liegt.
![](/subquery_pic/subselect4.jpg)
#### Lassen Sie sich alle Thriller ausgeben, deren Einkaufspreis über dem durchschnittlichen Einkaufspreis der Thriller liegt.
![](/subquery_pic/subselect5.jpg)
#### Lassen Sie sich alle Bücher ausgeben, bei denen der Gewinn überdurchschnittlich ist; bei der Berechnung des Gewinndurchschnitts berücksichtigen Sie NICHT das Buch mit der id 22.

![](/subquery_pic/subselect6.jpg)
### Teil 2 (Subquery nach FROM)


#### Wir brauchen die Summe der durchschnittlichen Einkaufspreise der einzelnen Sparten. Allerdings wollen wir dabei nicht die Sparte Humor berücksichtigen, ebenso wenig die Sparten, in denen der durchschnittliche Einkaufspreis 10 Euro oder weniger beträgt.
Tipp: Erstellen Sie ein Subselect, dessen Ergebnis eine Tabelle ist, in der die gewünschten Sparten und ihre durchschnittlichen Einkaufspreise ausgegeben werden.
Von dieser Tabelle fragen Sie anschließend die Summe ab.
![](/subquery_pic/subselct2_1.jpg)

#### "Bekannte Autoren" definieren wir als Autoren, die mehr als 4 Bücher veröffentlicht haben. Wie viele solcher Autor/innen haben wir in der Datenbank?
Tipp: Erstellen Sie ein Subselect, das Ihnen die bekannten Autoren ausgibt. Um zu sehen, ob Ihr Ergebnis plausibel wirkt, lassen Sie sich ausgeben: Vorname, Nachname, Anzahl veröffentlichter Büche.
Über dieses Subselect machen Sie eine einfach COUNT-Abfrage.

![](/subquery_pic/subselect2_2.jpg)
#### Ihr Chef sagt zu Ihnen: "Schauen Sie sich mal alle Verlage an, die im Durchschnitt weniger als 10 Euro Gewinn pro Buch machen. Ich glaube, die verdienen im Schnitt höchstens 7 Euro pro Buch."
Tipp: Erstellen Sie für den ersten Satz des Chefs ein Subselect, das Sie für die Überprüfung des zweiten Satzes verwenden (Ausgabe: 'durchschnittlicher Gewinn pro Buch der Verlage, die weniger als 10 Euro pro Buch
verdienen')
![](/subquery_pic/subselect2_3.jpg)

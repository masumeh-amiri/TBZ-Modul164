### Normaliesierung in der Tabelle
#### 1.NormalForm(2.NF)
Einer Relation befindet sich in der ersten NormalForm, wenn iihre Attribute nur einfache Attributswerte aufweisen.
- Wenn Daten mehrmals eingetragen sind , spricht man vonn Redundanz.

#### 2.NormalForm(2.NF)
Eine Relation befindet sich in der zweiten Normalform , wenn sie in der ersten Normalform ist und jedes nicht zum Identifikationsschlüssel gehörige Attribute voll von diesem abhängig ist.
#### 3.NormalForm(3.NF)
Eine Relation befindet sich in der dritten Normalform, wenn sie in der zweiten Normalform ist und kein Attribut , das nicht zum Identifikationsschlüssel gehört. transitiv(indirekt) von diesem abhängt.

 #### ERM/ERD

Zur grafischen Darstellung von Objekten und deren Beziehungen einer Datenbank ist das Entitäten - Relationen - Modell (ERM) bzw. das Entitäten - Relationen - Diagramm (ERD) weit verbreitet

Bei der Arbeit mit ERDs werden ausschliesslich folgende Fachbegriffe verwendet:

-**Entität:**

In einer Datenbank werden so genannte Objekte (Gegens-tände, Personen, Artikel, Bücher, etc.) und deren Eigenschaf-ten gespeichert. Wenn wir über ein einzelnes Objekt spre-chen, reden wir von einer Entität.

- **Entitätsmenge:**

Die Menge aller Objekte, die vom Typ her zusammengehören, wird Entitätsmenge genannt. Damit ist wortwörtlich eine Menge von Entitaten gemeint.

- **Attribut:**

Die Objekte, über die wir Informationen sammeln, besitzen bestimmte Eigenschaften. Zum Beispiel haben unsere Mitarbeiter jeweils einen Vornamen, einen Nachnamen, eine Adresse, usw.

- **Attributwert:**

Was unterscheidet aber einen Mitarbeiter von einem anderen Mitarbeiter? Die Antwort lautet: die Werte seiner Eigenschaf-ten bzw. Attribute.


### Beziehungstypen in Datenbanken**  

Es gibt drei Haupttypen von Beziehungen zwischen Tabellen:  

#### **(1) 1:1 (One-to-One)**  
Jeder Datensatz in Tabelle A hat genau **einen** entsprechenden Datensatz in Tabelle B.  

**Beispiel:**  
Eine Tabelle **Person** und eine Tabelle **Personalausweis**:  
- Jede Person hat genau **einen** Personalausweis.  

#### **(2) 1:N (One-to-Many)**  
Ein Datensatz in Tabelle A kann mit **mehreren** Datensätzen in Tabelle B verknüpft sein.  

**Beispiel:**  
Ein **Kunde** kann **mehrere** Bestellungen aufgeben, aber jede Bestellung gehört zu **genau einem** Kunden.  
(Das Beispiel oben mit **Kunde** und **Bestellung** zeigt eine 1:N-Beziehung.)  

#### **(3) M:N (Many-to-Many)**  
Ein Datensatz in Tabelle A kann mit **mehreren** Datensätzen in Tabelle B verknüpft sein und umgekehrt.  

**Beispiel:**  
- Ein **Student** kann mehrere **Kurse** belegen.  
- Ein **Kurs** kann von mehreren **Studenten** belegt werden.  
Dafür braucht man eine **Zwischentabelle (Student_Kurs)** mit zwei Fremdschlüsseln.  

```
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Kurs (
    KursID INT PRIMARY KEY,
    Titel VARCHAR(50)
);

CREATE TABLE Student_Kurs (
    StudentID INT,
    KursID INT,
    PRIMARY KEY (StudentID, KursID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (KursID) REFERENCES Kurs(KursID)
);
```
Hier sorgt die **Zwischentabelle "Student_Kurs"** für eine M:N-Beziehung.

---
### Anomalien in einer Datenbasis
Anomalien treten auf, wenn eine Datenbank nicht richtig normalisiert ist. Es gibt drei Arten:

- Einfüge-Anomalie: Neue Daten können nicht eingefügt werden, weil abhängige Daten fehlen.
Beispiel: Ein neuer Kunde kann nicht gespeichert werden, weil er noch keine Bestellung hat.
- Änderungs-Anomalie: Eine Änderung muss an mehreren Stellen gemacht werden, was Inkonsistenzen verursachen kann.
Beispiel: Wenn die Adresse eines Kunden in mehreren Zeilen gespeichert ist, müssen alle geändert werden.
- Lösch-Anomalie: Durch das Löschen eines Datensatzes gehen auch wichtige Informationen verloren.
Beispiel: Löscht man die letzte Bestellung eines Kunden, geht auch die Kundeninformation verloren.
#### . Gibt es redundante Daten? Warum?
Ja, redundante Daten sind mehrfach gespeicherte Daten. Sie können durch schlechte Normalisierung entstehen.

#### Problem: Redundanzen führen zu Speicherplatzverschwendung und Inkonsistenzen.
**Vermeidung:**  Normalisierung (z. B. durch Aufteilung in mehrere Tabellen mit Fremdschlüsseln).
Beispiel für Redundanz:
|KundeID|	Name	|Adresse	|Produkt| 
|1	|Alice	|Berlin	|Laptop|--------------------------
|1	|Alice|	Berlin	|Handy|

Hier ist die Adresse doppelt gespeichert → Redundanz.
**Lösung:** Trennung in zwei Tabellen (Kunde & Bestellung).



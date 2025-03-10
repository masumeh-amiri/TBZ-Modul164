#### 1.NormalForm(2.NF)
Einer Relation befindet sich in der ersten NormalForm, wenn iihre Attribute nur einfache Attributswerte aufweisen.
- Wenn Daten mehrmals eingetragen sind , spricht man vonn Redundanz.

#### 2.NormalForm(2.NF)
Eine Relation befindet sich in der zweiten Normalform , wenn sie in der ersten Normalform ist und jedes niciht zum Identifikationsschlüssel gehörige Attribute voll von diesem abhängig ist.
#### 3.NormalForm(3.NF)
Eine Relation befindet sich in der dritten Normalform, wenn sie in der zweiten Normalform ist und kein Attribut , das nicht zum Identifikationsschlüssel gehört. transitiv(indirekt) von diesem abhängt.
 #### ERM/ERD

Zur grafischen Darstellung von Objekten und deren Beziehungen einer Datenbank ist das Entitäten - Relationen - Modell (ERM) bzw. das Entitäten - Relationen - Diagramm (ERD) weit verbreitet

Bei der Arbeit mit ERDs werden ausschliesslich folgende Fachbegriffe verwendet:

-  Entität:

In einer Datenbank werden so genannte Objekte (Gegens-tände, Personen, Artikel, Bücher, etc.) und deren Eigenschaf-ten gespeichert. Wenn wir über ein einzelnes Objekt spre-chen, reden wir von einer Entität.

- Entitätsmenge:

Die Menge aller Objekte, die vom Typ her zusammengehören, wird Entitätsmenge genannt. Damit ist wortwörtlich eine Menge von Entitaten gemeint.

- Attribut

Die Objekte, über die wir Informationen sammeln, besitzen bestimmte Eigenschaften. Zum Beispiel haben unsere Mitarbeiter jeweils einen Vornamen, einen Nachnamen, eine Adresse, usw.

- Attributwert:

Was unterscheidet aber einen Mitarbeiter von einem anderen Mitarbeiter? Die Antwort lautet: die Werte seiner Eigenschaf-ten bzw. Attribute.


Die referenzielle Integrität ist ein zentrales Prinzip in relationalen Datenbanken, das sicherstellt, dass Beziehungen zwischen Tabellen konsistent bleiben.  

1. **Erläuterung des Prinzips der referentiellen Integrität (C3G):**  
   - Die referenzielle Integrität stellt sicher, dass Fremdschlüsselwerte immer auf gültige Primärschlüsselwerte verweisen.  
   - Es verhindert, dass Datensätze in einer Tabelle existieren, die auf nicht existierende Datensätze in einer anderen Tabelle verweisen.  
   - Dies wird durch Einschränkungen (Constraints) wie `FOREIGN KEY` und entsprechende Aktionen definiert.  

2. **Auswirkungen von Löschen und Ändern von Daten auf die referenzielle Integrität (C3F):**  
   - Löscht man einen Primärschlüsselwert, auf den Fremdschlüssel verweisen, entstehen „verwaiste“ Datensätze, falls keine Maßnahmen getroffen werden.  
   - Änderungen an Primärschlüsseln erfordern eine Anpassung der referenzierenden Fremdschlüssel oder können zu Inkonsistenzen führen.  
   - Ohne geeignete Regeln könnten Abfragen falsche oder unvollständige Daten liefern.  

3. **Anwendung von Regeln zur Sicherstellung der Datenbankkonsistenz (C3E):**  
   - **Löschweitergabe (`ON DELETE CASCADE`)**: Beim Löschen eines Primärschlüssels werden alle referenzierenden Datensätze ebenfalls gelöscht.  
   - **Setzen auf NULL (`ON DELETE SET NULL`)**: Beim Löschen eines Primärschlüssels wird der Fremdschlüsselwert in den referenzierenden Datensätzen auf NULL gesetzt.  
   - **Einschränkung (`ON DELETE RESTRICT` oder `ON DELETE NO ACTION`)**: Verhindert das Löschen eines Primärschlüssels, wenn noch abhängige Fremdschlüssel existieren.  
   - **Aktualisierungsweitergabe (`ON UPDATE CASCADE`)**: Änderungen am Primärschlüsselwert werden automatisch in allen referenzierenden Fremdschlüsseln übernommen.  

Durch die konsequente Anwendung dieser Regeln wird die Konsistenz und Integrität der Datenbank gewährleistet.

---
### **1. Referenzielle Integrität**  
Referenzielle Integrität stellt sicher, dass Beziehungen zwischen Tabellen in einer Datenbank konsistent bleiben. Das bedeutet, dass ein Fremdschlüssel (Foreign Key) nur auf vorhandene Primärschlüssel (Primary Key) in einer anderen Tabelle verweisen darf.  

#### **Beispiel:**  
Wir haben zwei Tabellen:  

**Kunde (Customer)**  
| KundeID (Primary Key) | Name     |  
|----------------------|---------|  
| 1                   | Alice   |  
| 2                   | Bob     |  

**Bestellung (Order)**  
| BestellID (Primary Key) | KundeID (Foreign Key) | Produkt  |  
|----------------------|-------------------|---------|  
| 101                  | 1                 | Laptop  |  
| 102                  | 2                 | Handy   |  
| 103                  | 3                 | Tablet  | ❌ **(Fehler: Kein Kunde mit ID 3!)**  

In diesem Beispiel verstößt die dritte Bestellung gegen die referenzielle Integrität, da es keinen Kunden mit **KundeID = 3** gibt.  

---

### **2. Constraints (Einschränkungen in einer Datenbank)**  
Constraints sind Regeln, die helfen, die Datenbankintegrität sicherzustellen.  

**Wichtige Constraints:**  
- **PRIMARY KEY** – Stellt sicher, dass eine Spalte eindeutige Werte hat.  
- **FOREIGN KEY** – Stellt Beziehungen zwischen Tabellen sicher.  
- **NOT NULL** – Erlaubt keine NULL-Werte.  
- **UNIQUE** – Stellt sicher, dass alle Werte in einer Spalte einzigartig sind.  
- **CHECK** – Definiert Bedingungen für gültige Werte.  
- **DEFAULT** – Gibt Standardwerte vor.  

#### **Beispiel:**  
```sql
CREATE TABLE Kunde (
    KundeID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

CREATE TABLE Bestellung (
    BestellID INT PRIMARY KEY,
    KundeID INT,
    Produkt VARCHAR(50) NOT NULL,
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID)
);
```
Hier stellen **PRIMARY KEY**, **NOT NULL** und **FOREIGN KEY** sicher, dass die Daten konsistent bleiben.

---

### **3. Beziehungstypen in Datenbanken**  

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

```sql
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


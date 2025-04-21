## Non-Identifying und Identifying Relationships in Datenbanken


In Datenbanken gibt es Beziehungen (Relationships) zwischen Tabellen, die beschreiben, wie die Daten miteinander verknüpft sind. Diese Beziehungen können in zwei Haupttypen unterteilt werden: **Non-Identifying** und **Identifying Relationships**. Hier ist eine einfache Erklärung:


### 1.Identifying Relationship (Identifizierende Beziehung)
  Eine Identifying Relationship liegt vor, wenn eine Entität (z. B. eine Zeile in einer Tabelle) **nur existieren kann, wenn sie mit einer anderen Entität verknüpft ist**. Das bedeutet, die "Kind"-Tabelle ist **abhängig** von der "Eltern"-Tabelle.  

- **Beispiel:**  
  - Tabelle: **Bestellung** (Eltern-Tabelle)  
  - Tabelle: **Bestellposition** (Kind-Tabelle)  
  - Eine Bestellposition (z. B. ein Artikel in einer Bestellung) kann **nur existieren, wenn es eine Bestellung gibt**. Die Bestellposition hat also eine **identifizierende Beziehung** zur Bestellung.  

- **Schlüssel:**  
  - Der Primärschlüssel der Eltern-Tabelle (z. B. `BestellID`) wird Teil des **Primärschlüssels** der Kind-Tabelle.  
  - In der Kind-Tabelle (`Bestellposition`) wäre der Primärschlüssel z. B. eine Kombination aus `BestellID` und `ArtikelID`.  

- **Grafische Darstellung:**  
  In einem ER-Diagramm wird eine Identifying Relationship oft mit einer **durchgehenden Linie** dargestellt.  

---

### 2.Non-Identifying Relationship (Nicht-identifizierende Beziehung)  
  Eine Non-Identifying Relationship liegt vor, wenn eine Entität **unabhängig** von einer anderen Entität existieren kann. Die "Kind"-Tabelle ist **nicht abhängig** von der "Eltern"-Tabelle.  

- **Beispiel:**  
  - Tabelle: **Kunde** (Eltern-Tabelle)  
  - Tabelle: **Bestellung** (Kind-Tabelle)  
  - Eine Bestellung kann zwar einem Kunden zugeordnet sein, aber die Bestellung kann auch **ohne Kunde existieren** (z. B. als anonyme Bestellung). Die Beziehung ist also **nicht-identifizierend**.  

- **Schlüssel:**  
  - Der Primärschlüssel der Eltern-Tabelle (z. B. `KundenID`) wird in der Kind-Tabelle als **Fremdschlüssel** gespeichert, ist aber **nicht Teil des Primärschlüssels** der Kind-Tabelle.  

- **Grafische Darstellung:**  
  In einem ER-Diagramm wird eine Non-Identifying Relationship oft mit einer **gestrichelten Linie** dargestellt.  

---

### Zusammenfassung der Unterschiede:

| **Merkmal**               | **Identifying Relationship**               | **Non-Identifying Relationship**         |
|---------------------------|--------------------------------------------|------------------------------------------|
| **Abhängigkeit**           | Kind-Tabelle ist abhängig von Eltern-Tabelle | Kind-Tabelle ist unabhängig              |
| **Primärschlüssel**        | Fremdschlüssel ist Teil des Primärschlüssels | Fremdschlüssel ist NICHT Teil des Primärschlüssels |
| **Beispiel**               | Bestellposition → Bestellung               | Bestellung → Kunde                      |
| **Linie im ER-Diagramm**   | Durchgehende Linie                        | Gestrichelte Linie                      |

---

### Warum ist das wichtig? 
- **Identifying Relationships** zeigen, dass eine Entität **nur im Kontext einer anderen Entität existieren kann**.  
- **Non-Identifying Relationships** zeigen, dass eine Entität **unabhängig** ist, aber optional mit einer anderen verknüpft sein kann.

---


### 1.Identifying Relationship in SQL umsetzen
Eine Identifying Relationship bedeutet, dass der Fremdschlüssel der Kind-Tabelle Teil des Primärschlüssels ist.

#### Beispiel:
- **Eltern-Tabelle:** `Bestellung` (Order)
- **Kind-Tabelle:** `Bestellposition` (OrderItem)

```sql
-- Eltern-Tabelle: Bestellung
CREATE TABLE Bestellung (
    BestellID INT PRIMARY KEY,  -- Primärschlüssel
    KundenID INT,
    Bestelldatum DATE
);

-- Kind-Tabelle: Bestellposition (abhängig von Bestellung)
CREATE TABLE Bestellposition (
    BestellID INT,              -- Teil des Primärschlüssels
    ArtikelID INT,               -- Teil des Primärschlüssels
    Menge INT,
    PRIMARY KEY (BestellID, ArtikelID),  -- Zusammengesetzter Primärschlüssel
    FOREIGN KEY (BestellID) REFERENCES Bestellung(BestellID)  -- Fremdschlüssel
);
```

#### Abfrage (Query):
Um alle Bestellpositionen mit den zugehörigen Bestellungen abzurufen:

```sql
SELECT 
    Bestellung.BestellID, 
    Bestellung.Bestelldatum, 
    Bestellposition.ArtikelID, 
    Bestellposition.Menge
FROM 
    Bestellung
JOIN 
    Bestellposition ON Bestellung.BestellID = Bestellposition.BestellID;
```


### 2.Non-Identifying Relationship in SQL umsetzen
Eine Non-Identifying Relationship bedeutet, dass der Fremdschlüssel der Kind-Tabelle **nicht** Teil des Primärschlüssels ist.

#### Beispiel:
- **Eltern-Tabelle:** `Kunde` (Customer)
- **Kind-Tabelle:** `Bestellung` (Order)

```sql
-- Eltern-Tabelle: Kunde
CREATE TABLE Kunde (
    KundenID INT PRIMARY KEY,  -- Primärschlüssel
    Name VARCHAR(100)
);

-- Kind-Tabelle: Bestellung (unabhängig von Kunde)
CREATE TABLE Bestellung (
    BestellID INT PRIMARY KEY,  -- Primärschlüssel
    KundenID INT,               -- Fremdschlüssel (nicht Teil des Primärschlüssels)
    Bestelldatum DATE,
    FOREIGN KEY (KundenID) REFERENCES Kunde(KundenID)  -- Fremdschlüssel
);
```

#### Abfrage (Query):
Um alle Bestellungen mit den zugehörigen Kundendaten abzurufen:

```sql
SELECT 
    Kunde.Name, 
    Bestellung.BestellID, 
    Bestellung.Bestelldatum
FROM 
    Kunde
JOIN 
    Bestellung ON Kunde.KundenID = Bestellung.KundenID;
```

---

### 3.Wichtige SQL-Schlüsselwörter für Beziehungen
- **PRIMARY KEY:** Definiert den Primärschlüssel einer Tabelle.
- **FOREIGN KEY:** Verknüpft eine Spalte mit dem Primärschlüssel einer anderen Tabelle.
- **JOIN:** Verbindet Tabellen basierend auf einer Beziehung (z. B. `INNER JOIN`, `LEFT JOIN`).

---
**"IS-A"** und **"HAS-A"** sind Konzepte, die in der Datenbankmodellierung und objektorientierten Programmierung verwendet werden, um Beziehungen zwischen Entitäten (z. B. Tabellen oder Klassen) zu beschreiben. Sie helfen dabei, die Struktur und die Beziehungen in einer Datenbank oder einem System zu verstehen.

---
### weiter Beispiele:
### Beispiel 1: Identifizierende Beziehung

**Beziehung:** **Person -- Ausweis**

- Der Ausweis ist ohne die Person nicht eindeutig identifizierbar. Die **PersonID** ist daher Teil des Primärschlüssels des Ausweises.

**Datenbankmodell:**
```sql
Person (PersonID, Name)
Ausweis (AusweisID, Ausweisnummer, PersonID)
```
- **Primärschlüssel Ausweis:** (AusweisID, PersonID)

### Beispiel 2: Nicht-Identifizierende Beziehung

**Beziehung:** **Person -- Kleidungsstück**

- Das Kleidungsstück hat eine eigene Identität und kann ohne die Person existieren. Es wird über eine **Person_Kleidungsstück**-Tabelle verbunden.

**Datenbankmodell:**
```sql
Person (PersonID, Name)
Kleidungsstück (KleidungsstückID, Bezeichnung)
Person_Kleidungsstück (PersonID, KleidungsstückID)
```
- **Primärschlüssel Kleidungsstück:** KleidungsstückID

### Beispiel für Identifizierende Beziehung:

**Beziehung:** **Firma -- Vertrag**

- Der Vertrag ist nur durch die Firma eindeutig identifizierbar, da der Vertrag ohne Firma keine eigenständige Identität hat.

**Datenbankmodell:**
```sql
Firma (FirmaID, Name)
Vertrag (VertragID, FirmaID)
```
- **Primärschlüssel Vertrag:** (VertragID, FirmaID)
  
---


### 1.IS-A-Beziehung (Vererbung) 
Die **IS-A-Beziehung** beschreibt eine **Vererbungsbeziehung**. Das bedeutet, dass eine Entität eine spezialisierte Version einer anderen Entität ist.  

#### Beispiel:
- Ein **Auto** ist ein **Fahrzeug**.  
- Ein **Hund** ist ein **Tier**.  

In der Datenbankmodellierung wird dies oft durch **Vererbung** umgesetzt. Es gibt verschiedene Möglichkeiten, dies in einer Datenbank zu implementieren:

#### a)Single Table Inheritance (Eine Tabelle für alle):
- Alle Arten von Entitäten werden in einer einzigen Tabelle gespeichert.  
- Eine Spalte (z. B. `Typ`) gibt an, um welche spezialisierte Entität es sich handelt.  

**Beispiel:**  
```sql
CREATE TABLE Fahrzeug (
    ID INT PRIMARY KEY,
    Typ VARCHAR(50),  -- z. B. "Auto", "Motorrad"
    Marke VARCHAR(100),
    Modell VARCHAR(100),
    AnzahlTueren INT,  -- Nur für Autos relevant
    HelmInklusive BOOLEAN  -- Nur für Motorräder relevant
);
```

#### b)Class Table Inheritance (Eine Tabelle pro Klasse):
- Jede spezialisierte Entität hat eine eigene Tabelle, die mit der allgemeinen Tabelle verknüpft ist.  

**Beispiel:**  
```sql
-- Allgemeine Tabelle
CREATE TABLE Fahrzeug (
    ID INT PRIMARY KEY,
    Typ VARCHAR(50),
    Marke VARCHAR(100),
    Modell VARCHAR(100)
);

-- Spezialisierte Tabellen
CREATE TABLE Auto (
    ID INT PRIMARY KEY,
    AnzahlTueren INT,
    FOREIGN KEY (ID) REFERENCES Fahrzeug(ID)
);

CREATE TABLE Motorrad (
    ID INT PRIMARY KEY,
    HelmInklusive BOOLEAN,
    FOREIGN KEY (ID) REFERENCES Fahrzeug(ID)
);
```

---

### 2.HAS-A-Beziehung (Komposition/Aggregation) 
Die **HAS-A-Beziehung** beschreibt eine **Besitz- oder Teil-Ganzes-Beziehung**. Das bedeutet, dass eine Entität eine andere Entität "enthält" oder "besitzt".  

#### Beispiel:
- Ein **Auto** hat einen **Motor**.  
- Ein **Kunde** hat eine **Adresse**.  

In der Datenbank wird dies durch **Fremdschlüssel** umgesetzt.  

#### Beispiel:
```sql
-- Tabelle: Kunde
CREATE TABLE Kunde (
    KundenID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Tabelle: Adresse (gehört zu Kunde)
CREATE TABLE Adresse (
    AdressID INT PRIMARY KEY,
    KundenID INT,  -- Fremdschlüssel
    Strasse VARCHAR(100),
    Stadt VARCHAR(100),
    FOREIGN KEY (KundenID) REFERENCES Kunde(KundenID)
);
```

Hier hat ein **Kunde** eine **Adresse** (HAS-A-Beziehung). Die Adresse existiert nicht unabhängig vom Kunden.

---

### Unterschied zwischen IS-A und HAS-A:

| **Merkmal**         | **IS-A (Vererbung)**                          | **HAS-A (Komposition/Aggregation)**      |
|----------------------|-----------------------------------------------|------------------------------------------|
| **Beziehung**        | Eine Entität ist eine spezialisierte Version einer anderen. | Eine Entität enthält oder besitzt eine andere. |
| **Beispiel**         | Ein Auto ist ein Fahrzeug.                    | Ein Auto hat einen Motor.                |
| **Umsetzung in SQL** | Vererbung (z. B. Single Table oder Class Table Inheritance). | Fremdschlüssel in einer Tabelle.         |
| **Abhängigkeit**     | Die spezialisierte Entität ist von der allgemeinen Entität abhängig. | Die enthaltene Entität kann unabhängig existieren (bei Aggregation). |

---

### Wann verwendet man IS-A und HAS-A?
- **IS-A:** Wenn du eine hierarchische Struktur modellieren möchtest, z. B. verschiedene Arten von Fahrzeugen (Auto, Motorrad, LKW).  
- **HAS-A:** Wenn du eine Beziehung zwischen zwei Entitäten beschreiben möchtest, z. B. ein Kunde hat eine Adresse oder ein Auto hat einen Motor.



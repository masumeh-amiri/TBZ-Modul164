**Non-Identifying und Identifying Relationships in Datenbanken**

In Datenbanken gibt es Beziehungen (Relationships) zwischen Tabellen, die beschreiben, wie die Daten miteinander verknüpft sind. Diese Beziehungen können in zwei Haupttypen unterteilt werden: **Non-Identifying** und **Identifying Relationships**. Hier ist eine einfache Erklärung:

---

### 1. **Identifying Relationship (Identifizierende Beziehung)**  
- **Was ist das?**  
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

### 2. **Non-Identifying Relationship (Nicht-identifizierende Beziehung)**  
- **Was ist das?**  
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

### **Zusammenfassung der Unterschiede:**

| **Merkmal**               | **Identifying Relationship**               | **Non-Identifying Relationship**         |
|---------------------------|--------------------------------------------|------------------------------------------|
| **Abhängigkeit**           | Kind-Tabelle ist abhängig von Eltern-Tabelle | Kind-Tabelle ist unabhängig              |
| **Primärschlüssel**        | Fremdschlüssel ist Teil des Primärschlüssels | Fremdschlüssel ist NICHT Teil des Primärschlüssels |
| **Beispiel**               | Bestellposition → Bestellung               | Bestellung → Kunde                      |
| **Linie im ER-Diagramm**   | Durchgehende Linie                        | Gestrichelte Linie                      |

---

### **Warum ist das wichtig?**  
- **Identifying Relationships** zeigen, dass eine Entität **nur im Kontext einer anderen Entität existieren kann**.  
- **Non-Identifying Relationships** zeigen, dass eine Entität **unabhängig** ist, aber optional mit einer anderen verknüpft sein kann.

  ---
  In SQL wird eine **Identifying Relationship** oder **Non-Identifying Relationship** nicht direkt als "Query" umgesetzt, sondern sie wird durch die **Datenbankstruktur** (Tabellen, Primärschlüssel, Fremdschlüssel) definiert. Allerdings kannst du Abfragen (Queries) schreiben, um die Beziehungen zwischen den Tabellen zu nutzen und Daten abzurufen.

Hier ist eine Schritt-für-Schritt-Erklärung, wie du solche Beziehungen in SQL umsetzt und Abfragen schreibst:

---

### 1. **Identifying Relationship in SQL umsetzen**
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

---

### 2. **Non-Identifying Relationship in SQL umsetzen**
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

### 3. **Wichtige SQL-Schlüsselwörter für Beziehungen**
- **PRIMARY KEY:** Definiert den Primärschlüssel einer Tabelle.
- **FOREIGN KEY:** Verknüpft eine Spalte mit dem Primärschlüssel einer anderen Tabelle.
- **JOIN:** Verbindet Tabellen basierend auf einer Beziehung (z. B. `INNER JOIN`, `LEFT JOIN`).

---


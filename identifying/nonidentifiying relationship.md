In der Datenbankmodellierung beziehen sich die Begriffe **identifying** und **non-identifying Relationship** auf die Art und Weise, wie Beziehungen zwischen Tabellen definiert werden und wie diese Beziehungen die Primärschlüssel der beteiligten Entitäten beeinflussen.

### 1. **Identifying Relationship**
- **Definition**: Eine Identifying Relationship liegt vor, wenn der Primärschlüssel der übergeordneten Tabelle (Elterntabelle) Teil des Primärschlüssels der untergeordneten Tabelle (Kindtabelle) wird. Das bedeutet, dass die Existenz der Kindtabelle von der Elterntabelle abhängt.
- **Eigenschaften**:
  - Die Beziehung ist **stark** und **obligatorisch**.
  - Der Fremdschlüssel in der Kindtabelle ist gleichzeitig Teil des Primärschlüssels.
  - Wenn die Elterntabelle gelöscht wird, wird die Kindtabelle ebenfalls betroffen sein (z. B. durch Löschung oder Einschränkung).
- **Beispiel**:
  - Eine Tabelle `Bestellung` hat eine Beziehung zur Tabelle `Bestellposition`. Der Primärschlüssel der `Bestellung` (z. B. `BestellID`) ist Teil des Primärschlüssels der `Bestellposition` (z. B. `BestellID` + `PositionID`). Ohne die `Bestellung` kann die `Bestellposition` nicht existieren.

### 2. **Non-Identifying Relationship**
- **Definition**: Eine Non-Identifying Relationship liegt vor, wenn der Fremdschlüssel in der Kindtabelle **nicht** Teil des Primärschlüssels ist. Die Existenz der Kindtabelle hängt nicht zwingend von der Elterntabelle ab.
- **Eigenschaften**:
  - Die Beziehung ist **schwächer** und **optional**.
  - Der Fremdschlüssel in der Kindtabelle ist ein separates Attribut und nicht Teil des Primärschlüssels.
  - Die Kindtabelle kann unabhängig von der Elterntabelle existieren.
- **Beispiel**:
  - Eine Tabelle `Kunde` hat eine Beziehung zur Tabelle `Adresse`. Der Fremdschlüssel `KundeID` in der `Adresse`-Tabelle ist nicht Teil des Primärschlüssels der `Adresse`. Eine `Adresse` kann unabhängig von einem `Kunde` existieren (z. B. wenn die Adresse für andere Zwecke verwendet wird).

### Zusammenfassung der Unterschiede:
| **Merkmal**               | **Identifying Relationship**         | **Non-Identifying Relationship**       |
|---------------------------|--------------------------------------|----------------------------------------|
| **Fremdschlüssel**        | Teil des Primärschlüssels            | Nicht Teil des Primärschlüssels        |
| **Abhängigkeit**           | Starke Abhängigkeit                  | Schwache oder keine Abhängigkeit       |
| **Optionalität**           | Obligatorisch                        | Optional                               |
| **Beispiel**               | Bestellung → Bestellposition         | Kunde → Adresse                        |

Diese Unterscheidung ist wichtig, um die Integrität und Struktur einer Datenbank korrekt zu modellieren.
### 1. **Identifying Relationship**
In diesem Beispiel haben wir zwei Tabellen: `Bestellung` (Elterntabelle) und `Bestellposition` (Kindtabelle). Der Primärschlüssel der `Bestellung` (`BestellID`) ist Teil des Primärschlüssels der `Bestellposition`.

```sql
-- Elterntabelle: Bestellung
CREATE TABLE Bestellung (
    BestellID INT PRIMARY KEY,  -- Primärschlüssel
    Bestelldatum DATE NOT NULL
);

-- Kindtabelle: Bestellposition
CREATE TABLE Bestellposition (
    BestellID INT,              -- Teil des Primärschlüssels
    PositionID INT,             -- Teil des Primärschlüssels
    Produktname VARCHAR(100) NOT NULL,
    Menge INT NOT NULL,
    PRIMARY KEY (BestellID, PositionID),  -- Zusammengesetzter Primärschlüssel
    FOREIGN KEY (BestellID) REFERENCES Bestellung(BestellID) ON DELETE CASCADE
);
```

**Erklärung**:
- Die `Bestellposition`-Tabelle hat einen zusammengesetzten Primärschlüssel (`BestellID` + `PositionID`).
- Die `BestellID` ist ein Fremdschlüssel, der auf die `Bestellung`-Tabelle verweist.
- Wenn eine `Bestellung` gelöscht wird, werden alle zugehörigen `Bestellpositionen` automatisch gelöscht (durch `ON DELETE CASCADE`).

---

### 2. **Non-Identifying Relationship**
In diesem Beispiel haben wir zwei Tabellen: `Kunde` (Elterntabelle) und `Adresse` (Kindtabelle). Der Fremdschlüssel in der `Adresse`-Tabelle (`KundeID`) ist **nicht** Teil des Primärschlüssels.

```sql
-- Elterntabelle: Kunde
CREATE TABLE Kunde (
    KundeID INT PRIMARY KEY,  -- Primärschlüssel
    Name VARCHAR(100) NOT NULL
);

-- Kindtabelle: Adresse
CREATE TABLE Adresse (
    AdresseID INT PRIMARY KEY,  -- Primärschlüssel
    Strasse VARCHAR(100) NOT NULL,
    Stadt VARCHAR(100) NOT NULL,
    PLZ VARCHAR(10) NOT NULL,
    KundeID INT,               -- Fremdschlüssel (nicht Teil des Primärschlüssels)
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID) ON DELETE SET NULL
);
```

**Erklärung**:
- Die `Adresse`-Tabelle hat einen eigenen Primärschlüssel (`AdresseID`).
- Die `KundeID` ist ein Fremdschlüssel, der auf die `Kunde`-Tabelle verweist, aber **nicht** Teil des Primärschlüssels ist.
- Wenn ein `Kunde` gelöscht wird, wird der Fremdschlüssel in der `Adresse`-Tabelle auf `NULL` gesetzt (durch `ON DELETE SET NULL`), da die `Adresse` unabhängig existieren kann.

---

### Zusammenfassung der Beispiele:
- **Identifying Relationship**: Die Kindtabelle (`Bestellposition`) ist stark von der Elterntabelle (`Bestellung`) abhängig, und der Fremdschlüssel ist Teil des Primärschlüssels.
- **Non-Identifying Relationship**: Die Kindtabelle (`Adresse`) ist nicht stark von der Elterntabelle (`Kunde`) abhängig, und der Fremdschlüssel ist **nicht** Teil des Primärschlüssels.

Diese Beispiele zeigen, wie man die beiden Arten von Beziehungen in SQL umsetzt.

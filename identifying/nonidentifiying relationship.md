Hier ist ein Beispiel für eine **Identifying Relationship** und eine **Non-Identifying Relationship** in SQL:

---

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

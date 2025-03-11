In SQL wird eine **FOREIGN KEY Constraint** verwendet, um eine Beziehung zwischen zwei Tabellen herzustellen. Sie stellt sicher, dass der Wert in einer Spalte (oder mehreren Spalten) einer Tabelle (**Kind-Tabelle**) mit einem Wert in einer Spalte einer anderen Tabelle (**Eltern-Tabelle**) übereinstimmt. Dies wird oft verwendet, um die **Referenzielle Integrität** in der Datenbank zu gewährleisten.

Hier ist ein Beispiel, wie du eine **FOREIGN KEY Constraint** in SQL erstellen kannst:

---

### **Beispiel: FOREIGN KEY Constraint erstellen**

#### 1. **Tabellen erstellen**
Angenommen, wir haben zwei Tabellen:
- **Kunde** (Eltern-Tabelle)
- **Bestellung** (Kind-Tabelle)

Jede Bestellung muss einem Kunden zugeordnet sein. Der Fremdschlüssel in der Tabelle `Bestellung` verweist auf den Primärschlüssel in der Tabelle `Kunde`.

```sql
-- Eltern-Tabelle: Kunde
CREATE TABLE Kunde (
    KundenID INT PRIMARY KEY,  -- Primärschlüssel
    Name VARCHAR(100)
);

-- Kind-Tabelle: Bestellung
CREATE TABLE Bestellung (
    BestellID INT PRIMARY KEY,  -- Primärschlüssel
    KundenID INT,               -- Fremdschlüssel
    Bestelldatum DATE,
    FOREIGN KEY (KundenID) REFERENCES Kunde(KundenID)  -- FOREIGN KEY Constraint
);
```

---

#### 2. **FOREIGN KEY Constraint nachträglich hinzufügen**
Falls die Tabelle `Bestellung` bereits existiert und du den Fremdschlüssel später hinzufügen möchtest, kannst du dies mit dem `ALTER TABLE`-Befehl tun:

```sql
ALTER TABLE Bestellung
ADD CONSTRAINT fk_kunde
FOREIGN KEY (KundenID) REFERENCES Kunde(KundenID);
```

- **`fk_kunde`:** Der Name der Constraint (optional). Wenn du keinen Namen angibst, wird einer automatisch generiert.
- **`KundenID`:** Die Spalte in der Kind-Tabelle (`Bestellung`), die als Fremdschlüssel fungiert.
- **`REFERENCES Kunde(KundenID)`:** Verweist auf die Spalte `KundenID` in der Eltern-Tabelle (`Kunde`).

---

### **Optionen für FOREIGN KEY Constraints**
Du kannst zusätzliche Optionen für die FOREIGN KEY Constraint festlegen, um das Verhalten bei Lösch- oder Aktualisierungsoperationen zu steuern:

#### 1. **ON DELETE**
- **`ON DELETE CASCADE`:** Wenn ein Datensatz in der Eltern-Tabelle gelöscht wird, werden alle zugehörigen Datensätze in der Kind-Tabelle ebenfalls gelöscht.
- **`ON DELETE SET NULL`:** Wenn ein Datensatz in der Eltern-Tabelle gelöscht wird, wird der Fremdschlüssel in der Kind-Tabelle auf `NULL` gesetzt.
- **`ON DELETE RESTRICT`:** Verhindert das Löschen eines Datensatzes in der Eltern-Tabelle, wenn es zugehörige Datensätze in der Kind-Tabelle gibt.

#### 2. **ON UPDATE**
- **`ON UPDATE CASCADE`:** Wenn der Primärschlüssel in der Eltern-Tabelle aktualisiert wird, wird der Fremdschlüssel in der Kind-Tabelle ebenfalls aktualisiert.
- **`ON UPDATE SET NULL`:** Wenn der Primärschlüssel in der Eltern-Tabelle aktualisiert wird, wird der Fremdschlüssel in der Kind-Tabelle auf `NULL` gesetzt.
- **`ON UPDATE RESTRICT`:** Verhindert die Aktualisierung des Primärschlüssels in der Eltern-Tabelle, wenn es zugehörige Datensätze in der Kind-Tabelle gibt.

---

### **Beispiel mit ON DELETE CASCADE und ON UPDATE CASCADE**
```sql
CREATE TABLE Bestellung (
    BestellID INT PRIMARY KEY,
    KundenID INT,
    Bestelldatum DATE,
    FOREIGN KEY (KundenID) 
        REFERENCES Kunde(KundenID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
```

- Wenn ein Kunde gelöscht wird (`DELETE`), werden alle seine Bestellungen ebenfalls gelöscht.
- Wenn die `KundenID` in der Tabelle `Kunde` aktualisiert wird (`UPDATE`), wird die `KundenID` in der Tabelle `Bestellung` automatisch aktualisiert.

---

### **Zusammenfassung**
- Eine **FOREIGN KEY Constraint** stellt sicher, dass die Daten in der Kind-Tabelle mit den Daten in der Eltern-Tabelle konsistent sind.
- Du kannst sie entweder beim Erstellen der Tabelle (`CREATE TABLE`) oder später mit `ALTER TABLE` hinzufügen.
- Optionen wie `ON DELETE` und `ON UPDATE` ermöglichen es, das Verhalten bei Lösch- oder Aktualisierungsoperationen zu steuern.

Ich hoffe, das hilft dir weiter! 😊

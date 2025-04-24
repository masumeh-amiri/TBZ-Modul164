# Constraint

In SQL wird eine **FOREIGN KEY Constraint** verwendet, um eine Beziehung zwischen zwei Tabellen herzustellen. Sie stellt sicher, dass der Wert in einer Spalte (oder mehreren Spalten) einer Tabelle (**Kind-Tabelle**) mit einem Wert in einer Spalte einer anderen Tabelle (**Eltern-Tabelle**) übereinstimmt. Dies wird oft verwendet, um die **Referenzielle Integrität** in der Datenbank zu gewährleisten.

Hier ist ein Beispiel, wie eine **FOREIGN KEY Constraint** in SQL erstellen wird:

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
Falls die Tabelle `Bestellung` bereits existiert und du den Fremdschlüssel später hinzufügen möchtest, kannst mann dies mit dem `ALTER TABLE`-Befehl tun:

```sql
ALTER TABLE Bestellung
ADD CONSTRAINT fk_kunde
FOREIGN KEY (KundenID) REFERENCES Kunde(KundenID);
```

- **`fk_kunde`:** Der Name der Constraint (optional). Wenn  keinen Namen angegeben wurde, wird einer automatisch generiert.
- **`KundenID`:** Die Spalte in der Kind-Tabelle (`Bestellung`), die als Fremdschlüssel fungiert.
- **`REFERENCES Kunde(KundenID)`:** Verweist auf die Spalte `KundenID` in der Eltern-Tabelle (`Kunde`).

---

### **Optionen für FOREIGN KEY Constraints**
Mann kann zusätzliche Optionen für die FOREIGN KEY Constraint festlegen, um das Verhalten bei Lösch- oder Aktualisierungsoperationen zu steuern:

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

### **Fazit**
- Eine **FOREIGN KEY Constraint** stellt sicher, dass die Daten in der Kind-Tabelle mit den Daten in der Eltern-Tabelle **konsistent** sind.
- Mann kann sie entweder beim Erstellen der Tabelle (`CREATE TABLE`) oder später mit `ALTER TABLE` hinzufügen.
- Optionen wie `ON DELETE` und `ON UPDATE` ermöglichen es, das Verhalten bei Lösch- oder Aktualisierungsoperationen zu steuern.
---
## Fragen zur Constraint Analyse:

### **1. Wie wird beim Fremdschlüssel der Constraint `NOT NULL` erstellt?**

Der `NOT NULL`-Constraint wird direkt in der Tabellendefinition bei der Spalte gesetzt, die als Fremdschlüssel verwendet wird.
 Dies geschieht
 z. B. so:

```sql
FK_Fahrer INT NOT NULL,
```

Damit wird sichergestellt, dass in dieser Spalte **keine NULL-Werte** erlaubt sind jede Zeile **muss** einen gültigen Verweis
 (eine ID) auf einen Datensatz
 in der referenzierten Tabelle enthalten.

---

### **2. Weshalb wird für jeden Fremdschlüssel ein Index erstellt?**

Ein **Index** wird automatisch für Fremdschlüssel erstellt, weil:
- **Datenbankabfragen schneller** durchgeführt werden können.
- **Integritätsprüfungen effizienter** erfolgen: Wenn ein Wert in der referenzierten Tabelle nicht existiert, wird dies durch den Index schneller erkannt.
- Ohne Index würde die Datenbank jedes Mal die komplette referenzierte Tabelle durchsuchen – was ineffizient wäre.

**Wichtig:** Der Index ist **technisch notwendig**, um die referenzielle Integrität beim Einfügen oder Löschen sicherzustellen.

---

### **3. Wie wird der Constraint `UNIQUE` für einen Fremdschlüssel im Workbench mit Forward Engineering erstellt?**

In MySQL Workbench:
- Auswahl die Spalte In der Tabellenstruktur, die der Fremdschlüssel sein soll.
- Die Option „**UNIQUE**“ aktivieren.
- Beim **Forward Engineering** wird dann im SQL-Skript folgender Code erzeugt:

```sql
FK_Fahrer INT UNIQUE,
```
---

### **4. Allgemeine Syntax für die `CONSTRAINT`-Anweisung**


```sql
CONSTRAINT constraint_name
FOREIGN KEY (Spaltenname)
REFERENCES Referenztabelle (Spalte)
[ON DELETE Aktion]
[ON UPDATE Aktion];
```

**Beispiel:**

```sql
CONSTRAINT fk_fahrer_id
FOREIGN KEY (FK_Fahrer)
REFERENCES Fahrer(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;
```


Hierarchien, Mehrfachbezeichnungen und Rekursion sind wichtige Konzepte in der Datenmodellierung und Datenbankentwicklung. Ich erkläre dir, was sie bedeuten und wie du sie in einem **physischen Datenmodell** und in **MySQL** umsetzen kannst.

---

### 1. **Einfache Hierarchie**
Eine **Hierarchie** beschreibt eine Beziehung, bei der eine Entität (z. B. eine Tabelle) in einer übergeordneten/untergeordneten Struktur organisiert ist. Ein klassisches Beispiel ist eine **Organisationsstruktur**, bei der ein Mitarbeiter einem Manager unterstellt ist.

#### Beispiel:
- **Tabelle:** `Mitarbeiter`
- Jeder Mitarbeiter hat einen Vorgesetzten (Manager), der selbst ein Mitarbeiter ist.

#### Physisches Datenmodell:
```sql
CREATE TABLE Mitarbeiter (
    MitarbeiterID INT PRIMARY KEY,
    Name VARCHAR(100),
    VorgesetzterID INT,  -- Fremdschlüssel, der auf die eigene Tabelle verweist
    FOREIGN KEY (VorgesetzterID) REFERENCES Mitarbeiter(MitarbeiterID)
);
```

#### Erklärung:
- **`VorgesetzterID`** ist ein Fremdschlüssel, der auf die `MitarbeiterID` in derselben Tabelle verweist.
- Der CEO hat keine `VorgesetzterID` (d. h. `NULL`), da er der oberste in der Hierarchie ist.

---

### 2. **Mehrfachbezeichnung**
Eine **Mehrfachbezeichnung** liegt vor, wenn eine Entität mehrere Rollen oder Beziehungen hat. Ein Beispiel ist eine **Person**, die sowohl **Kunde** als auch **Mitarbeiter** sein kann.

#### Beispiel:
- **Tabelle:** `Person`
- Eine Person kann sowohl Kunde als auch Mitarbeiter sein.

#### Physisches Datenmodell:
```sql
CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    Name VARCHAR(100),
    IstKunde BOOLEAN,  -- Gibt an, ob die Person ein Kunde ist
    IstMitarbeiter BOOLEAN  -- Gibt an, ob die Person ein Mitarbeiter ist
);
```

#### Erklärung:
- Die Spalten `IstKunde` und `IstMitarbeiter` sind **Flags**, die angeben, welche Rolle(n) die Person hat.
- Eine Person kann sowohl Kunde als auch Mitarbeiter sein (`IstKunde = TRUE` und `IstMitarbeiter = TRUE`).

---

### 3. **Rekursion**
**Rekursion** liegt vor, wenn eine Entität auf sich selbst verweist. Dies wird oft verwendet, um hierarchische oder baumartige Strukturen zu modellieren.

#### Beispiel:
- **Tabelle:** `Kategorie`
- Eine Kategorie kann Unterkategorien haben, die selbst wieder Kategorien sind.

#### Physisches Datenmodell:
```sql
CREATE TABLE Kategorie (
    KategorieID INT PRIMARY KEY,
    Name VARCHAR(100),
    ElternKategorieID INT,  -- Fremdschlüssel, der auf die eigene Tabelle verweist
    FOREIGN KEY (ElternKategorieID) REFERENCES Kategorie(KategorieID)
);
```

#### Erklärung:
- **`ElternKategorieID`** ist ein Fremdschlüssel, der auf die `KategorieID` in derselben Tabelle verweist.
- Eine Kategorie ohne `ElternKategorieID` ist eine **Wurzelkategorie** (oberste Ebene der Hierarchie).

---

### **Beispiel: Rekursive Abfrage in MySQL**
MySQL unterstützt rekursive Abfragen mit **Common Table Expressions (CTEs)** und dem Schlüsselwort **`WITH RECURSIVE`**. Damit kannst du hierarchische Daten abfragen.

#### Beispiel: Alle Unterkategorien einer Kategorie finden
```sql
WITH RECURSIVE Unterkategorien AS (
    -- Basisfall: Wähle die Startkategorie
    SELECT KategorieID, Name, ElternKategorieID
    FROM Kategorie
    WHERE KategorieID = 1  -- Startkategorie (z. B. ID 1)

    UNION ALL

    -- Rekursiver Fall: Finde alle Unterkategorien
    SELECT k.KategorieID, k.Name, k.ElternKategorieID
    FROM Kategorie k
    INNER JOIN Unterkategorien u ON k.ElternKategorieID = u.KategorieID
)
SELECT * FROM Unterkategorien;
```

#### Erklärung:
1. **Basisfall:** Wähle die Startkategorie (z. B. `KategorieID = 1`).
2. **Rekursiver Fall:** Verbinde die Tabelle `Kategorie` mit der temporären Tabelle `Unterkategorien`, um alle Unterkategorien zu finden.
3. **Ergebnis:** Die Abfrage gibt alle Unterkategorien der Startkategorie zurück.

---

### **Zusammenfassung**

| **Konzept**          | **Beschreibung**                                                                 | **Beispiel in MySQL**                                                                 |
|-----------------------|---------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| **Einfache Hierarchie** | Eine Entität hat eine übergeordnete/untergeordnete Beziehung.                   | `VorgesetzterID` in der `Mitarbeiter`-Tabelle.                                       |
| **Mehrfachbezeichnung** | Eine Entität kann mehrere Rollen oder Beziehungen haben.                        | `IstKunde` und `IstMitarbeiter` in der `Person`-Tabelle.                             |
| **Rekursion**         | Eine Entität verweist auf sich selbst, z. B. für hierarchische Strukturen.      | `ElternKategorieID` in der `Kategorie`-Tabelle. Rekursive Abfrage mit `WITH RECURSIVE`. |

---

### **Wann verwendet man diese Konzepte?**
- **Hierarchie:** Für Organisationsstrukturen, Kategoriensysteme oder Baumstrukturen.
- **Mehrfachbezeichnung:** Wenn eine Entität mehrere Rollen oder Beziehungen haben kann.
- **Rekursion:** Für komplexe hierarchische oder verschachtelte Strukturen.

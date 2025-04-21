Aufgabe 1


| **Datentyp**                                        | **MariaDB (MySQL)**           | **Beispiel**                 | **Bemerkung / Einstellungen**                                  |
|-----------------------------------------------------|-------------------------------|------------------------------|----------------------------------------------------------------|
| Ganze Zahlen                                        | INT, TINYINT, SMALLINT        | INT: 42                      | signed/unsigned möglich                                       |
| Natürliche Zahlen                                   | INT UNSIGNED                  | 42                           | Nur positive Zahlen                                            |
| Festkommazahlen (Dezimalzahlen)                     | Decimal(M[,D])                | Decimal(6,2) 1234.56         | M = Gesamte Anzahl Stellen, D = Nachkommastellen              |
| Aufzählungstypen                                    | ENUM('Wert1', 'Wert2', ...)   | ENUM('rot','grün','blau')   | Nur vordefinierte Werte erlaubt                               |
| Boolean (logische Werte)                            | BOOLEAN, BOOL, TINYINT(1)     | TRUE / FALSE                 | BOOL ist Alias für TINYINT(1)                                 |
| Zeichen (einzelnes Zeichen)                         | CHAR(1)                       | 'A'                          | Feste Länge, hier: 1 Zeichen                                  |
| Gleitkommazahlen                                    | FLOAT, DOUBLE                 | FLOAT: 3.14                  | FLOAT ≈ 7 Stellen, DOUBLE ≈ 15 Stellen Genauigkeit             |
| Zeichenkette fester Länge                           | CHAR(n)                       | CHAR(10)                     | Mit Leerzeichen aufgefüllt                                    |
| Zeichenkette variabler Länge                        | VARCHAR(n)                    | VARCHAR(255)                 | Maximale Länge in n                                           |
| Datum und/oder Zeit                                 | DATE, TIME, DATETIME          | '2023-01-01', '12:30:00'     | Für Datum & Zeitwerte                                         |
| Zeitstempel                                         | TIMESTAMP                     | CURRENT_TIMESTAMP            | Speichert aktuelle Zeit automatisch                          |
| Binäre Datenobjekte variabler Länge (z.B. Bild)     | BLOB                          | BLOB                         | Für Binärdaten (z.B. Bilder, Dateien)                         |
| Verbund                                             | SET('Wert1', 'Wert2', ...)    | SET('a','b','c')             | Kombination aus mehreren vordefinierten Werten erlaubt        |
| JSON                                                | JSON                          | '{ "name": "Max" }'         | Ab MariaDB 10.2.7, intern als LONGTEXT gespeichert             |

---
## Auftrag insert 

### **a. Heinrich Schmitt aus Zürich, Schweiz (Kurzform)**

```
INSERT INTO kunden VALUES (NULL, 'Heinrich', 'Schmitt', 2, 'Zürich');
```

---

### **b. Sabine Müller aus Bern, Schweiz (Kurzform)**

```
INSERT INTO kunden VALUES (NULL, 'Sabine', 'Müller', 2, 'Bern');
```

---

### **c. Markus Mustermann aus Wien, Österreich (Kurzform)**

```
INSERT INTO kunden VALUES (NULL, 'Markus', 'Mustermann', 1, 'Wien');
```

---

### **d. Herr Maier (Langform – nur Nachname bekannt)**

```
INSERT INTO kunden (nachname) VALUES ('Maier');
```

---

### **e. Herr Bulgur aus Sirnach (Langform – Nachname und Wohnort)**

```
INSERT INTO kunden (nachname, wohnort) VALUES ('Bulgur', 'Sirnach');
```

---

### **f. Maria Manta (Langform – Vorname und Nachname)**

```
INSERT INTO kunden (vorname, nachname) VALUES ('Maria', 'Manta');
```
---
2-


### **a. Fehler: Fehlender Tabellenname**

```
-- Fehlerhaft:
INSERT INTO (nachname, wohnort, land_id) VALUES ('Fesenkampp', 'Duis-burg', 3);
-- Korrekt:
INSERT INTO kunden (nachname, wohnort, land_id) VALUES ('Fesenkampp', 'Duis-burg', 3);
```

---

### **b. Fehler: Spaltenname in einfachen Hochkommas (' ') statt ohne oder mit `Backticks`**

```
-- Fehlerhaft:
INSERT INTO kunden ('vorname') VALUES ('Herbert');
-- Korrekt:
INSERT INTO kunden (vorname) VALUES ('Herbert');
```

---

### **c. Fehler: 'Deutschland' als String statt einer passenden `land_id` (z. B. 3)**

```
-- Fehlerhaft:
INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES ('Schulter', 'Albert', 'Duisburg', 'Deutschland');
-- Korrekt (angenommen land_id für Deutschland ist 3):
INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES ('Schulter', 'Albert', 'Duisburg', 3);
```

---

### **d. Fehler: Kein Tabellenname, leeres Feld, falsche Anzahl Spalten**

```
-- Fehlerhaft:
INSERT INTO kunden ('', 'Brunhild', 'Sulcher', 1, 'Süderstade');
-- Korrekt:
INSERT INTO kunden (vorname, nachname, land_id, wohnort) VALUES ('Brunhild', 'Sulcher', 1, 'Süderstade');
```

---

### **e. Fehler: Keine Angabe der Spalten, falsche Reihenfolge der Werte**

```
-- Fehlerhaft:
INSERT INTO kunden VALUES ('Jochen', 'Schmied', 2, 'Solingen');
-- Korrekt (AUTO_INCREMENT beachten!):
INSERT INTO kunden (vorname, nachname, land_id, wohnort) VALUES ('Jochen', 'Schmied', 2, 'Solingen');
```

---

### **f. Fehler: Leerer Primärschlüssel ('') – besser: NULL oder Kurzform**

```
-- Fehlerhaft:
INSERT INTO kunden VALUES ('', 'Doppelbrecher', 2, '');
-- Korrekt:
INSERT INTO kunden (nachname, land_id) VALUES ('Doppelbrecher', 2);
```

---

### **g. Fehler: Zu viele Werte für zu wenig Spalten**

```
-- Fehlerhaft:
INSERT INTO kunden (nachname, wohnort, land_id) VALUES ('Christoph', 'Fesenkampp', 'Duisburg', 3);
-- Korrekt:
INSERT INTO kunden (nachname, wohnort, land_id) VALUES ('Christoph', 'Fesenkampp', 3);
```

---

### **h. Dieser Befehl ist korrekt! 🎉**

```
-- Korrekt:
INSERT INTO kunden (vorname) VALUES ('Herbert');
```

---

### **i. Fehler: Fehlende Anführungszeichen um Werte**

```
-- Fehlerhaft:
INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES (Schulter, Albert, Duisburg, 1);
-- Korrekt:
INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES ('Schulter', 'Albert', 'Duisburg', 1);
```

---

### **j. Fehler: `VALUE` statt `VALUES`, keine Spalten angegeben, leeres Feld**

```
-- Fehlerhaft:
INSERT INTO kunden VALUE ('', "Brunhild", "Sulcher", 1, "Süderstade");
-- Korrekt:
INSERT INTO kunden (vorname, nachname, land_id, wohnort) VALUES ('Brunhild', 'Sulcher', 1, 'Süderstade');
```

---

### **k. Fehler: `VALUE` statt `VALUES`, kein AUTO_INCREMENT-Wert nötig, unquotierter String**

```
-- Fehlerhaft:
INSERT INTO kunden VALUE ('', 'Jochen', 'Schmied', 2, Solingen);
-- Korrekt:
INSERT INTO kunden (vorname, nachname, land_id, wohnort) VALUES ('Jochen', 'Schmied', 2, 'Solingen');
```
## Auftrag DROP, ALTER, Update
```
--  Regisseurname „Cohen“ vervollständigen zu „Etan Cohen“

UPDATE dvd_sammlung
SET regisseur = 'Etan Cohen'
WHERE regisseur = 'Cohen';
```
```
-- Filmlänge von „Angst“ korrigieren auf 120 Minuten
UPDATE dvd_sammlung
SET laenge_minuten = 120
WHERE film = 'Angst';
```
```
-- Tabelle umbenennen in „bluray_sammlung“
RENAME TABLE dvd_sammlung TO bluray_sammlung;
```
```
--  Spalte „Preis“ hinzufügen
ALTER TABLE bluray_sammlung
ADD COLUMN preis DECIMAL(5,2);
```
```
--  Film „Angriff auf Rom“ entfernen
DELETE FROM bluray_sammlung
WHERE film = 'Angriff auf Rom';
```
```

-- Spalte „film“ umbenennen in „kinofilme“
ALTER TABLE bluray_sammlung
CHANGE COLUMN film kinofilme VARCHAR(255) NOT NULL;
```
```
-- 12. Spalte „nummer“ löschen
ALTER TABLE bluray_sammlung
DROP COLUMN nummer;
```
```
-- 13. Tabelle komplett löschen, da Firma geschlossen wurde
DROP TABLE bluray_sammlung;
```


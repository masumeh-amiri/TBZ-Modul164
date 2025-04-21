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
Aufgabe2:


### **a. Heinrich Schmitt aus Zürich, Schweiz (Kurzform)**

```sql
INSERT INTO kunden VALUES (NULL, 'Heinrich', 'Schmitt', 2, 'Zürich');
```

---

### **b. Sabine Müller aus Bern, Schweiz (Kurzform)**

```sql
INSERT INTO kunden VALUES (NULL, 'Sabine', 'Müller', 2, 'Bern');
```

---

### **c. Markus Mustermann aus Wien, Österreich (Kurzform)**

```sql
INSERT INTO kunden VALUES (NULL, 'Markus', 'Mustermann', 1, 'Wien');
```

---

### **d. Herr Maier (Langform – nur Nachname bekannt)**

```sql
INSERT INTO kunden (nachname) VALUES ('Maier');
```

---

### **e. Herr Bulgur aus Sirnach (Langform – Nachname und Wohnort)**

```sql
INSERT INTO kunden (nachname, wohnort) VALUES ('Bulgur', 'Sirnach');
```

---

### **f. Maria Manta (Langform – Vorname und Nachname)**

```sql
INSERT INTO kunden (vorname, nachname) VALUES ('Maria', 'Manta');
```

---

Wenn du magst, kann ich dir auch ein SQL-Skript für alles auf einmal generieren oder das Ganze in eine `.sql`-Datei packen. Sag einfach Bescheid!

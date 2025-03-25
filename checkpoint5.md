1. Satz zur Erklärung von Subqueries
Subqueries sind Abfragen, die innerhalb einer anderen SQL-Abfrage ausgeführt werden. Sie helfen, komplexe Probleme zu lösen, indem sie Zwischenergebnisse berechnen, die dann in der Hauptabfrage genutzt werden können.

2. Unterschied zwischen skalaren und nicht-skalaren Subqueries
Skalare Subqueries liefern genau einen Wert zurück (z. B. die höchste Verkaufszahl eines Buches).

Nicht-skalare Subqueries liefern mehrere Werte oder Zeilen zurück (z. B. alle Bücher eines bestimmten Verlags).

3. Gefahren bei der Verwendung von Subqueries
Leistungsprobleme: Subqueries können langsam sein, wenn sie viele Daten verarbeiten müssen.

Fehlermeldungen: Wenn eine Subquery mehr Werte zurückgibt als erwartet (z. B. in einer =-Vergleichsbedingung), führt das zu einem Fehler.

Komplexität: Mehrere verschachtelte Subqueries machen SQL-Abfragen schwer verständlich und wartbar.

4. Bedeutung von IGNORE 1 LINES in LOAD DATA INFILE
Dieser Befehl sorgt dafür, dass die erste Zeile der CSV-Datei ignoriert wird. Das ist nützlich, wenn die erste Zeile Spaltennamen enthält und nicht als Daten importiert werden soll.

5. Problem bei Windows-CSV und LINES TERMINATED BY '/n'
Windows benutzt \r\n als Zeilenumbruch, während /n nur für Unix/Linux gilt. Dadurch kann es passieren, dass das letzte Attribut (Spalte) jeder Zeile einen zusätzlichen \r-Zeichen enthält, was zu unerwarteten Zeichen oder Fehlern in der Datenbank führt.

6. Einstellungen für den CSV-Import durch einen Client
Der MySQL-Server muss die LOCAL-Option für LOAD DATA INFILE erlauben.

Die Datei muss sich im richtigen Verzeichnis befinden oder der Client muss die Berechtigung haben, sie hochzuladen.

Die richtige Kodierung (CHARACTER SET) und Trennzeichen (FIELDS TERMINATED BY) müssen beachtet werden.

7. Import von Spalten in anderer Reihenfolge
Beim Import kann man angeben, in welche Spalten die Daten geschrieben werden sollen, unabhängig von der Reihenfolge in der CSV-Datei:

```
LOAD DATA INFILE 'datei.csv' 
INTO TABLE tabelle 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
(col2, col1, col3);
```

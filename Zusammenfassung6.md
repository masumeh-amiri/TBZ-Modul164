
### Subselects in MySQL  

Ein **Subselect** (Unterabfrage) ist eine SQL-Abfrage, die innerhalb einer anderen Abfrage eingebettet ist. Es wird genutzt, um Daten aus einer Tabelle basierend auf Bedingungen abzurufen, die durch eine andere Abfrage bestimmt werden. Subselects können an verschiedenen Stellen in einer SQL-Abfrage vorkommen, beispielsweise in den **WHERE**, **FROM**, **HAVING** oder **SELECT**-Klauseln. Zudem lassen sich Subselects in **UPDATE**, **DELETE** oder **INSERT**-Anweisungen verwenden.  

### **Skalare und Nicht-Skalare Unterabfragen**  

- **Skalare Unterabfrage**  
  Eine skalare Unterabfrage gibt genau eine Spalte mit einer einzigen Zeile zurück. Operatoren wie `=`, `>`, `<`, `>=` oder `<=` können nur mit skalaren Subselects genutzt werden.  

- **Nicht-Skalare Unterabfrage**  
  Eine nicht-skalare Unterabfrage gibt mehrere Werte oder Zeilen zurück. Sie wird oft mit Operatoren wie **IN** oder **NOT IN** verwendet, um eine Hauptabfrage auf mehrere Werte zu überprüfen.  

### **Subselects in Kombination mit JOINs**  

Subselects können auch innerhalb von **JOIN-Abfragen** genutzt werden, um Daten aus mehreren Tabellen zusammenzuführen und spezifische Filter anzuwenden. Ein typisches Beispiel ist das Ermitteln des letzten Bestelldatums eines Kunden, wobei Subselects genutzt werden, um das Maximum aus einer Spalte zu bestimmen.  

Ein wichtiger Punkt bei solchen Abfragen ist, dass durch das Subselect nicht nur die letzten Daten einzelner Kunden ausgegeben werden, sondern auch andere Einträge mit demselben Datum. Dies kann dazu führen, dass Ergebnisse entstehen, die nicht direkt zusammenhängen.  

### **Operatoren für Subselects**  

Subselects können mit verschiedenen Operatoren kombiniert werden, darunter:  
- **IN**: Prüft, ob ein Wert in einer Liste enthalten ist.  
- **EXISTS**: Überprüft, ob eine Unterabfrage mindestens eine Zeile zurückliefert.  
- **NOT EXISTS**: Prüft, ob eine Unterabfrage keine Ergebnisse liefert.  
- **ALL**: Vergleicht mit allen Werten einer Unterabfrage.  
- **ANY**: Vergleicht mit mindestens einem Wert einer Unterabfrage.  

### **CSV-Datei vom Client in MySQL laden**  

Das **Laden von CSV-Dateien** in eine MySQL-Datenbank kann über den Befehl `LOAD DATA LOCAL INFILE` erfolgen. Dabei wird eine Datei aus dem lokalen Dateisystem des Clients in die Datenbank importiert.  

### **Wichtige Servereinstellungen für den Import**  

- Die Einstellung `local_infile` muss aktiviert sein, um das Laden lokaler Dateien zu erlauben.  
- Der Wert von `secure_file_priv` sollte keinen spezifischen Pfad enthalten, damit keine Einschränkungen beim Dateiimport bestehen.  

Diese Einstellungen dienen dazu, den sicheren Import von Dateien zu gewährleisten und unautorisierten Zugriff auf das Dateisystem zu verhindern.

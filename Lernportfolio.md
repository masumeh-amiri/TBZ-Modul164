### 18.02.2025
in die lektion haben wir eine rcap von modul 162 gemacht über normalisierung, Konzeptionelles Datenmodell (ERM)
Logisches Datenmodell (ERD)
Physisches Datenmodell in SQL 
den Tourplaner Aufgabe aus Papier in den

[recap](recap.md)  
### 25.2.2025

in  diesem lektion habe ich meine ERD Entwurf mit der Lösung vergleichen, 
und zusammenfassung  für die Theorien erstellt. Set für die MySQL workbench. installieren von , XAMP sowie erstellen die Tabelle in  workbecnch un mit der option forward inginiering in sql query umwandel versucht jedoch war ich nicht erfolgreich 

### zusammenfassung des identifying und non identifying Beziehung 

[identifying -nonIdetifying-Beziehung]((non)identifying-Relation.md)

### Zusammenfassung des Generalisierung und Spezialiesierung

[Generalisierung-Spezializierung](Genralisierug&spezialisierung.md)

### Zusammenfassung des Database Mangment System 

[DBMS](DBMS.md)



### 4.3.2025

### 11.3.2025
wir haben LB1 Prüfung abgelegt . Leider habe ich meine alle miene SQL befehle und ERstellte ERD modell verloren und war nicht fähig es wieder grwinnen.
Theorie zum        gelesen.


[Auftrag4](Auftrag_4.Tag.md)


[Checkpoint_Fragen](4.Tag_Checkpoint.md)

[JOIN Tabelle](join.md)
### 18.3.2025 
Resultat von LB1 züruckbekommen. Theorie zum Datenintegrität, DQL, DCL FK-Constraint-Option Regeln  und durch Merksatz (Warum Geht Herbert Oft Laufen?)
die Reihenfoge von Befehle   WHERE, GROUP BY, HAVING, ORDER BY, LIMIT muss in MySQL  gelernt .

### Alias Aufgabe
[Alias Aufgabe](alias_Auftrag.md)

---
### 25.3.2025
Heute  wurde das Thema subqueroes behandelt.
 es würde empfohlen dass via diesieis Befehl in der Console arbeiten :
#### Zusammenfassung diese Lektion:

**Subselects in MySQL**  

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



```
mysql -u root - password < pfad / [filename]
```
Aufgaben zum sqbquery gelost 
##### Checkpoint 
[Checkpoint](checkpoint5.md)

**Subqueries Aufgaben:**

[Subselect Aufgaben](subselect.md)

**Aufgaben zum Toturial zum bulk import:**

[Aufgaben_bulkimport ](toturial5.md)
[](.md)

---
### 1.4.2025

## Backup von Datenbank , Daten normalisiert einblenden, normaliserter  Import 

### **1. Bedeutung von Datenbanksystemen**
- **Webhosting und Unternehmenssoftware**: Datenbanken sind essenziell für die Funktionalität von Websites und die IT-Infrastruktur von Unternehmen.
- **Datenverfügbarkeit**: Die Verfügbarkeit und Vollständigkeit der gespeicherten Daten beeinflusst die Aktionsfähigkeit des Unternehmens und das korrekte Anzeigen von Websites.
- **Datenaustausch**: Datenbanken speichern und liefern Informationen, z. B. Personal-, Finanz- oder Kundendaten.
- **Folgen eines Ausfalls**: Ein Datenbank-Ausfall oder -Verlust kann zu fehlenden Inhalten, nicht funktionierenden Anwendungen und Vertrauensverlust bei Kunden führen.

### **2. Ursachen für Datenverlust**
- **Häufige Ursachen**: Technisches Versagen der Hardware oder Benutzerfehler (häufiger als externe Angriffe).
- **Notwendigkeit der Datensicherung**: Um irreversible Datenverluste zu vermeiden, ist eine regelmäßige Datensicherung unerlässlich.


### **3. Möglichkeiten zur Sicherung von Datenbanken**
#### **Unterscheidung zwischen Online- und Offline-Backups**:
- **Online-Backup**:
  - Wird erstellt, ohne die Datenbank herunterzufahren.
  - Änderungen werden während der Sicherung in einem separaten Bereich aufgenommen und später eingefügt.
- **Offline-Backup**:
  - Datenbank wird für die Sicherung heruntergefahren.
  - Einfach durchzuführen, aber mit einer temporären Nichtverfügbarkeit der Anwendungen/Website verbunden.
  - Sollte idealerweise nachts oder bei geringem Datenverkehr erfolgen.


### **4. Arten der Datensicherung**
1. **Voll-Backup**:
   - Alle Daten und Strukturen werden kopiert.
   - Vorteil: Vollständige Wiederherstellung mit nur einem Backup möglich.
   - Nachteil: Hoher Speicherplatzbedarf bei häufigen Sicherungen.

2. **Differentielles Backup**:
   - Basierend auf einem initialen Voll-Backup.
   - Speichert nur geänderte oder neue Dateien seit dem letzten Voll-Backup.
   - Vorteil: Geringerer Speicherplatzbedarf im Vergleich zum Voll-Backup.
   - Nachteil: Geänderte und neue Dateien werden bei jedem differentiellen Backup erneut kopiert.

3. **Inkrementelles Backup**:
   - Basierend auf einem initialen Voll-Backup.
   - Kopiert nur Dateien, die sich seit der letzten Sicherung (Voll- oder inkrementell) geändert haben.
   - Vorteil: Sehr geringer Speicherplatzbedarf, da jede Datei nur einmal gesichert wird.
   - Nachteil: Für die Wiederherstellung werden alle Backups vom Voll-Backup bis zum gewünschten Stand benötigt.





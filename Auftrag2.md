
### 1. **Partition (in Datenbanken)**

**Partitionierung** bedeutet, grosse Tabellen in kleinere Teile zu unterteilen. Jede Partition enthält einen Teil der Daten. So wird es schneller, nach Daten zu suchen, weil die Datenbank nur einen Teil durchsuchen muss.

**Beispiel:** Eine Tabelle mit allen Bestellungen wird in Partitionen aufgeteilt, z.B. eine für jedes Jahr.

### 2. **Was macht eine Storage Engine in einer Datenbank?**

Eine **Storage Engine** ist dafür verantwortlich, wie die Daten gespeichert und abgerufen werden. Sie kümmert sich um das Speichern, Sichern und Abrufen von Daten aus der Festplatte.

**Beispiel:** In MySQL gibt es verschiedene Storage Engines wie **InnoDB**, die Transaktionen unterstützt, und **MyISAM**, die schneller ist, aber keine Transaktionen hat.

### 3. **Was ist ein Tablespace (InnoDB)?**

Ein **Tablespace** ist der Speicherplatz, in dem eine Tabelle und ihre Daten gespeichert werden. Es ist wie eine Datei auf der Festplatte, die alle Daten einer Tabelle enthält.

**Beispiel:** InnoDB speichert Tabellen entweder in einer grossen Datei oder in mehreren kleineren Dateien, je nachdem, wie es eingestellt ist.

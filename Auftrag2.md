Hier sind einfache Erklärungen zu den Begriffen:

### 1. **Partition (bezgl. Datenbanken)**

**Partitionierung** ist eine Technik, bei der eine grosse Tabelle in mehrere kleinere, überschaubare Teile (Partitionen) aufgeteilt wird. Diese Partitionen können basierend auf bestimmten Kriterien wie **Datenbereich**, **Wertbereich** oder **Hash-Werte** erstellt werden.

**Beispiel:** 
Stell dir eine Tabelle vor, die Daten für verschiedene Jahre enthält. Du könntest die Tabelle in Partitionen aufteilen, eine für jedes Jahr (z.B. 2020, 2021, 2022). Dadurch werden Abfragen schneller, da die Datenbank nur die Partition durchsuchen muss, die relevant ist.

### 2. **Was macht eine Storage Engine in einer Datenbank?**

Eine **Storage Engine** in einer Datenbank ist der Teil, der die tatsächliche Speicherung und Verwaltung von Daten übernimmt. Sie bestimmt, wie Daten gespeichert, abgerufen und verändert werden.

**Beispiel:**
In MySQL gibt es verschiedene Storage Engines, wie **InnoDB** und **MyISAM**. InnoDB beispielsweise unterstützt Transaktionen, Datensicherheit und Referentielle Integrität, während MyISAM schneller ist, aber keine Transaktionen unterstützt.

### 3. **Was ist ein Tablespace (InnoDB)?**

Ein **Tablespace** in InnoDB ist der Speicherbereich, der alle Daten und Indexe einer Tabelle speichert. Es handelt sich also um eine logische Sammlung von Daten in einer Datei oder mehreren Dateien auf der Festplatte.

InnoDB verwendet normalerweise einen **gemeinsamen Tablespace** (eine Datei, in der alle Tabellen gespeichert werden) oder kann für jede Tabelle einen eigenen **Tablespace** verwenden.

**Tablespace Architektur:**
- **System Tablespace:** Der Standard-Tablespace, in dem alle InnoDB-Tabellen und -Indizes gespeichert werden.
- **Datei-Tablespaces:** Jede Tabelle kann einen eigenen Tablespace haben, der in einer separaten Datei gespeichert ist.
- **Temporary Tablespace:** Für temporäre Datenbanken, die für Berechnungen oder temporäre Tabellen verwendet werden.

**Zusammenfassung:** Ein Tablespace ist der logische Bereich für die Speicherung von Daten, und InnoDB kann verschiedene Ansätze zur Verwaltung dieser Daten verwenden.

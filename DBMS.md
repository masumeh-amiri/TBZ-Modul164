## DBMS (Datenbank Management System) Eigenschaft

### Benutzeransichten:
Für verschiedene Benutzergruppen gibt es unterschiedliche Ansichten (Views). Diese zeigen nur bestimmte Teile der Daten oder stellen sie so dar, wie sie für die jeweilige Anwendung benötigt werden. Diese Ansichten werden in der Datenbank festgelegt.

### Konsistenzkontrolle:
Die Konsistenzkontrolle sorgt dafür, dass die Daten in der Datenbank korrekt sind und Änderungen richtig durchgeführt werden. Es gibt Regeln (Constraints), die festlegen, wie die Daten aussehen sollen. Das System überprüft diese Regeln während des Betriebs. Ausserdem wird sichergestellt, dass die Speicherstrukturen und Inhalte der Datenbank intakt sind.

### Datenzugriffskontrolle:
Es gibt Regeln, die verhindern, dass Unbefugte auf die Daten in der Datenbank zugreifen können. Das ist besonders wichtig bei personenbezogenen Daten oder firmeninternen Informationen. Auch für die Benutzeransichten können Zugriffsrechte festgelegt werden.

### Transaktionen:
Mehrere Änderungen in der Datenbank können zu einer Transaktion zusammengefasst werden. Diese wird als eine Einheit ausgeführt und entweder ganz oder gar nicht gespeichert. Wenn die Transaktion erfolgreich ist, werden die Änderungen dauerhaft in der Datenbank gespeichert.

### Mehrbenutzerfähigkeit:
Wenn mehrere Benutzer gleichzeitig auf die Datenbank zugreifen, müssen ihre Aktionen synchronisiert werden, um Konflikte zu vermeiden. Für den Benutzer sieht es so aus, als ob nur er allein auf die Daten zugreift.

### Datensicherung:
Das Datenbankmanagementsystem (DBMS) muss in der Lage sein, bei Fehlern (z. B. Hardware- oder Softwareproblemen) die Datenbank wieder in einen korrekten Zustand zu bringen.

### Vorteile von Datenbanksystemen:

**Standards:** Eine Datenbank hilft, zentrale Standards für die Datenorganisation einzuführen, z. B. bei Namen, Formaten oder Fachbegriffen.

**Effizienter Datenzugriff:** Ein DBMS kann grosse Datenmengen effizient speichern und wieder abrufen.

**Schnellere Softwareentwicklung:** Ein DBMS bietet viele Funktionen, die die Entwicklung von Anwendungen beschleunigen, da der Programmierer sich nicht um Routineaufgaben kümmern muss.

**Flexibilität:** Die Struktur der Datenbank kann angepasst werden, ohne dass bestehende Daten oder Anwendungen stark beeinträchtigt werden.

**Hohe Verfügbarkeit:** Ein DBMS ermöglicht es, dass viele Benutzer gleichzeitig auf die Datenbank zugreifen können, z. B. bei Reservierungssystemen oder Online-Banking.

**Wirtschaftlichkeit:** Durch die Zentralisierung der Daten können Unternehmen in leistungsstärkere Hardware investieren, was die Betriebskosten senkt.

### Nachteile von Datenbanksystemen:

**Hohe Anfangskosten:** Die Anschaffung von Hardware und Datenbanksoftware ist teuer.

**Allzweck-Software:** Ein DBMS ist nicht so effizient wie spezialisierte Software für bestimmte Anwendungen.

**Optimierung:** Bei vielen Anforderungen kann das System nicht für alle Anwendungen optimal sein.

**Zusätzliche Kosten:** Es entstehen Mehrkosten für Sicherheit, Synchronisation und Konsistenzkontrolle.

**Qualifiziertes Personal:** Es werden Experten wie Datenbankdesigner und Administratoren benötigt.

**Zentralisierung:** Die Daten sind an einem Ort gespeichert, was sie anfälliger für Ausfälle macht (Lösung: Verteilung der Daten).

Wann reguläre Dateien sinnvoll sind:

Wenn nicht mehrere Benutzer gleichzeitig auf die Daten zugreifen müssen.

Wenn die Anwendung feste Echtzeitanforderungen hat, die ein DBMS nicht erfüllen kann.

Wenn die Daten und Anwendungen einfach und stabil sind und sich nicht ändern werden.

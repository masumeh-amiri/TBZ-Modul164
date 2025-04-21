
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

### **Backup-Methoden für Datenbanken**  
1. **MySQLDump**  
   - Integrierte Backup-Funktion von MySQL via Shell-Befehl `mysqldump`.  
   - Schnellste Methode, aber nicht von allen Hostern unterstützt .  

2. **phpMyAdmin**  
   - Ermöglicht Export von Datenbanken (z. B. im SQL-Format).  
   - Einschränkungen: Serverabbrüche bei grossen Datenbanken, Wiederherstellung nur bis 2 MB möglich .  

3. **BigDump**  
   - Ergänzt phpMyAdmin, unterstützt grosse Backups.  
   - Keine eigene Sicherungsfunktion .  

4. **HeidiSQL**  
   - Windows-Tool ohne PHP-Abhängigkeit, daher für grosse Backups geeignet.  
   - Keine Automatisierung des Backup-Prozesses .  

5. **Mariabackup**  
   - Open-Source-Tool von MariaDB für physische Online-Backups (InnoDB, Aria, MyISAM).  
   - Verfügbar für Linux und Windows .  

---

### **Bedeutung der Datenbanksicherung**  
1. **Kritische Rolle von Datenbanken**  
   - Speichern sensible Daten (Adressen, Kontoinformationen) und gewährleisten Funktion von Websites und Anwendungen .  

2. **Risiken**  
   - Externe Bedrohungen (Angriffe) und interne Probleme (Hardware-Defekte, Benutzerfehler).  

3. **Ziele von Backups**  
   - Verhindern von Datenverlust und langfristige Datensicherheit durch regelmässige Sicherungen .  

4. **Empfehlungen**  
   - Regelmässige Backups als Prävention, sichere Speicherorte und Test der Wiederherstellung .  

---  
![arten von Backup](/subquery_pic/backup.png)

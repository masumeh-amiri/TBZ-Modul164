
### Weshalb können in professionellen Datenbanken nicht einfach so Daten gelöscht werden? 
In professionellen Datenbanken dürfen Daten nicht einfach gelöscht werden, weil sie oft wichtige Informationen enthalten. Wenn Daten entfernt werden, könnten Zusammenhänge und Verläufe verloren gehen. Zum Beispiel:  
- In Unternehmen müssen Mitarbeiterdaten erhalten bleiben, um ihre vergangenen Arbeiten nachverfolgen zu können.  
- In Banken müssen Transaktionen gespeichert bleiben, um Betrug zu verhindern.  
- In Kassensystemen könnte das einfache Löschen von Einkäufen zu Missbrauch führen.  
Statt Daten zu löschen, werden sie oft als „inaktiv“ markiert oder durch Stornierungen korrigiert.  

### Wer stellt die referentielle Integrität sicher? 
Die referentielle Integrität wird vom **Datenbankmanagementsystem (DBMS)** sichergestellt. Es überprüft, dass die Beziehungen zwischen Tabellen korrekt bleiben. Dazu gibt es Fremdschlüssel-Beschränkungen (FK-Constraints), die verhindern, dass Daten gelöscht oder geändert werden, wenn sie noch mit anderen Daten verknüpft sind.

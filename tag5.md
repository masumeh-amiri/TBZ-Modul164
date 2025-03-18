zusammenfassung Daten löschen

**Löschen in Datenbanken:**  
Beim Löschen von Daten in einer Datenbank gibt es verschiedene Möglichkeiten. Man kann einzelne Datensätze mit `DELETE` entfernen oder eine ganze Tabelle mit `DROP TABLE` löschen. Mit `TRUNCATE` kann man alle Daten einer Tabelle schnell löschen, ohne die Tabelle selbst zu entfernen. Wichtig ist, dass beim Löschen von Daten die Beziehungen zu anderen Tabellen beachtet werden, damit keine Fehler entstehen.  

**Datenintegrität:**  
Datenintegrität bedeutet, dass die Daten in einer Datenbank richtig, vollständig und zuverlässig sind. Dafür gibt es Regeln, zum Beispiel dass jede Tabelle eine eindeutige ID (Primärschlüssel) haben sollte und dass verknüpfte Daten korrekt bleiben. Datenintegrität wird durch Regeln wie `NOT NULL`, `UNIQUE` oder Fremdschlüssel-Constraints sichergestellt.  

**Fremdschlüssel-Constraint-Optionen:**  
Ein Fremdschlüssel (Foreign Key) stellt eine Verbindung zwischen zwei Tabellen her. Es gibt verschiedene Regeln, was passieren soll, wenn ein verknüpfter Datensatz gelöscht oder geändert wird:  
- `CASCADE`: Die verknüpften Daten werden automatisch mitgelöscht oder geändert.  
- `SET NULL`: Die Fremdschlüssel-Werte werden auf `NULL` gesetzt.  
- `SET DEFAULT`: Die Fremdschlüssel-Werte bekommen einen Standardwert.  
- `RESTRICT`: Das Löschen oder Ändern wird verhindert, wenn es noch Verknüpfungen gibt.  
- `NO ACTION`: Ähnlich wie `RESTRICT`, aber die Prüfung passiert erst nach der Transaktion.  

Diese Optionen helfen, die Datenkonsistenz in der Datenbank zu erhalten.

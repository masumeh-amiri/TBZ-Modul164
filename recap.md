#### 1.NormalForm(2.NF)
Einer Relation befindet sich in der ersten NormalForm, wenn iihre Attribute nur einfache Attributswerte aufweisen.
- Wenn Daten mehrmals eingetragen sind , spricht man vonn Redundanz.

#### 2.NormalForm(2.NF)
Eine Relation befindet sich in der zweiten Normalform , wenn sie in der ersten Normalform ist und jedes niciht zum Identifikationsschlüssel gehörige Attribute voll von diesem abhängig ist.
#### 3.NormalForm(3.NF)
Eine Relation befindet sich in der dritten Normalform, wenn sie in der zweiten Normalform ist und kein Attribut , das nicht zum Identifikationsschlüssel gehört. transitiv(indirekt) von diesem abhängt.
 #### ERM/ERD

Zur grafischen Darstellung von Objekten und deren Beziehungen einer Datenbank ist das Entitäten - Relationen - Modell (ERM) bzw. das Entitäten - Relationen - Diagramm (ERD) weit verbreitet

Bei der Arbeit mit ERDs werden ausschliesslich folgende Fachbegriffe verwendet:

-  Entität:

In einer Datenbank werden so genannte Objekte (Gegens-tände, Personen, Artikel, Bücher, etc.) und deren Eigenschaf-ten gespeichert. Wenn wir über ein einzelnes Objekt spre-chen, reden wir von einer Entität.

- Entitätsmenge:

Die Menge aller Objekte, die vom Typ her zusammengehören, wird Entitätsmenge genannt. Damit ist wortwörtlich eine Menge von Entitaten gemeint.

- Attribut

Die Objekte, über die wir Informationen sammeln, besitzen bestimmte Eigenschaften. Zum Beispiel haben unsere Mitarbeiter jeweils einen Vornamen, einen Nachnamen, eine Adresse, usw.

- Attributwert:

Was unterscheidet aber einen Mitarbeiter von einem anderen Mitarbeiter? Die Antwort lautet: die Werte seiner Eigenschaf-ten bzw. Attribute.


Die referenzielle Integrität ist ein zentrales Prinzip in relationalen Datenbanken, das sicherstellt, dass Beziehungen zwischen Tabellen konsistent bleiben.  

1. **Erläuterung des Prinzips der referentiellen Integrität (C3G):**  
   - Die referenzielle Integrität stellt sicher, dass Fremdschlüsselwerte immer auf gültige Primärschlüsselwerte verweisen.  
   - Es verhindert, dass Datensätze in einer Tabelle existieren, die auf nicht existierende Datensätze in einer anderen Tabelle verweisen.  
   - Dies wird durch Einschränkungen (Constraints) wie `FOREIGN KEY` und entsprechende Aktionen definiert.  

2. **Auswirkungen von Löschen und Ändern von Daten auf die referenzielle Integrität (C3F):**  
   - Löscht man einen Primärschlüsselwert, auf den Fremdschlüssel verweisen, entstehen „verwaiste“ Datensätze, falls keine Maßnahmen getroffen werden.  
   - Änderungen an Primärschlüsseln erfordern eine Anpassung der referenzierenden Fremdschlüssel oder können zu Inkonsistenzen führen.  
   - Ohne geeignete Regeln könnten Abfragen falsche oder unvollständige Daten liefern.  

3. **Anwendung von Regeln zur Sicherstellung der Datenbankkonsistenz (C3E):**  
   - **Löschweitergabe (`ON DELETE CASCADE`)**: Beim Löschen eines Primärschlüssels werden alle referenzierenden Datensätze ebenfalls gelöscht.  
   - **Setzen auf NULL (`ON DELETE SET NULL`)**: Beim Löschen eines Primärschlüssels wird der Fremdschlüsselwert in den referenzierenden Datensätzen auf NULL gesetzt.  
   - **Einschränkung (`ON DELETE RESTRICT` oder `ON DELETE NO ACTION`)**: Verhindert das Löschen eines Primärschlüssels, wenn noch abhängige Fremdschlüssel existieren.  
   - **Aktualisierungsweitergabe (`ON UPDATE CASCADE`)**: Änderungen am Primärschlüsselwert werden automatisch in allen referenzierenden Fremdschlüsseln übernommen.  

Durch die konsequente Anwendung dieser Regeln wird die Konsistenz und Integrität der Datenbank gewährleistet.

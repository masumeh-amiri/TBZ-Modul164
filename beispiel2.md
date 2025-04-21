### Beispiel 1: Identifizierende Beziehung

**Beziehung:** **Person -- Ausweis**

- Der Ausweis ist ohne die Person nicht eindeutig identifizierbar. Die **PersonID** ist daher Teil des Primärschlüssels des Ausweises.

**Datenbankmodell:**
```sql
Person (PersonID, Name)
Ausweis (AusweisID, Ausweisnummer, PersonID)
```
- **Primärschlüssel Ausweis:** (AusweisID, PersonID)

### Beispiel 2: Nicht-Identifizierende Beziehung

**Beziehung:** **Person -- Kleidungsstück**

- Das Kleidungsstück hat eine eigene Identität und kann ohne die Person existieren. Es wird über eine **Person_Kleidungsstück**-Tabelle verbunden.

**Datenbankmodell:**
```sql
Person (PersonID, Name)
Kleidungsstück (KleidungsstückID, Bezeichnung)
Person_Kleidungsstück (PersonID, KleidungsstückID)
```
- **Primärschlüssel Kleidungsstück:** KleidungsstückID

### Beispiel für Identifizierende Beziehung:

**Beziehung:** **Firma -- Vertrag**

- Der Vertrag ist nur durch die Firma eindeutig identifizierbar, da der Vertrag ohne Firma keine eigenständige Identität hat.

**Datenbankmodell:**
```sql
Firma (FirmaID, Name)
Vertrag (VertragID, FirmaID)
```
- **Primärschlüssel Vertrag:** (VertragID, FirmaID)

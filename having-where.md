## HAVING ODER WHERE
### A:
WHERE

HAVING benutzt man erst nach GROUP BY oder auf Aggregatwerte (SUM, AVG...).
```
SELECT AVG(noteMathe) AS Durchschnittsnote
FROM schueler
WHERE name LIKE 'B%' 
  AND noteMathe < 3;
```

### B:
HAVING: um nur Marken mit mindestens 15 Schülern zu zeigen (Filter NACH dem Gruppieren).
```
SELECT lehrer.status, COUNT(*) AS Anzahl_Lehrer
FROM lehrer
WHERE gehalt > 2000
  AND idOrte = 4
GROUP BY lehrer.status;
```

### C:
WHERE wird verwendet, weil du auf Spaltenfilter arbeitest (Gehalt, Ort) – das passiert vor dem Gruppieren.

HAVING brauchst du hier nicht, weil du nicht auf Gruppenergebnisse wie COUNT() filterst.
```
SELECT lehrer.status, COUNT(*) AS Anzahl_Lehrer
FROM lehrer
WHERE gehalt > 2000
  AND idOrte = 4
GROUP BY lehrer.status;

```
### D:
WHERE wird verwendet für die Filterung der Fächer nach dem Namen ("R" oder "M").

HAVING wird verwendet für die Filterung nach Durchschnittsgehalt, weil AVG(gehalt) ein Gruppenergebnis ist.
```
SELECT fach.bezeichnung, 
       COUNT(lehrer.id) AS anzahl_lehrer, 
       AVG(lehrer.gehalt) AS durchschnittsgehalt
FROM fach
JOIN unterrichtet ON fach.id = unterrichtet.id_fach
JOIN lehrer ON unterrichtet.id_lehrer = lehrer.id
WHERE fach.bezeichnung LIKE 'R%' OR fach.bezeichnung LIKE 'M%'
GROUP BY fach.bezeichnung
HAVING AVG(lehrer.gehalt) > 2800;

```

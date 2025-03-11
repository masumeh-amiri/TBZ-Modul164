
### **Kartesisches Produkt: Warum gibt diese Abfrage kein sinnvolles Ergebnis?**  
```
SELECT * FROM kunden
INNER JOIN orte;
```
- Diese Abfrage ist fehlerhaft, weil es keine **Join-Bedingung** gibt.  
 
- **Korrekte Lösung:** Ein `INNER JOIN` mit einer `ON`-Bedingung:
  ```
  SELECT * FROM kunden
  INNER JOIN orte ON kunden.fk_ort_postleitzahl = orte.id_postleitzahl;
  ```

---

### **Einfache Abfragen über zwei Tabellen**  

**a) Name, Postleitzahl und Wohnort aller Kunden ausgeben**  
```
SELECT kunden.name, kunden.fk_ort_postleitzahl, orte.name AS wohnort
FROM kunden
INNER JOIN orte ON kunden.fk_ort_postleitzahl = orte.id_postleitzahl;
```

---

**b) Name und Wohnort aller Kunden mit Postleitzahl 79312**  
```
SELECT kunden.name, orte.name AS wohnort
FROM kunden
INNER JOIN orte ON kunden.fk_ort_postleitzahl = orte.id_postleitzahl
WHERE kunden.fk_ort_postleitzahl = '79312';
```

---

**c) Name und Wohnort aller Kunden aus Emmendingen**  
```
SELECT kunden.name, orte.name AS wohnort
FROM kunden
INNER JOIN orte ON kunden.fk_ort_postleitzahl = orte.id_postleitzahl
WHERE orte.name = 'Emmendingen';
```

---

**d) Name, Wohnort und Einwohnerzahl aller Kunden aus Orten mit mehr als 70.000 Einwohnern**  
```
SELECT kunden.name, orte.name AS wohnort, orte.einwohnerzahl
FROM kunden
INNER JOIN orte ON kunden.fk_ort_postleitzahl = orte.id_postleitzahl
WHERE orte.einwohnerzahl > 70000;
```

---

**e) Alle Orte mit weniger als 1.000.000 Einwohnern ausgeben**  
```
SELECT name
FROM orte
WHERE einwohnerzahl < 1000000;
```

---

**f) Kunden aus Orten mit Einwohnerzahl zwischen 100.000 und 1.500.000**  
```
SELECT kunden.name, orte.name AS wohnort
FROM kunden
INNER JOIN orte ON kunden.fk_ort_postleitzahl = orte.id_postleitzahl
WHERE orte.einwohnerzahl BETWEEN 100000 AND 1500000;
```

---

**g) Kundennamen und Ortsnamen ausgeben mit spezifischen Buchstabenregeln**  
```
SELECT kunden.name, kunden.fk_ort_postleitzahl, orte.name AS wohnort
FROM kunden
INNER JOIN orte ON kunden.fk_ort_postleitzahl = orte.id_postleitzahl
WHERE kunden.name LIKE '%e%'
   OR orte.name LIKE '%u%'
   OR orte.name LIKE '%r%';
```

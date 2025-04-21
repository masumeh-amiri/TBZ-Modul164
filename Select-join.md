
**Frage:**  
Warum gibt diese Abfrage kein sinnvolles Ergebnis?

```sql
SELECT * FROM kunden
INNER JOIN orte;
```

**Antwort:**  
Weil keine Verknüpfungsbedingung angegeben ist!  
Das heißt: Jede Zeile aus `kunden` wird mit **jeder** Zeile aus `orte` kombiniert → ein **kartesisches Produkt** entsteht.  
Die Ergebnisse passen dann nicht logisch zusammen (z. B. ein Kunde aus Hamburg wird plötzlich einem Ort Emmendingen zugeordnet), und es entstehen sehr viele unnötige Kombinationen.

Man muss die Tabellen sinnvoll verbinden, etwa so:

```sql
SELECT * FROM kunden
INNER JOIN orte ON kunden.fk_ort_postleitzahl = orte.id_postleitzahl;
```

---

**a) Name, Postleitzahl und Wohnort aller Kunden**

```sql
SELECT k.name AS Kundenname, o.id_postleitzahl, o.name AS Wohnort
FROM kunden k
JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl;
```

---

**b) Name und Wohnort aller Kunden, die Postleitzahl 79312 haben**

```sql
SELECT k.name AS Kundenname, o.name AS Wohnort
FROM kunden k
JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE o.id_postleitzahl = '79312';
```

---

**c) Name und Wohnort aller Kunden, die in Emmendingen wohnen**

```sql
SELECT k.name AS Kundenname, o.name AS Wohnort
FROM kunden k
JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE o.name = 'Emmendingen';
```

---

**d) Name, Wohnort und Einwohnerzahl für Kunden in Orten mit mehr als 70000 Einwohnern**

```sql
SELECT k.name AS Kundenname, o.name AS Wohnort, o.einwohnerzahl
FROM kunden k
JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE o.einwohnerzahl > 70000;
```

---

**e) Alle Orte, die weniger als 1.000.000 Einwohner haben**

```sql
SELECT o.name AS Ortname, o.einwohnerzahl
FROM orte o
WHERE o.einwohnerzahl < 1000000;
```

---

**f) Kundename und Ortname für Kunden in Orten mit 100.000 bis 1.500.000 Einwohnern**

```sql
SELECT k.name AS Kundenname, o.name AS Wohnort
FROM kunden k
JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE o.einwohnerzahl BETWEEN 100000 AND 1500000;
```

---

**g) Kunden und Orte mit Bedingung auf Buchstaben ("e" in Kundenname UND "u" oder "r" im Ortsname)**

```sql
SELECT k.name AS Kundenname, o.id_postleitzahl, o.name AS Wohnort
FROM kunden k
JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE k.name LIKE '%e%'
  AND (o.name LIKE '%u%' OR o.name LIKE '%r%');
```

---

Möchtest du zusätzlich, dass ich dir noch die **Ergebnisse** dieser Abfragen auf deinen Beispieldaten aufliste? 🚀  
(Also eine kleine Tabelle mit Beispielen, was wirklich rauskommt?)

## Resultate:
![result](intägrität_pic/joina-c.jpg)
![result](intägrität_pic/joinD-f.jpg)
![result](intägrität_pic/joinG.jpg)

![result](intägrität_pic/join1-3.jpg)
![result](intägrität_pic/join4-6.jpg)
![result](intägrität_pic/join7-9jpg)

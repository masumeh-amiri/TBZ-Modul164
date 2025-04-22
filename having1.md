
### 1.a) Schüler mit Durchschnitt besser als 4

```sql
SELECT name AS Schülername, 
       (noteMathe + noteDeutsch) / 2.0 AS Durchschnittsnote
FROM schueler
HAVING Durchschnittsnote < 4;
```

---

### 1.b) Durchschnittsnote auf eine Dezimale runden und aufsteigend sortieren

```sql
SELECT name AS Schülername, 
       ROUND((noteMathe + noteDeutsch) / 2.0, 1) AS Durchschnittsnote
FROM schueler
HAVING Durchschnittsnote < 4
ORDER BY Durchschnittsnote ASC;
```

---

### 2) Lehrer und ihr Nettogehalt (nur wenn > 3000)

```sql
SELECT name AS Lehrername, 
       gehalt * 0.7 AS Nettogehalt
FROM lehrer
HAVING Nettogehalt > 3000;
```

---

### 3) Klassenzimmer mit weniger als 10 Schülern

```sql
SELECT klassenzimmer AS Klassenzimmer, 
       COUNT(*) AS Anzahl
FROM schueler
GROUP BY klassenzimmer
HAVING COUNT(*) < 10;
```

---

### 4.a) Russische Schüler ("RU") je Ort, aufsteigend nach Ort-Name

```sql
SELECT COUNT(*) AS Anzahl, 
       o.name AS "Ort-Name"
FROM schueler s
JOIN orte o ON s.idOrte = o.id
WHERE s.nationalitaet = 'RU'
GROUP BY o.name
ORDER BY o.name ASC;
```

---

### 4.b) Erweiterung: Nur Orte mit 10 oder mehr russischen Schülern

```sql
SELECT COUNT(*) AS Anzahl, 
       o.name AS "Ort-Name"
FROM schueler s
JOIN orte o ON s.idOrte = o.id
WHERE s.nationalitaet = 'RU'
GROUP BY o.name
HAVING COUNT(*) >= 10
ORDER BY o.name ASC;
```

---
![result](intägrität_pic/having1.jpg)
![result](intägrität_pic/having2.jpg)
![result](intägrität_pic/having3.jpg)

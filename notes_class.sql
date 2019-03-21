Vypište třídy (rok a název), které jsou starší než druhý ročník

SELECT * FROM year, name FROM class WHERE year > 2;

Vypište třídy (id, rok a název), které mají název A nebo C a seřaďte je od nejstarších

SELECT id, year, name FROM class WHERE name IN ('A', 'C') ORDER BY year DESC;

SELECT name FROM teacher WHERE name IN ('Jesse', 'Alice', )

---------------------
Agregační funkce

SELECT name FROM teacher GROUP BY name

SELECT SUM(salary) name

SELECT AVG(salary), name - vsechny Albertove maji takovy plat

SELECT AVG(salary), name
FROM teacher
WHERE name IN('Albert')
GROUP BY name
-----------------------
Ukol 4

Vypište počet učitelů v databázi a jejich průměrný plat

SELECT COUNT(*), AVG(salary) FROM teacher;

Seskupte třídy podle názvu, pro každý z nich vypište nejnižší a nejvyšší ročník

SELECT name, MIN (year), MAX (year) from class GROUP BY name;

Seskupte třídy podle názvu, pro každý z nich vypište nejnižší a nejvyšší ročník,
výsledky seřaďte vzestupně podle nejvyššího ročníku

SELECT name, MIN(year), MAX(year) FROM class GROUP BY name ORDER BY MAX(year);
----------------------

Aliasy - tipa sokrasheniya - teacher t - v sled raz prosto t napishem i on poimet chto eto teacher

SELECT name, MIN(year), MAX(year) AS maximalni rok
FROM class GROUP BY name ORDER BY maximalni rok;

SELECT c.name {class.name}
FROM class c
GROUP BY c.name
ORDER BY c.name

JOIN - do ted jsme tahali data z jedne tabulky, ale to je relacni databaze, proto budeme chtit nejak
       spojit data.
----

SELECT t.name, c.year, c.name
FROM teacher t
JOIN class c ON t.id = c.homeroom_teacher_id
--
esli chci spojit tabulky

SELECT *
FROM class_subject cs
JOIN subject s ON cs.subject_id = s.id
JOIN class c ON cs.class_id = c.id
JOIN teacher t ON cs.teacher_id = t.id - pridam dalsi JOIN

-----
Úkol 5 - spojování tabulek

1. Vypište počet učitelů v databázi a jejich průměrný plat.
   Výsledné sloupce pojmenujte `teachers_count` a `avg_salary`

   SELECT COUNT(*) AS teachers_count, AVG(salary) AS avg_salary FROM teacher;

2. Vypište seznam tříd a jejich třídních učitelů, výsledek seřaďte podle ročníku a názvu třídy

  SELECT class.year, class.name, teacher.name
  FROM class
  JOIN teacher ON class.homeroom_teacher_id = teacher.id
  ORDER BY class.year, class.name;

3. Vypište ročníky a názvy tříd, jejichž třídní učitel se jmenuje Albert

  SELECT class.year, class.name, teacher.name
  FROM class
  JOIN teacher ON class.homeroom_teacher_id = teacher.id
  WHERE teacher.name = 'Albert'
  ORDER BY class.year, class.name;

4. Vypište počet žáků v každé třídě - ve výsledné tabulce bude ročník, jméno třídy a počet žáků

  SELECT class.year, class.name, COUNT(*)
  FROM class
  JOIN pupil ON pupil.class_id = class.id
  GROUP BY class.year, class.name

------
Editace dat - UPDATE

abysme mohli plne vyuzivat databazi na webu tak chceme do ni ukladat data.

UPDATE teacher SET name = Joseph WHERE name = Joe
 muzeme definovat ruzne podminky, treba navysit plat vsem kdo uci nejaky predmet

jestli mam slozitejsi podminky, misto SELECT dame UPDATE, tam kde SET urcim co chci


UPDATE class_subject cs
JOIN subject s ON cs.subject_id = s.id
JOIN class c ON cs.class_id = c.id
JOIN teacher t ON cs.teacher_id = t.id
SET t.salary = t.salary + 1000
WHERE s.name = 'Mathematics'
  AND c.year = 3;

-----
Úkol 6 - aktualizace dat - reshenie posmotret zdes nepravilno napisano

1. Vypište třídy a jejich třídní učitele

  SELECT class.year, class.name, teacher.name
  FROM class
  JOIN teacher ON class.homeroom_teacher_id = teacher.id

2. Přejmenujte třídy, které mají třídního učitele Alberta nebo Brandona na `C`

  UPDATE class
  JOIN class ON class.homeroom_teacher_id = teacher.id
  SET name = 'C'
  WHERE teacher.name = 'Albert' OR 'Bradnon'

3. Vypište znovu třídy a jejich třídní učitele
4. Přejmenujte všechny třídy `C` zpět na `A`

  UPDATE class c
  SET c.name = 'A'
  WHERE c.name = 'C';

-----

INSERT

INSERT INTO subject (name) VALUES ('Literature'), ('Music');

k name muzu cherez zapyatuyu zapisat sleduyushii stolbec, jesli nado,
togda i k Literature i k Music tozhe cherez zapyatuyu novye value.GROUP

-----
DELETE

DELETE s FROM subject s WHERE s.name = 'Biology';

where - podminka kde mazu
---
UKOL 7 - udelat doma, ne uspeli

domaci ukol sdelat sql soubor i commit i push na github

pristi hodina - Symphony framework - usnadneni prace











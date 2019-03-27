#####################
# 1. Vypište všechny učitele kteří neučí žádný předmět

SELECT t.name AS učitele_kteří_neučí_žádný_předmět

FROM teacher t

    LEFT JOIN class_subject cs ON t.id = cs.teacher_id

    WHERE cs.teacher_id IS NULL;

#####################
# 2. Vypište všechny žáky, kteří mají alespoň jednu 5 a zároveň vypište kolik jich mají

SELECT p.name AS žáky,

COUNT(*) AS pocet_petek

FROM pupil_subject ps

    JOIN pupil p ON ps.pupil_id = p.id

WHERE ps.grade = 5

GROUP BY p.name

#####################
# 3. Vypište průměr pro každou třídu

SELECT cs.class_id AS Třída, AVG(ps.grade) AS Průměr

FROM  pupil p

    JOIN class_subject cs ON cs.class_id = p.class_id

    JOIN pupil_subject ps ON p.id = ps.pupil_id

GROUP BY cs.class_id

#####################
# 4. Vypiště průměr pro každý ročník

SELECT c.year AS Ročník, AVG(ps.grade) AS Průměr

FROM  pupil p

    JOIN class_subject cs ON cs.class_id = p.class_id

    JOIN pupil_subject ps ON p.id = ps.pupil_id

    JOIN class c ON c.id = p.class_id

GROUP BY c.year

#####################
# 5. Vypište všechny učitele, kteří učí svojí třídu alespoň na jeden předmět

SELECT t.name AS Učitele_kteří_učí_svojí_třídu_alespoň_na_jeden_předmět

FROM class c

    JOIN class_subject cs

      ON (cs.class_id = c.id AND cs.teacher_id = c.homeroom_teacher_id)

    JOIN teacher t ON t.id = c.homeroom_teacher_id

WHERE c.homeroom_teacher_id IN (5,17,18,12,16,19)

GROUP BY t.name

#####################
# 6. Vypište průměrnou známku pro každý předmět a ročník

SELECT s.name AS Předmět, c.year AS Ročník, AVG(ps.grade) AS Průměr

FROM pupil_subject ps

     JOIN subject s ON ps.subject_id = s.id

     JOIN pupil p ON ps.pupil_id = p.id

     JOIN class c ON c.id = p.class_id

GROUP BY s.name, c.year

#####################
# 7. Vypište hitpárádu 5 lidumilů a 5 drsňáků, tj. 5 učitelů s nejlepší průměrem
známek na předmětech, které učí a 5 učitelů s nejhorším průměrem známek)

SELECT t.name AS 5_lidumilů

FROM class_subject cs

    JOIN pupil_subject ps ON cs.subject_id = ps.subject_id

    JOIN teacher t ON cs.teacher_id = t.id

GROUP BY t.name

ORDER BY AVG(ps.grade) DESC LIMIT 5

<!-- kdyz odeberu "LIMIT 5" tak maji jine poradi, sice patri do nej petky-->

SELECT t.name AS 5_drsňáků

FROM class_subject cs

    JOIN pupil_subject ps ON cs.subject_id = ps.subject_id

    JOIN teacher t ON cs.teacher_id = t.id

GROUP BY t.name

ORDER BY AVG(ps.grade) ASC LIMIT 5
















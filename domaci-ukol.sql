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
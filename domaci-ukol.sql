#####################
# 1. Vypište všechny učitele kteří neučí žádný předmět

SELECT t.name AS učitele_kteří_neučí_žádný_předmět
FROM teacher t
    LEFT JOIN class_subject cs ON t.id = cs.teacher_id
    WHERE cs.teacher_id IS NULL;

#####################
# 2. Vypište všechny žáky, kteří mají alespoň jednu 5 a zároveň vypište kolik jich mají

SELECT pupil_id AS zaky5

FROM pupil_subject ps WHERE ps.grade = 5
-- 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
    SELECT apellido1, apellido2, nombre  FROM universidad.persona WHERE tipo = 'alumno' ORDER BY apellido1, nombre, apellido2;

-- 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades. (nombre, apellido1, apellido2)
    SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE tipo = 'alumno' AND telefono IS NULL;

-- 3. Retorna el llistat dels alumnes que van néixer en 1999. (id, nombre, apellido1, apellido2, fecha_nacimiento)
    SELECT id, nombre, apellido1, apellido2, fecha_nacimiento FROM universidad.persona WHERE tipo = 'alumno' AND year(fecha_nacimiento) = 1999;

-- 4. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K. (nombre, apellido1, apellido2, nif)
    SELECT nombre, apellido1, apellido2, nif FROM universidad.persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

-- 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7. (id, nombre, cuatrimestre, curso, id_grado)
    SELECT id, nombre, cuatrimestre, curso, id_grado FROM universidad.asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 6. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament.
-- El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom. (apellido1, apellido2, nombre, departamento)
    SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento
    FROM universidad.persona p
        JOIN universidad.profesor p2
            ON p.id = p2.id_profesor
        JOIN universidad.departamento d
        ON d.id = p2.id_departamento
    WHERE tipo = 'profesor'
    ORDER BY p.apellido1, p.apellido2, p.nombre;

-- 7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M. (nombre, anyo_inicio, anyo_fin)
    SELECT a.nombre, c.anyo_inicio, c.anyo_fin
    FROM universidad.asignatura a
        JOIN universidad.alumno_se_matricula_asignatura alum_se_matri
            ON alum_se_matri.id_asignatura = a.id
        JOIN universidad.curso_escolar c
        ON c.id = alum_se_matri.id_curso_escolar
    JOIN universidad.persona p on p.id = alum_se_matri.id_alumno
    WHERE p.nif = '26902806M';

-- 8. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015). (nombre)
SELECT DISTINCT d.nombre
    FROM universidad.departamento d
        JOIN universidad.profesor prof
            ON prof.id_departamento = d.id
        JOIN universidad.asignatura a
        ON prof.id_profesor = a.id_profesor
        JOIN universidad.grado g on g.id = a.id_grado
        WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019. (nombre, apellido1, apellido2)
    SELECT DISTINCT p.nombre, p.apellido1, p.apellido2
    FROM universidad.persona p
        JOIN universidad.alumno_se_matricula_asignatura asma
            ON asma.id_alumno = p.id
        JOIN universidad.curso_escolar ce
        ON ce.id = asma.id_curso_escolar
        WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- 10. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats.
-- El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat.
-- El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a.
-- El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
-- (departamento, apellido1, apellido2, nombre)
    SELECT DISTINCT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre
    FROM universidad.persona p
         LEFT JOIN universidad.profesor prof
            ON p.id = prof.id_profesor
         LEFT JOIN universidad.departamento d
        ON prof.id_departamento = d.id
            WHERE p.tipo = 'profesor'
    ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

-- 11. Retorna un llistat amb els professors/es que no estan associats a un departament. (apellido1, apellido2, nombre)
    SELECT DISTINCT p.apellido1, p.apellido2, p.nombre
    FROM universidad.persona p
         LEFT JOIN universidad.profesor prof
            ON p.id = prof.id_profesor
         LEFT JOIN universidad.departamento d
        ON prof.id_departamento IS NULL
            WHERE p.tipo = 'profesor' AND prof.id_profesor IS NULL;

-- 12. Retorna un llistat amb els departaments que no tenen professors/es associats. (nombre)
    SELECT DISTINCT d.nombre
    FROM universidad.profesor prof
         RIGHT JOIN universidad.departamento d
            ON prof.id_departamento = d.id
         WHERE prof.id_departamento IS NULL;

-- 13. Retorna un llistat amb els professors/es que no imparteixen cap assignatura. (apellido1, apellido2, nombre)
    SELECT DISTINCT pers.apellido1, pers.apellido2, pers.nombre
    FROM universidad.persona pers
    JOIN universidad.profesor prof
    ON pers.id = prof.id_profesor
    LEFT JOIN universidad.asignatura a
    ON prof.id_profesor = a.id_profesor
    WHERE pers.tipo = 'profesor' AND a.id IS NULL;

-- 14. Retorna un llistat amb les assignatures que no tenen un professor/a assignat. (id, nombre)
    SELECT a.id, a.nombre
    FROM universidad.asignatura a
    WHERE a.id_profesor IS NULL;

-- 15. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar. (nombre)
    SELECT DISTINCT d.nombre
    FROM universidad.departamento d
    LEFT JOIN universidad.profesor p ON d.id = p.id_departamento
    LEFT JOIN universidad.asignatura a ON p.id_profesor = a.id_profesor
    LEFT JOIN universidad.alumno_se_matricula_asignatura asma on a.id = asma.id_asignatura
    LEFT JOIN universidad.curso_escolar ON asma.id_curso_escolar = curso_escolar.id;

-- Consultes resum:
-- 16. Retorna el nombre total d'alumnes que hi ha. (total)
    SELECT COUNT(id) AS total
    FROM universidad.persona
    WHERE tipo = 'alumno';

-- 17. Calcula quants alumnes van néixer en 1999. (total)
    SELECT COUNT(id) AS total
    FROM universidad.persona
    WHERE tipo = 'alumno' AND (fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31');

-- 18. Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es. (departamento, total)
    SELECT d.nombre AS departamento, COUNT(id_profesor) AS total
    FROM universidad.profesor
    JOIN universidad.departamento d on d.id = profesor.id_departamento
    GROUP BY d.nombre ORDER BY total DESC;

-- 19. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat. (departamento, total)
    SELECT d.nombre AS departamento, COUNT(id_profesor) AS total
    FROM universidad.profesor
    RIGHT JOIN universidad.departamento d on d.id = profesor.id_departamento
    GROUP BY d.nombre;

-- 20. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures. (grau, total)
    SELECT g.nombre AS grau, COUNT(a.id) AS total
    FROM universidad.asignatura a
    RIGHT JOIN universidad.grado g ON g.id = a.id_grado
    GROUP BY g.nombre
    ORDER BY total DESC;

-- 21. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades. (grau, total)
    SELECT g.nombre AS grau, COUNT(a.id) AS total
    FROM universidad.asignatura a
    LEFT JOIN universidad.grado g ON g.id = a.id_grado
    GROUP BY g.id, g.nombre
    HAVING total >= 50;

-- 22. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus. (grau, tipus, total_creditos)
    SELECT g.nombre AS grau, a.tipo AS tipo, SUM(a.creditos) AS total_creditos
    FROM universidad.asignatura a
    JOIN universidad.grado g ON g.id = a.id_grado
    GROUP BY g.nombre, a.tipo;

-- 23. Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats. (anyo_inicio, total)
    SELECT c.anyo_inicio, COUNT(DISTINCT asma.id_alumno) AS total
    FROM universidad.curso_escolar c
    JOIN universidad.alumno_se_matricula_asignatura asma ON c.id = asma.id_curso_escolar
    GROUP BY asma.id_curso_escolar;

-- 24. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures. (id, nombre, apellido1, apellido2, total)
    SELECT prof.id_profesor AS id, pers.nombre, pers.apellido1, pers.apellido2, COUNT(DISTINCT a.id) AS total
    FROM universidad.persona pers
        JOIN universidad.profesor prof ON pers.id = prof.id_profesor
    LEFT JOIN universidad.asignatura a ON prof.id_profesor = a.id_profesor GROUP BY prof.id_profesor, pers.nombre, pers.apellido1, pers.apellido2 ORDER BY total DESC;

-- 25. Retorna totes les dades de l'alumne/a més jove.
    SELECT * FROM universidad.persona p
    WHERE tipo = 'alumno' 
        ORDER BY fecha_nacimiento DESC LIMIT 1;


-- 26. Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura. (apellido1, apellido2, nombre)
    SELECT pers.apellido1, pers.apellido2, pers.nombre
    FROM universidad.persona pers
    JOIN universidad.profesor prof on pers.id = prof.id_profesor
    JOIN universidad.departamento d on d.id = prof.id_departamento
    LEFT JOIN universidad.asignatura a on prof.id_profesor = a.id_profesor
    WHERE a.id_profesor IS NULL;

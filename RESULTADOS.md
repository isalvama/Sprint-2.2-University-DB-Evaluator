# 📊 Análisis de Consultas SQL


## 📈 Resumen
✅ 14 correctas de 24 queries

## ❌ Query 1: Incorrecto
```diff
--- 
+++ 
@@ -1,13 +1,13 @@
-apellido1 | apellido2 | nombre
-Domínguez | Guerrero | Antonio
-Gea | Ruiz | Sonia
-Gutiérrez | López | Juan
-Heller | Pagac | Pedro
-Herman | Pacocha | Daniel
-Hernández | Martínez | Irene
-Herzog | Tremblay | Ramón
-Koss | Bayer | José
-Lakin | Yundt | Inma
-Saez | Vega | Juan
-Sánchez | Pérez | Salvador
-Strosin | Turcotte | Ismael
+nombre | apellido1 | apellido2
+Antonio | Domínguez | Guerrero
+Sonia | Gea | Ruiz
+Juan | Gutiérrez | López
+Pedro | Heller | Pagac
+Daniel | Herman | Pacocha
+Irene | Hernández | Martínez
+Ramón | Herzog | Tremblay
+José | Koss | Bayer
+Inma | Lakin | Yundt
+Juan | Saez | Vega
+Salvador | Sánchez | Pérez
+Ismael | Strosin | Turcotte
```

⏱ Tiempo: 0.41 ms
🔍 No se usó ningún índice en esta consulta.

---

## ✅ Query 2: Correcto

⏱ Tiempo: 0.31 ms
🔍 No se usó ningún índice en esta consulta.

---

## ✅ Query 3: Correcto

⏱ Tiempo: 0.31 ms
🔍 No se usó ningún índice en esta consulta.

---

## ✅ Query 4: Correcto

⏱ Tiempo: 0.31 ms
🔍 No se usó ningún índice en esta consulta.

---

## ✅ Query 5: Correcto

⏱ Tiempo: 0.33 ms
✅ Se usó índice(s) en la consulta: id_grado

---

## ❌ Query 6: Incorrecto
```diff
--- 
+++ 
@@ -1,13 +1,13 @@
-apellido1 | apellido2 | nombre | departamento
-Fahey | Considine | Antonio | Economía y Empresa
-Hamill | Kozey | Manolo | Informática
-Kohler | Schoen | Alejandro | Matemáticas
-Lemke | Rutherford | Cristina | Economía y Empresa
-Monahan | Murray | Micaela | Agronomía
-Ramirez | Gea | Zoe | Informática
-Ruecker | Upton | Guillermo | Educación
-Schmidt | Fisher | David | Matemáticas
-Schowalter | Muller | Francesca | Química y Física
-Spencer | Lakin | Esther | Educación
-Stiedemann | Morissette | Alfredo | Química y Física
-Streich | Hirthe | Carmen | Educación
+apellido1 | apellido1 | nombre
+Fahey | Fahey | Economía y Empresa
+Hamill | Hamill | Informática
+Kohler | Kohler | Matemáticas
+Lemke | Lemke | Economía y Empresa
+Monahan | Monahan | Agronomía
+Ramirez | Ramirez | Informática
+Ruecker | Ruecker | Educación
+Schmidt | Schmidt | Matemáticas
+Schowalter | Schowalter | Química y Física
+Spencer | Spencer | Educación
+Stiedemann | Stiedemann | Química y Física
+Streich | Streich | Educación
```

⏱ Tiempo: 0.40 ms
✅ Se usó índice(s) en la consulta: PRIMARY,id_departamento, PRIMARY

---

## ✅ Query 7: Correcto

⏱ Tiempo: 0.56 ms
✅ Se usó índice(s) en la consulta: PRIMARY, PRIMARY,id_asignatura,id_curso_escolar, PRIMARY,nif

---

## ❌ Query 8: Incorrecto
```diff
--- 
+++ 
@@ -1,2 +1,22 @@
 nombre
 Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
```

⏱ Tiempo: 0.37 ms
✅ Se usó índice(s) en la consulta: PRIMARY,id_departamento, PRIMARY, id_profesor,id_grado

---

## ✅ Query 9: Correcto

⏱ Tiempo: 0.39 ms
✅ Se usó índice(s) en la consulta: PRIMARY, PRIMARY,id_curso_escolar

---

## ❌ Query 10: Incorrecto
```diff
--- 
+++ 
@@ -1,13 +1,13 @@
-departamento | apellido1 | apellido2 | nombre
-Agronomía | Monahan | Murray | Micaela
-Economía y Empresa | Fahey | Considine | Antonio
-Economía y Empresa | Lemke | Rutherford | Cristina
-Educación | Ruecker | Upton | Guillermo
-Educación | Spencer | Lakin | Esther
-Educación | Streich | Hirthe | Carmen
-Informática | Hamill | Kozey | Manolo
-Informática | Ramirez | Gea | Zoe
-Matemáticas | Kohler | Schoen | Alejandro
-Matemáticas | Schmidt | Fisher | David
-Química y Física | Schowalter | Muller | Francesca
-Química y Física | Stiedemann | Morissette | Alfredo
+nombre | nombre | apellido1 | apellido2
+Agronomía | Micaela | Monahan | Murray
+Economía y Empresa | Antonio | Fahey | Considine
+Economía y Empresa | Cristina | Lemke | Rutherford
+Educación | Guillermo | Ruecker | Upton
+Educación | Esther | Spencer | Lakin
+Educación | Carmen | Streich | Hirthe
+Informática | Manolo | Hamill | Kozey
+Informática | Zoe | Ramirez | Gea
+Matemáticas | Alejandro | Kohler | Schoen
+Matemáticas | David | Schmidt | Fisher
+Química y Física | Francesca | Schowalter | Muller
+Química y Física | Alfredo | Stiedemann | Morissette
```

⏱ Tiempo: 0.43 ms
✅ Se usó índice(s) en la consulta: PRIMARY

---

## ✅ Query 11: Correcto

⏱ Tiempo: 0.40 ms
✅ Se usó índice(s) en la consulta: PRIMARY

---

## ✅ Query 12: Correcto

⏱ Tiempo: 0.33 ms
✅ Se usó índice(s) en la consulta: id_departamento

---

## ❌ Query 13: Incorrecto
```diff
--- 
+++ 
@@ -1,11 +1,11 @@
 apellido1 | apellido2 | nombre
 Schmidt | Fisher | David
-Kohler | Schoen | Alejandro
 Lemke | Rutherford | Cristina
-Fahey | Considine | Antonio
 Spencer | Lakin | Esther
 Streich | Hirthe | Carmen
+Stiedemann | Morissette | Alfredo
+Kohler | Schoen | Alejandro
+Fahey | Considine | Antonio
 Ruecker | Upton | Guillermo
 Monahan | Murray | Micaela
-Stiedemann | Morissette | Alfredo
 Schowalter | Muller | Francesca
```

⏱ Tiempo: 0.38 ms
✅ Se usó índice(s) en la consulta: id_profesor, PRIMARY

---

## ✅ Query 14: Correcto

⏱ Tiempo: 0.31 ms
✅ Se usó índice(s) en la consulta: id_profesor

---

## ❌ Query 15: Incorrecto
```diff
--- 
+++ 
@@ -1,9 +1,63 @@
 nombre
 Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Informática
+Matemáticas
 Matemáticas
 Economía y Empresa
+Economía y Empresa
+Educación
+Educación
 Educación
 Agronomía
+Química y Física
 Química y Física
 Filología
 Derecho
```

⏱ Tiempo: 0.36 ms
✅ Se usó índice(s) en la consulta: id_profesor, PRIMARY, id_asignatura, id_departamento

---

## ✅ Query 16: Correcto

⏱ Tiempo: 0.30 ms
🔍 No se usó ningún índice en esta consulta.

---

## ✅ Query 17: Correcto

⏱ Tiempo: 0.31 ms
🔍 No se usó ningún índice en esta consulta.

---

## ❌ Query 18: Incorrecto
```diff
--- 
+++ 
@@ -1,7 +1,7 @@
 departamento | total
-Educación | 3.00
 Informática | 2.00
 Matemáticas | 2.00
 Economía y Empresa | 2.00
+Educación | 3.00
+Agronomía | 1.00
 Química y Física | 2.00
-Agronomía | 1.00
```

⏱ Tiempo: 0.36 ms
✅ Se usó índice(s) en la consulta: PRIMARY, id_departamento

---

## ✅ Query 19: Correcto

⏱ Tiempo: 0.33 ms
✅ Se usó índice(s) en la consulta: id_departamento

---

## ✅ Query 20: Correcto

⏱ Tiempo: 0.34 ms
✅ Se usó índice(s) en la consulta: id_grado

---

## ✅ Query 21: Correcto

⏱ Tiempo: 0.34 ms
✅ Se usó índice(s) en la consulta: PRIMARY

---

## ❌ Query 22: Incorrecto
```diff
--- 
+++ 
@@ -1,6 +1,6 @@
-grau | tipo | total_creditos
-Grado en Ingeniería Informática (Plan 2015) | básica | 72.00
-Grado en Ingeniería Informática (Plan 2015) | obligatoria | 54.00
-Grado en Ingeniería Informática (Plan 2015) | optativa | 180.00
-Grado en Biotecnología (Plan 2015) | básica | 60.00
-Grado en Biotecnología (Plan 2015) | obligatoria | 120.00
+grau | tipus | total_creditos
+Grado en Ingeniería Informática (Plan 2015) | básica | 12.00
+Grado en Ingeniería Informática (Plan 2015) | obligatoria | 9.00
+Grado en Ingeniería Informática (Plan 2015) | optativa | 30.00
+Grado en Biotecnología (Plan 2015) | básica | 10.00
+Grado en Biotecnología (Plan 2015) | obligatoria | 22.00
```

⏱ Tiempo: 0.37 ms
✅ Se usó índice(s) en la consulta: PRIMARY, id_grado

---

## ❌ Query 23: Incorrecto
```diff
--- 
+++ 
@@ -1,3 +1,6 @@
-anyo_inicio | total
-2014.00 | 3.00
-2018.00 | 3.00
+grau | tipus | total_creditos
+Grado en Ingeniería Informática (Plan 2015) | básica | 12.00
+Grado en Ingeniería Informática (Plan 2015) | obligatoria | 9.00
+Grado en Ingeniería Informática (Plan 2015) | optativa | 30.00
+Grado en Biotecnología (Plan 2015) | básica | 10.00
+Grado en Biotecnología (Plan 2015) | obligatoria | 22.00
```

⏱ Tiempo: 0.34 ms
✅ Se usó índice(s) en la consulta: PRIMARY, id_grado

---

## ❌ Query 24: Error
- **Descripción**: 'NoneType' object is not iterable


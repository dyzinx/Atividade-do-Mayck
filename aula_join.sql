-- 1. Listar alunos ordenados por nome e data de nascimento
SELECT nome, data_nascimento
FROM aluno
ORDER BY nome ASC, data_nascimento DESC;

-- 2. Listar professores e suas especialidades em ordem decrescente
SELECT nome, especialidade
FROM professor
ORDER BY nome DESC;

-- 3. Listar disciplinas ordenadas por carga hor�ria
SELECT nome, carga_horaria
FROM disciplina
ORDER BY carga_horaria DESC;

-- 4. Contar o n�mero de alunos em cada status de matr�cula
SELECT status, COUNT(*) AS numero_alunos
FROM matricula
GROUP BY status;

-- 5. Listar cursos com a soma total da carga hor�ria de suas disciplinas
SELECT c.nome AS curso, SUM(d.carga_horaria) AS total_carga_horaria
FROM curso c
JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.nome;

-- 6. Contar quantos professores est�o lecionando mais de 3 turmas
SELECT p.nome
FROM professor p
JOIN turma t ON p.id_professor = t.id_professor
GROUP BY p.nome
HAVING COUNT(t.id_turma) > 3;

-- 7. Listar os alunos matriculados em mais de uma disciplina
SELECT a.nome, COUNT(m.id_disciplina) AS numero_disciplinas
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
GROUP BY a.nome
HAVING COUNT(m.id_disciplina) > 1
ORDER BY numero_disciplinas DESC;

-- 8. Listar cursos com mais de 2000 horas de carga hor�ria
SELECT c.nome AS curso, SUM(d.carga_horaria) AS total_carga_horaria
FROM curso c
JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.nome
HAVING SUM(d.carga_horaria) > 2000;

-- 9. Contar o n�mero total de turmas e listar por professor
SELECT p.nome, COUNT(t.id_turma) AS total_turmas
FROM professor p
JOIN turma t ON p.id_professor = t.id_professor
GROUP BY p.nome
ORDER BY total_turmas DESC;

-- 10. Listar disciplinas e a m�dia da carga hor�ria por curso
SELECT c.nome AS curso, AVG(d.carga_horaria) AS media_carga_horaria
FROM curso c
JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.nome;

-- 11. Exibir os alunos e seus respectivos status de matr�cula, ordenados pelo status e pela data de matr�cula
SELECT a.nome, m.status, m.data_matricula
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
ORDER BY m.status, m.data_matricula DESC;

-- 12. Exibir a idade dos alunos ordenados da maior para a menor idade
SELECT nome, FLOOR(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12) AS idade
FROM aluno
ORDER BY idade DESC;

-- 13. Exibir as disciplinas e o n�mero de alunos matriculados em cada uma
SELECT d.nome AS disciplina, COUNT(m.id_aluno) AS numero_alunos
FROM disciplina d
JOIN matricula m ON d.id_disciplina = m.id_disciplina
GROUP BY d.nome
ORDER BY numero_alunos DESC;

-- 14. Listar as turmas com o nome dos professores e disciplinas, ordenadas por hor�rio
SELECT p.nome AS professor, d.nome AS disciplina, t.horario
FROM turma t
JOIN professor p ON t.id_professor = p.id_professor
JOIN disciplina d ON t.id_disciplina = d.id_disciplina
ORDER BY t.horario;

-- 15. Contar quantas disciplinas t�m carga hor�ria superior a 80 horas
SELECT COUNT(*) AS disciplinas_maior_80
FROM disciplina
WHERE carga_horaria > 80;

-- 16. Listar os cursos e a quantidade de disciplinas que cada curso possui
SELECT c.nome AS curso, COUNT(d.id_disciplina) AS total_disciplinas
FROM curso c
JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.nome;

-- 17. Exibir os professores que t�m mais de 2 disciplinas com carga hor�ria superior a 100 horas
SELECT p.nome
FROM professor p
JOIN turma t ON p.id_professor = t.id_professor
JOIN disciplina d ON t.id_disciplina = d.id_disciplina
WHERE d.carga_horaria > 100
GROUP BY p.nome
HAVING COUNT(d.id_disciplina) > 2;

-- 18. Listar disciplinas que tenham pelo menos 5 alunos matriculados
SELECT d.nome AS disciplina
FROM disciplina d
JOIN matricula m ON d.id_disciplina = m.id_disciplina
GROUP BY d.nome
HAVING COUNT(m.id_aluno) >= 5;

-- 19. Exibir o n�mero de alunos por status, ordenando pelos status com mais alunos
SELECT status, COUNT(*) AS numero_alunos
FROM matricula
GROUP BY status
ORDER BY numero_alunos DESC;

-- 20. Listar professores e a soma da carga hor�ria das disciplinas que lecionam
SELECT p.nome, SUM(d.carga_horaria) AS soma_carga_horaria
FROM professor p
JOIN turma t ON p.id_professor = t.id_professor
JOIN disciplina d ON t.id_disciplina = d.id_disciplina
GROUP BY p.nome
ORDER BY soma_carga_horaria DESC;

COMMIT;
 




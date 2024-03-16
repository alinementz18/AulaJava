CREATE database exercicio2;

use exercicio2;

CREATE TABLE ALUNO (
    aluno_id INT PRIMARY KEY,
    nome VARCHAR(100),
    curso VARCHAR(100),
    nivel VARCHAR(50),
    idade INT
);

CREATE TABLE TURMA (
    turma_id INT PRIMARY KEY,
    nometurma VARCHAR(100),
    sala VARCHAR(50),
    horario VARCHAR(50)
);

CREATE TABLE MATRICULA (
    matricula_id INT PRIMARY KEY,
    aluno_id INT,
    turma_id INT,
    nota_1 FLOAT,
    nota_2 FLOAT,
    nota_3 FLOAT,
    nota_final FLOAT,
    nr_faltas INT,
    FOREIGN KEY (aluno_id) REFERENCES ALUNO(aluno_id),
    FOREIGN KEY (turma_id) REFERENCES TURMA(turma_id)
);

-- Inserir dados na tabela ALUNO
INSERT INTO ALUNO (aluno_id, nome, curso, nivel, idade) VALUES
(1, 'João', 'Engenharia', 'Graduação', 22),
(2, 'Maria', 'Ciência da Computação', 'Graduação', 20),
(3, 'Pedro', 'Matemática', 'Graduação', 25),
(4, 'Ana', 'Administração', 'Graduação', 21);

-- Inserir dados na tabela TURMA
INSERT INTO TURMA (turma_id, nometurma, sala, horario) VALUES
(1, 'Turma A', 'Sala 101', 'Segunda-feira, 14:00-16:00'),
(2, 'Turma B', 'Sala 102', 'Terça-feira, 10:00-12:00'),
(3, 'Turma C', 'Sala 103', 'Quarta-feira, 16:00-18:00'),
(4, 'Turma D', 'Sala 104', 'Quinta-feira, 08:00-10:00');

-- Inserir dados na tabela MATRICULA
INSERT INTO MATRICULA (matricula_id, aluno_id, turma_id, nota_1, nota_2, nota_3, nota_final, nr_faltas) VALUES
(1, 1, 1, 8.5, 7.0, 9.0, 8.0, 2),
(2, 2, 2, 7.0, 6.5, 8.0, 7.5, 3),
(3, 3, 3, 9.0, 8.5, 9.5, 9.0, 1),
(4, 4, 4, 6.5, 8.0, 7.5, 7.0, 4);

-- 1. Quais os nomes de todos os alunos?
SELECT nome FROM ALUNO;


-- 2. Quais os números das matrículas dos alunos?
SELECT matricula_id FROM MATRICULA;


-- 3. Quais os números das matrículas dos alunos que não estão matriculados em uma turma?
SELECT matricula_id FROM MATRICULA WHERE turma_id IS NULL;


-- 4. Quais os números dos alunos matriculados em uma turma de número '30'?
SELECT aluno_id FROM MATRICULA WHERE turma_id = '30';


-- 5. Qual o horário da turma do aluno 'Dick Vigarista'?
SELECT T.horario
FROM ALUNO A
JOIN MATRICULA M ON A.aluno_id = M.aluno_id
JOIN TURMA T ON M.turma_id = T.turma_id
WHERE A.nome = 'Dick Vigarista';


-- 6. Quais os nomes dos alunos matriculados em uma turma de número '30'?
SELECT A.nome
FROM ALUNO A
JOIN MATRICULA M ON A.aluno_id = M.aluno_id
WHERE M.turma_id = '30';



-- 7. Quais os nomes dos alunos que não estão matriculados na turma de número '30'?
SELECT A.nome
FROM ALUNO A
WHERE A.aluno_id NOT IN (SELECT aluno_id FROM MATRICULA WHERE turma_id = '30');




-- 8. Quais os nomes das turmas com alunos com nota final maior que 8?
SELECT T.nometurma
FROM TURMA T
JOIN MATRICULA M ON T.turma_id = M.turma_id
WHERE M.nota_final > 8;

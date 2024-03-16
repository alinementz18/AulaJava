CREATE database exercicio6;

use exercicio6;

CREATE TABLE Aluno (
    aluno_id INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    data_nascimento DATE,
    altura FLOAT,
    peso FLOAT
);

CREATE TABLE Turma (
    turma_id INT PRIMARY KEY,
    tipo_curso VARCHAR(100),
    quantidade_alunos INT,
    horario_aula VARCHAR(100),
    data_inicial DATE,
    data_final DATE
);

CREATE TABLE Professor (
    professor_id INT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    titulacao VARCHAR(100)
);

CREATE TABLE Telefone_Professor (
    professor_id INT,
    telefone VARCHAR(20),
    PRIMARY KEY (professor_id, telefone),
    FOREIGN KEY (professor_id) REFERENCES Professor(professor_id)
);

CREATE TABLE Matricula (
    matricula_id INT PRIMARY KEY,
    aluno_id INT,
    turma_id INT,
    data_matricula DATE,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(aluno_id),
    FOREIGN KEY (turma_id) REFERENCES Turma(turma_id)
);

CREATE TABLE Faltas (
    falta_id INT PRIMARY KEY,
    aluno_id INT,
    turma_id INT,
    data_falta DATE,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(aluno_id),
    FOREIGN KEY (turma_id) REFERENCES Turma(turma_id)
);

-- 2) Fazer consultas SQL que respondam as seguintes questões:
-- 2.1) Listar os dados dos alunos;
SELECT * FROM Aluno;

-- 2.2) Listar os dados dos alunos e as turmas que eles estão matriculados;
SELECT A.*, T.*
FROM Aluno A
JOIN Matricula M ON A.aluno_id = M.aluno_id
JOIN Turma T ON M.turma_id = T.turma_id;




-- 2.3) Listar os alunos que não possuem faltas;
SELECT *
FROM Aluno A
WHERE NOT EXISTS (
    SELECT 1
    FROM Faltas F
    WHERE A.aluno_id = F.aluno_id
);


-- 2.4) Listar os professores e a quantidade de turmas que cada um leciona;
SELECT 
    P.nome AS nome_professor,
    COUNT(T.turma_id) AS quantidade_turmas
FROM 
    Professor P
LEFT JOIN 
    Turma T ON P.professor_id = T.professor_id
GROUP BY 
    P.professor_id, P.nome;




-- 2.5) Listar nome dos professores, apenas um dos números de telefone do professor, dados
-- (id da turma, data início, data fim e horário) das turmas que o professor leciona, curso da
-- turma e alunos matriculados ordenado por nome do professor, id turma e nome do aluno;
SELECT P.nome, P.telefone, T.id_turma, T.data_inicial, T.data_final, T.horario_aula, T.tipo_curso, A.nome AS nome_aluno
FROM Professor P
JOIN Turma T ON P.cpf = T.cpf_professor
JOIN Matricula M ON T.id_turma = M.id_turma
JOIN Aluno A ON M.codigo_matricula = A.codigo_matricula
ORDER BY P.nome, T.id_turma, A.nome;



-- 2.6) Listar os nomes dos professores e a turma que cada um leciona com maior número de
-- alunos;
SELECT P.nome, T.*
FROM Professor P
JOIN Turma T ON P.cpf = T.cpf_professor
WHERE T.id_turma IN (
    SELECT id_turma
    FROM Turma
    WHERE cpf_professor = P.cpf
    ORDER BY quantidade_alunos DESC
    LIMIT 1
);



-- 2.7) Listar os nomes dos alunos ordenados pela turma que estes possuem maior número de
-- faltas. Deve aparecer apenas a turma que cada um dos alunos tem maior quantidade de
-- faltas;
SELECT A.nome AS nome_aluno, T.*
FROM Aluno A
JOIN Matricula M ON A.codigo_matricula = M.codigo_matricula
JOIN Turma T ON M.id_turma = T.id_turma
WHERE M.id_turma IN (
    SELECT id_turma
    FROM Matricula
    WHERE codigo_matricula = A.codigo_matricula
    ORDER BY ausencias DESC
    LIMIT 1
);


-- 2.8) Listar a quantidade média de alunos por curso.
SELECT tipo_curso, AVG(quantidade_alunos) AS media_alunos
FROM Turma
GROUP BY tipo_curso;



-- 3) Fazer alterações nas tabelas:
-- 3.1) Alterar o nome de todos os professores para maiúsculo;
UPDATE Professor
SET nome = UPPER(nome);


-- 3.2) Colocar o nome de todos os alunos que estão na turma com o maior número de alunos
-- em maiúsculo;
UPDATE Aluno
SET nome = UPPER(nome)
WHERE codigo_matricula IN (
    SELECT M.codigo_matricula
    FROM Matricula M
    JOIN (
        SELECT id_turma
        FROM Turma
        ORDER BY quantidade_alunos DESC
        LIMIT 1
    ) T ON M.id_turma = T.id_turma
);


-- 4) Excluir as ausências dos alunos nas turmas que estes são monitores;

DELETE FROM Matricula
WHERE codigo_matricula IN (
    SELECT codigo_matricula
    FROM Monitor
);


CREATE database exercicio4;

use exercicio4;

CREATE TABLE Turma (
    id_turma INT PRIMARY KEY,
    codigo_disciplina INT,
    sigla_turma VARCHAR(10),
    ano_semestre INT
);

CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY,
    nome_aluno VARCHAR(100)
);

CREATE TABLE Prova (
    id_prova INT PRIMARY KEY,
    nome_prova VARCHAR(100)
);

CREATE TABLE Notas (
    id_notas INT PRIMARY KEY,
    id_aluno INT,
    id_turma INT,
    id_prova INT,
    nota FLOAT,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma),
    FOREIGN KEY (id_prova) REFERENCES Prova(id_prova)
);

-- Inserir dados na tabela Turma
INSERT INTO Turma (id_turma, codigo_disciplina, sigla_turma, ano_semestre) VALUES
(1, 101, 'A', 2023),
(2, 102, 'B', 2023),
(3, 103, 'C', 2024),
(4, 104, 'D', 2024);

-- Inserir dados na tabela Aluno
INSERT INTO Aluno (id_aluno, nome_aluno) VALUES
(1, 'João'),
(2, 'Maria'),
(3, 'Pedro'),
(4, 'Ana');

-- Inserir dados na tabela Prova
INSERT INTO Prova (id_prova, nome_prova) VALUES
(1, 'Prova 1'),
(2, 'Prova 2'),
(3, 'Prova Final');

-- Inserir dados na tabela Notas
INSERT INTO Notas (id_notas, id_aluno, id_turma, id_prova, nota) VALUES
(1, 1, 1, 1, 8.5),
(2, 1, 1, 2, 7.0),
(3, 1, 1, 3, 8.0),
(4, 2, 2, 1, 7.0),
(5, 2, 2, 2, 6.5),
(6, 2, 2, 3, 7.5),
(7, 3, 3, 1, 9.0),
(8, 3, 3, 2, 8.5),
(9, 3, 3, 3, 9.0),
(10, 4, 4, 1, 6.5),
(11, 4, 4, 2, 8.0),
(12, 4, 4, 3, 7.0);







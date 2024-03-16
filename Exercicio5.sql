CREATE database exercicio5;

use exercicio5;

CREATE TABLE Professor (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    titulacao VARCHAR(50),
    telefone VARCHAR(20)
);

CREATE TABLE Turma (
    id_turma INT PRIMARY KEY,
    quantidade_alunos INT,
    horario_aula TIME,
    data_inicial DATE,
    data_final DATE,
    tipo_curso VARCHAR(50),
    cpf_professor VARCHAR(11),
    FOREIGN KEY (cpf_professor) REFERENCES Professor(cpf)
);

CREATE TABLE Aluno (
    codigo_matricula INT PRIMARY KEY,
    data_matricula DATE,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    data_nascimento DATE,
    altura FLOAT,
    peso FLOAT
);

CREATE TABLE Matricula (
    codigo_matricula INT,
    id_turma INT,
    ausencias INT,
    PRIMARY KEY (codigo_matricula, id_turma),
    FOREIGN KEY (codigo_matricula) REFERENCES Aluno(codigo_matricula),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);

CREATE TABLE Monitor (
    codigo_matricula INT PRIMARY KEY,
    id_turma INT,
    FOREIGN KEY (codigo_matricula) REFERENCES Aluno(codigo_matricula),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);









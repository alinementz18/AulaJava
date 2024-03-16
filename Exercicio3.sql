CREATE database exercicio3;

use exercicio3;




CREATE TABLE DEPARTAMENTO (
    nrdep INT PRIMARY KEY,
    nomedep VARCHAR(100),
    idgerente INT,
    horario VARCHAR(50)
);

CREATE TABLE EMPREGADO (
    idemp INT PRIMARY KEY,
    nomeemp VARCHAR(100),
    aniversario DATE,
    enderecoemp VARCHAR(255),
    sexoemp CHAR(1),
    salarioemp DECIMAL(10, 2),
    nrdep INT,
    FOREIGN KEY (nrdep) REFERENCES DEPARTAMENTO(nrdep)
);

CREATE TABLE LOCALIZACAO (
    localizacao VARCHAR(100) PRIMARY KEY,
    nrdep INT,
    FOREIGN KEY (nrdep) REFERENCES DEPARTAMENTO(nrdep)
);

CREATE TABLE TRABALHA_EM (
    idemp INT,
    nrprojeto INT,
    horas INT,
    PRIMARY KEY (idemp, nrprojeto),
    FOREIGN KEY (idemp) REFERENCES EMPREGADO(idemp)
);

CREATE TABLE PROJETO (
    nrproj INT PRIMARY KEY,
    nomeproj VARCHAR(100),
    nrdep INT,
    FOREIGN KEY (nrdep) REFERENCES DEPARTAMENTO(nrdep)
);

CREATE TABLE DEPENDENTE (
    iddepende INT PRIMARY KEY,
    idemp INT,
    nomedep VARCHAR(100),
    sexodep CHAR(1),
    aniversariodep DATE,
    parentesco VARCHAR(50),
    FOREIGN KEY (idemp) REFERENCES EMPREGADO(idemp)
);


INSERT INTO DEPARTAMENTO (nrdep, nomedep, idgerente, horario) VALUES
(1, 'Compras', 101, '08:00-17:00'),
(2, 'Vendas', 102, '09:00-18:00');


INSERT INTO EMPREGADO (idemp, nomeemp, aniversario, enderecoemp, sexoemp, salarioemp, nrdep) VALUES
(1, 'João', '1990-05-15', 'Rua A, 123', 'M', 3000.00, 1),
(2, 'Maria', '1995-10-20', 'Rua B, 456', 'F', 2800.00, 2),
(3, 'Carlos', '1988-03-28', 'Rua C, 789', 'M', 3500.00, 1),
(4, 'Ana', '1992-07-12', 'Rua D, 1011', 'F', 3200.00, 2);


INSERT INTO LOCALIZACAO (localizacao, nrdep) VALUES
('São Paulo', 1),
('Rio de Janeiro', 2);


INSERT INTO TRABALHA_EM (idemp, nrprojeto, horas) VALUES
(1, 1001, 40),
(2, 1002, 35),
(3, 1003, 45),
(4, 1001, 38);


INSERT INTO PROJETO (nrproj, nomeproj, nrdep) VALUES
(1001, 'Projeto A', 1),
(1002, 'Projeto B', 2),
(1003, 'Projeto C', 1);


INSERT INTO DEPENDENTE (iddepende, idemp, nomedep, sexodep, aniversariodep, parentesco) VALUES
(101, 1, 'Pedro', 'M', '2000-01-10', 'Filho'),
(102, 2, 'Luiza', 'F', '1998-05-20', 'Filha'),
(103, 3, 'Paulo', 'M', '2005-03-15', 'Filho'),
(104, 4, 'Carla', 'F', '2002-11-30', 'Filha');


-- 1. Recuperar o nome e o endereço de todos os empregados que trabalham para o
-- Departamento de Compras.

SELECT E.nomeemp, E.enderecoemp
FROM EMPREGADO E
JOIN DEPARTAMENTO D ON E.nrdep = D.nrdep
WHERE D.nomedep = 'Compras';



-- 2. Para cada projeto localizado no ‘Rio de Janeiro’, exibir o número do projeto, o número do
-- departamento que o controla e a identidade de seu gerente, seu endereço e a data de seu
-- aniversário.

SELECT P.nrproj, P.nrdep, D.idgerente, E.enderecoemp, E.aniversario
FROM PROJETO P
JOIN DEPARTAMENTO D ON P.nrdep = D.nrdep
JOIN LOCALIZACAO L ON D.nrdep = L.nrdep
JOIN EMPREGADO E ON D.idgerente = E.idemp
WHERE L.localizacao = 'Rio de Janeiro';




-- 3. Descobrir os nomes dos projetos onde trabalham empregados com o nome ‘João’
SELECT DISTINCT PR.nomeproj
FROM PROJETO PR
JOIN TRABALHA_EM TE ON PR.nrproj = TE.nrprojeto
JOIN EMPREGADO EM ON TE.idemp = EM.idemp
WHERE EM.nomeemp = 'João';





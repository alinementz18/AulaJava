CREATE database exercicio1;

use exercicio1;

CREATE TABLE VENDEDOR (
    nrvendedor INT PRIMARY KEY,
    nomevendedor VARCHAR(100),
    idade INT,
    salario DECIMAL(10, 2)
);

CREATE TABLE CLIENTE (
    nrcliente INT PRIMARY KEY,
    nomecliente VARCHAR(100),
    cidade VARCHAR(100),
    tipo VARCHAR(50)
);

CREATE TABLE PEDIDO (
    nr_pedido INT PRIMARY KEY,
    nrvendedor INT,
    nrcliente INT,
    quantidade_itens INT,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (nrvendedor) REFERENCES VENDEDOR(nrvendedor),
    FOREIGN KEY (nrcliente) REFERENCES CLIENTE(nrcliente)
);


INSERT INTO VENDEDOR (nrvendedor, nomevendedor, idade, salario) VALUES
(1, 'João', 35, 3000.00),
(2, 'Maria', 28, 2500.00),
(3, 'Carlos', 40, 3500.00),
(4, 'Ana', 32, 2800.00);


INSERT INTO CLIENTE (nrcliente, nomecliente, cidade, tipo) VALUES
(1, 'Empresa A', 'São Paulo', 'INDÚSTRIA'),
(2, 'Empresa B', 'Rio de Janeiro', 'COMÉRCIO'),
(3, 'Empresa C', 'Belo Horizonte', 'INDÚSTRIA'),
(4, 'Empresa D', 'Curitiba', 'SERVIÇOS');


INSERT INTO PEDIDO (nr_pedido, nrvendedor, nrcliente, quantidade_itens, valor_total) VALUES
(1, 1, 1, 10, 500.00),
(2, 2, 2, 5, 250.00),
(3, 3, 1, 8, 400.00),
(4, 4, 3, 12, 600.00);



-- 1. Quais os nomes de todos os vendedores?

SELECT nomevendedor 
FROM VENDEDOR;

-- 2. Quais os números dos vendedores que realizaram algum pedido?

SELECT V.nrvendedor
FROM VENDEDOR V
LEFT JOIN PEDIDO P ON V.nrvendedor = P.nrvendedor;


-- 3. Quais os números dos vendedores que não realizaram algum pedido?

SELECT V.nrvendedor
FROM VENDEDOR V
LEFT JOIN PEDIDO P ON V.nrvendedor = P.nrvendedor
WHERE P.nrvendedor IS NULL;

-- 4. Quais os nomes dos vendedores que realizaram pedido para clientes do tipo
-- “INDÚSTRIA”?

SELECT V.nomevendedor
FROM VENDEDOR V
JOIN PEDIDO P ON V.nrvendedor = P.nrvendedor
JOIN CLIENTE C ON P.nrcliente = C.nrcliente
WHERE C.tipo = 'INDÚSTRIA';



-- 5. Qual o tipo do cliente que foram atendidos (realizaram pedido) com o vendedor “JOÃO”?

SELECT DISTINCT C.tipo
FROM CLIENTE C
JOIN PEDIDO P ON C.nrcliente = P.nrcliente
JOIN VENDEDOR V ON P.nrvendedor = V.nrvendedor
WHERE V.nomevendedor = 'JOÃO';



-- 6. Quais os nomes e tipos dos clientes com pedidos acima de 5000 reais?

SELECT C.nomecliente, C.tipo
FROM CLIENTE C
JOIN PEDIDO P ON C.nrcliente = P.nrcliente
WHERE P.valor_total > 5000;
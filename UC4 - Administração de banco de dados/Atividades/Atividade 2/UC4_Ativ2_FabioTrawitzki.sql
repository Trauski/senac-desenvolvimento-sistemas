/* ATIVIDADE 2 - NORMALIZAÇÃO */
SET SQL_SAFE_UPDATES = 0;
DROP DATABASE IF EXISTS atividade3;
CREATE DATABASE atividade3;
USE atividade3;

/* CRIAÇÃO DA TABELA 1 */
CREATE TABLE cliente (
	idCliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

/* INSERÇÃO DE DADOS DA TABELA 1 */
INSERT INTO cliente (nome, endereco, telefone) VALUES
('Maria Silva', 'Rua das Flores 123', '(11) 98765-4321'),
('João Santos', 'Avenida Paulista 1000', '(21) 91234-5678'),
('Ana Oliveira', 'Rua do Carmo 45', '(51) 93456-7890'),
('Carlos Souza', 'Rua das Palmeiras 555', '(55) 95678-1234'),
('Mariana Costa', 'Avenida Brasil 200', '(81) 99876-5432');

/* CRIAÇÃO DA TABELA 2 */
CREATE TABLE locacao (
	idLocacao INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idCliente INT, 
    idFilme INT,
    tituloFilme VARCHAR(100),
    devolucao DATE,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

/* INSERÇÃO DE DADOS DA TABELA 2 */
INSERT INTO locacao (tituloFilme, devolucao) VALUES 
('O Poderoso Chefão', '2024-11-01'),
('Interestelar', '2024-11-05'),
('A Origem', '2024-11-08'),
('O Senhor dos Anéis: A Sociedade do Anel', '2024-11-10'),
('Matrix', '2024-11-12');

/* ==================================================================== */

/* CRIE AS NORMALIZAÇÕES LOGO ABAIXO */
/* 1FN: tabela cliente
   As colunas 'endereco' e 'telefone' estão diretamente na tabela
   cliente, mas um cliente pode ter múltiplos endereços e telefones.
   Armazenar esses dados na tabela cliente causaria redundância de dados.
   Solução: criar tabelas separadas para endereco e telefone, vinculadas
   ao cliente pela chave estrangeira.
/* ==================================================================== */
-- Criando a tabela endereco com chave estrangeira para cliente
CREATE TABLE endereco (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    endereco VARCHAR(100),
    bairro VARCHAR(100),
    idCliente INT,
    CONSTRAINT fk_endereco_cliente FOREIGN KEY (idCliente)
        REFERENCES cliente(idCliente)
);
-- Migrando os dados de endereco da tabela cliente para a nova tabela
-- O bairro não existia na tabela original, então fica NULL
INSERT INTO endereco (endereco, idCliente)
SELECT endereco, idCliente FROM cliente;
 
-- Removendo a coluna endereco da tabela cliente para evitar duplicidade
ALTER TABLE cliente DROP COLUMN endereco;
 
-- Criando a tabela telefone com chave estrangeira para cliente
CREATE TABLE telefone (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    telefone VARCHAR(100),
    idCliente INT,
    CONSTRAINT fk_telefone_cliente FOREIGN KEY (idCliente)
        REFERENCES cliente(idCliente)
);
 
-- Migrando os dados de telefone da tabela cliente para a nova tabela
INSERT INTO telefone (telefone, idCliente)
SELECT telefone, idCliente FROM cliente;
 
-- Removendo a coluna telefone da tabela cliente para evitar duplicidade
ALTER TABLE cliente DROP COLUMN telefone;
 
/* ==================================================================== */
/* 2FN: tabela locacao
   A coluna 'tituloFilme' depende apenas de 'idFilme' e não
   da locação em si. Se o mesmo filme aparecer em várias locações,
   o título se repetiria, causando redundância.
   Solução: criar uma tabela separada para filme e referenciar
   por chave estrangeira em locacao.
/* ==================================================================== */
-- Criando a tabela filme
CREATE TABLE filme (
    idFilme INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    tituloFilme VARCHAR(100)
);
 
-- Migrando os títulos da tabela locacao para a nova tabela filme, sem duplicidade
INSERT INTO filme (tituloFilme)
SELECT DISTINCT tituloFilme FROM locacao;

-- Atualizando o idFilme em locacao com base no título correspondente
UPDATE locacao l
JOIN filme f ON l.tituloFilme = f.tituloFilme
SET l.idFilme = f.idFilme;
 
-- Adicionando a chave estrangeira em locacao apontando para filme
ALTER TABLE locacao
    ADD CONSTRAINT fk_locacao_filme FOREIGN KEY (idFilme)
        REFERENCES filme(idFilme);
 
-- Removendo a coluna tituloFilme da tabela locacao para evitar duplicidade
ALTER TABLE locacao DROP COLUMN tituloFilme;
 
/* ==================================================================== */
/* VERIFICAÇÃO FINAL - Exibindo as tabelas normalizadas                  */
/* ==================================================================== */
 
SELECT * FROM cliente;
SELECT * FROM endereco;
SELECT * FROM telefone;
SELECT * FROM filme;
SELECT * FROM locacao;
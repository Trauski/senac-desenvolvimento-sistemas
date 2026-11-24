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
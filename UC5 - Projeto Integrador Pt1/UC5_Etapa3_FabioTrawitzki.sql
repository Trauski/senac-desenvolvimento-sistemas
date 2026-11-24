-- ============================================================
-- Fábio Trawitzki
-- UC5 - PROJETO INTEGRADOR - TERMCHECK
-- Etapa 3: Criação, Povoamento, Exibição, Edição e Exclusão
-- ============================================================
-- 1. CRIAÇÃO DO BANCO DE DADOS
-- ============================================================
DROP DATABASE IF EXISTS TermCheck;
CREATE DATABASE TermCheck;
USE TermCheck;

-- ============================================================
-- 2. CRIAÇÃO DAS TABELAS
-- ============================================================
-- Tabela Regiao
-- Armazena os perfis regulatórios cadastrados no sistema
CREATE TABLE Regiao (
    idRegiao    INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome        VARCHAR(100) NOT NULL,
    pais        VARCHAR(45) NOT NULL,
    descricao   TEXT
);

-- Tabela TermoBanido
-- Armazena os termos proibidos vinculados a uma região
CREATE TABLE TermoBanido (
    idTermo          INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    termo            VARCHAR(100) NOT NULL,
    descricao        TEXT,
    Regiao_idRegiao  INT NOT NULL,
    CONSTRAINT fk_termo_regiao FOREIGN KEY (Regiao_idRegiao)
        REFERENCES Regiao (idRegiao)
);

-- Tabela Sugestao
-- Armazena as sugestões de substituição para cada termo banido
CREATE TABLE Sugestao (
    idSugestao           INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    sugestao             VARCHAR(100) NOT NULL,
    TermoBanido_idTermo  INT NOT NULL,
    CONSTRAINT fk_sugestao_termo FOREIGN KEY (TermoBanido_idTermo)
        REFERENCES TermoBanido (idTermo)
);
 
-- Tabela Usuario
-- Armazena os usuários e seus níveis de acesso
CREATE TABLE Usuario (
    idUsuario    INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome         VARCHAR(100) NOT NULL,
    nivelAcesso  ENUM('Administrador', 'Tradutor') NOT NULL
);
 
-- Tabela Historico
-- Armazena o registro de varreduras realizadas pelos usuários
CREATE TABLE Historico (
    idHistorico       INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    textoValidado     TEXT,
    dataVarredura     DATETIME NOT NULL,
    Usuario_idUsuario INT NOT NULL,
    Regiao_idRegiao   INT NOT NULL,
    CONSTRAINT fk_historico_usuario FOREIGN KEY (Usuario_idUsuario)
        REFERENCES Usuario (idUsuario),
    CONSTRAINT fk_historico_regiao FOREIGN KEY (Regiao_idRegiao)
        REFERENCES Regiao (idRegiao)
);
 
-- ============================================================
-- 3. INSERÇÃO DE DADOS
-- ============================================================
 
-- Inserindo Regioes
INSERT INTO Regiao (nome, pais, descricao) VALUES
('Brasil - Criptoativos',       'Brasil',   'Regulação do Banco Central sobre terminologia de ativos digitais'),
('Portugal - Setor Bancário',   'Portugal', 'Normas do Banco de Portugal para comunicação financeira'),
('EUA - Mercado de Capitais',   'EUA',      'Diretrizes da SEC para comunicações com investidores'),
('Brasil - Publicidade',        'Brasil',   'Normas do CONAR sobre termos proibidos em publicidade'),
('União Europeia - GDPR',       'UE',       'Regulamento europeu de proteção de dados pessoais');
 
-- Inserindo Termos Banidos
INSERT INTO TermoBanido (termo, descricao, Regiao_idRegiao) VALUES
('moeda digital',       'Termo impreciso para criptoativos segundo o Banco Central',        1),
('investimento seguro', 'Proibido garantir segurança em investimentos de risco',            1),
('depósito bancário',   'Criptoativos não são equiparados a depósitos bancários',           1),
('juro garantido',      'Proibido garantir rendimento em produtos bancários em Portugal',   2),
('capital protegido',   'Uso restrito — exige aprovação regulatória prévia em Portugal',    2),
('retorno garantido',   'SEC proíbe garantias de retorno em comunicações ao investidor',    3),
('oportunidade única',  'Caracteriza apelo enganoso segundo o CONAR',                       4),
('dados pessoais',      'Deve ser substituído por linguagem técnica conforme GDPR',         5);
 
-- Inserindo Sugestões
INSERT INTO Sugestao (sugestao, TermoBanido_idTermo) VALUES
('criptoativo',             1),
('ativo virtual',           1),
('produto de investimento', 2),
('aplicação financeira',    2),
('ativo digital',           3),
('rentabilidade estimada',  4),
('capital variável',        5),
('projeção de retorno',     6),
('oferta especial',         7),
('dados do titular',        8),
('informações pessoais',    8);
 
-- Inserindo Usuários
INSERT INTO Usuario (nome, nivelAcesso) VALUES
('Fábio Trawitzki',    'Administrador'),
('Ana Lima',           'Tradutor'),
('Carlos Mendes',      'Tradutor'),
('Prof Vini',     'Administrador'),
('Roberto Alves',      'Tradutor');
 
-- Inserindo Histórico de Varreduras
INSERT INTO Historico (textoValidado, dataVarredura, Usuario_idUsuario, Regiao_idRegiao) VALUES
('Texto sobre investimento em moeda digital no Brasil.',        '2025-01-10 09:00:00', 1, 1),
('Comunicado bancário com menção a juro garantido.',            '2025-01-15 14:30:00', 2, 2),
('Relatório para SEC sobre retorno garantido de fundos.',       '2025-02-01 10:00:00', 3, 3),
('Peça publicitária com oportunidade única de investimento.',   '2026-02-10 16:00:00', 4, 4),
('Política de privacidade com referências a dados pessoais.',   '2026-03-05 11:30:00', 5, 5);
 
-- ============================================================
-- 4. EXIBIÇÃO DOS DADOS
-- ============================================================
 
-- Exibindo todos os registros de cada tabela
SELECT * FROM Regiao;
SELECT * FROM TermoBanido;
SELECT * FROM Sugestao;
SELECT * FROM Usuario;
SELECT * FROM Historico;
 
-- Buscas específicas com WHERE
-- Termos banidos da região Brasil - Criptoativos
SELECT tb.termo, tb.descricao
FROM TermoBanido tb
JOIN Regiao r ON tb.Regiao_idRegiao = r.idRegiao
WHERE r.nome = 'Brasil - Criptoativos';
 
-- Usuários com nível Tradutor
SELECT * FROM Usuario
WHERE nivelAcesso = 'Tradutor';
 
-- Histórico de varreduras realizadas em 2025
SELECT * FROM Historico
WHERE dataVarredura BETWEEN '2025-01-01' AND '2025-12-31';
 
-- Sugestões disponíveis para o termo 'moeda digital'
SELECT s.sugestao
FROM Sugestao s
JOIN TermoBanido tb ON s.TermoBanido_idTermo = tb.idTermo
WHERE tb.termo = 'moeda digital';
 
-- ============================================================
-- 5. EDIÇÃO DOS DADOS
-- ============================================================
 
SET SQL_SAFE_UPDATES = 0;
 
-- Atualizando a descrição de uma região
UPDATE Regiao
SET descricao = 'Regulação atualizada do Banco Central sobre terminologia de criptoativos em 2025'
WHERE idRegiao = 1;
 
-- Atualizando o termo banido para versão mais precisa
UPDATE TermoBanido
SET termo = 'moeda virtual'
WHERE idTermo = 1;
 
-- Atualizando uma sugestão
UPDATE Sugestao
SET sugestao = 'ativo criptográfico'
WHERE idSugestao = 1;
 
-- Atualizando o nível de acesso de um usuário
UPDATE Usuario
SET nivelAcesso = 'Administrador'
WHERE idUsuario = 2;
 
-- Atualizando o texto validado de um histórico
UPDATE Historico
SET textoValidado = 'Texto revisado sobre investimento em ativo virtual no Brasil.'
WHERE idHistorico = 1;
 
-- ============================================================
-- 6. EXCLUSÃO DOS DADOS
-- ============================================================
 
-- Removendo uma sugestão
DELETE FROM Sugestao
WHERE idSugestao = 11;
 
-- Removendo um histórico
DELETE FROM Historico
WHERE idHistorico = 5;
 
-- Removendo um usuário
-- (é necessário remover o histórico vinculado antes, por causa da FK)
DELETE FROM Historico
WHERE Usuario_idUsuario = 5;
DELETE FROM Usuario
WHERE idUsuario = 5;
 
-- Removendo um termo banido
-- (é necessário remover as sugestões vinculadas antes, por causa da FK)
DELETE FROM Sugestao
WHERE TermoBanido_idTermo = 8;
DELETE FROM TermoBanido
WHERE idTermo = 8;
 
-- Removendo uma região
-- (é necessário remover os termos e históricos vinculados antes, por causa da FK)
DELETE FROM Historico
WHERE Regiao_idRegiao = 5;
DELETE FROM TermoBanido
WHERE Regiao_idRegiao = 5;
DELETE FROM Regiao
WHERE idRegiao = 5;
 
-- ============================================================
-- VERIFICAÇÃO FINAL
-- ============================================================
 
SELECT * FROM Regiao;
SELECT * FROM TermoBanido;
SELECT * FROM Sugestao;
SELECT * FROM Usuario;
SELECT * FROM Historico;
-- ==========================================================
-- SCRIPT DE CONFIGURAÇÃO DO BANCO DE DADOS - SENAC EAD
-- Unidade Curricular: UC03 (Banco de Dados)
-- Tutor: Vinícius Silva da Cruz
-- ==========================================================

/* 
   INSTRUÇÕES PARA O ALUNO:
   1. Abra o MySQL Workbench.
   2. Clique em 'File' > 'Open SQL Script...' e selecione este arquivo.
   3. Clique no ícone do 'Raio' para executar tudo.
   4. Após a execução, clique no botão de 'Refresh' na aba 'Schemas' 
      para ver o banco 'uc03_tds_senac'.
*/

-- 1. CRIANDO O BANCO DE DADOS
-- O comando 'IF NOT EXISTS' evita erro caso o banco já tenha sido criado.
CREATE DATABASE IF NOT EXISTS uc03_tds_senac;

-- 2. SELECIONANDO O BANCO PARA USO
-- Informa ao MySQL que os próximos comandos devem ser executados dentro deste banco.
USE uc03_tds_senac;

-- 3. CRIAÇÃO DAS TABELAS (ESTRUTURA/DDL)

-- Tabela de Cursos (Relacionamento 1:N com Alunos)
CREATE TABLE IF NOT EXISTS curso (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único e automático
    nome VARCHAR(100) NOT NULL,        -- Nome do curso (obrigatório)
    descricao TEXT,                    -- Descrição longa do curso
    status CHAR(1) DEFAULT 'A'         -- 'A' para Ativo, 'I' para Inativo (Preservação de Dados)
) ENGINE=InnoDB;

-- Tabela de Professores
CREATE TABLE IF NOT EXISTS professor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100)
) ENGINE=InnoDB;

-- Tabela de Disciplinas (Relacionamento 1:N com Professores)
CREATE TABLE IF NOT EXISTS disciplina (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    professor_id INT,
    -- Chave Estrangeira: Se o professor for deletado, o campo fica NULL (SET NULL)
    FOREIGN KEY (professor_id) REFERENCES professor(id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Tabela de Alunos (Relacionamento 1:N com Cursos)
CREATE TABLE IF NOT EXISTS aluno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50),
    data_nascimento DATE,
    curso_id INT,
    status CHAR(1) DEFAULT 'A',
    -- Chave Estrangeira: Se o curso for deletado, os alunos também são removidos (CASCADE)
    FOREIGN KEY (curso_id) REFERENCES curso(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Tabela de Matrículas (Relacionamento N:M entre Alunos e Disciplinas)
-- -------------------------------------------------------------------------
-- EXPLICAÇÃO PARA O ALUNO:
-- Esta é uma "Tabela Associativa" ou "Tabela de Ligação".
-- Ela é necessária porque um Aluno pode ter várias Disciplinas e vice-versa.
-- -------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS matricula (
    aluno_id INT,
    disciplina_id INT,
    data_matricula TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- CHAVE PRIMÁRIA COMPOSTA: 
    -- Garante que o MESMO aluno não seja matriculado DUAS VEZES na MESMA disciplina.
    PRIMARY KEY (aluno_id, disciplina_id), 
    
    -- ON DELETE CASCADE (Efeito Cascata):
    -- Se você deletar um Aluno, o MySQL removerá AUTOMATICAMENTE todas as 
    -- matrículas ligadas a ele aqui. Isso evita "dados órfãos" no banco.
    FOREIGN KEY (aluno_id) REFERENCES aluno(id) ON DELETE CASCADE,
    
    -- O mesmo vale para a Disciplina: se ela deixar de existir, a matrícula some.
    FOREIGN KEY (disciplina_id) REFERENCES disciplina(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 4. POPULANDO O BANCO (DADOS INICIAIS/DML)

-- Inserindo Cursos
INSERT INTO curso (nome, descricao) VALUES 
('Técnico em Desenvolvimento de Sistemas', 'Focado em programação e banco de dados.'),
('Técnico em Informática para Internet', 'Criação de sites e aplicações web.');

-- Inserindo Professores
INSERT INTO professor (nome, especialidade) VALUES 
('João Silva', 'Banco de Dados Relacional'),
('Maria Oliveira', 'Lógica de Programação');

-- Inserindo Disciplinas
INSERT INTO disciplina (nome, carga_horaria, professor_id) VALUES 
('Modelagem de Dados', 40, 1),
('SQL Avançado', 60, 1),
('Algoritmos', 80, 2);

-- Inserindo Alunos
INSERT INTO aluno (nome, sobrenome, data_nascimento, curso_id) VALUES 
('Carlos', 'Ferreira', '2000-05-15', 1),
('Ana', 'Souza', '2002-11-20', 1),
('Pedro', 'Lima', '1999-02-10', 2);

-- Realizando Matrículas (Alunos em Disciplinas)
INSERT INTO matricula (aluno_id, disciplina_id) VALUES 
(1, 1), -- Carlos na disciplina de Modelagem
(1, 2), -- Carlos na disciplina de SQL
(2, 1), -- Ana na disciplina de Modelagem
(3, 3); -- Pedro na disciplina de Algoritmos

-- FIM DO SCRIPT
-- Você pode agora executar consultas como: SELECT * FROM aluno;

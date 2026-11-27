DROP DATABASE IF EXISTS kart;
CREATE DATABASE kart;
USE kart;
 
CREATE TABLE Temporada (
	idTemporada INT PRIMARY KEY AUTO_INCREMENT,
	numero INT NOT NULL
);

CREATE TABLE Etapa (
	idEtapa INT PRIMARY KEY AUTO_INCREMENT, 
	local VARCHAR(100) NOT NULL, 
	data DATE NOT NULL, 
	hora VARCHAR(45)
);

CREATE TABLE Piloto (
	idPiloto INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(150),
	peso FLOAT,
	capitao TINYINT,
	nacionalidade VARCHAR(45)
);

CREATE TABLE Patrocinio (
	idPatrocinio INT PRIMARY KEY AUTO_INCREMENT,
	nomePatrocinio VARCHAR(45)
);

CREATE TABLE Equipe (
	idEquipe INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100)
);

-- Adicionando FK de Temporada a Etapa (1:N)
ALTER TABLE Etapa
    ADD COLUMN Temporada_idTemporada INT NOT NULL,
    ADD CONSTRAINT fk_etapa_temporada FOREIGN KEY (Temporada_idTemporada)
        REFERENCES Temporada (idTemporada);
        
-- Adicionando FK de Patrocínio a Equipe (FK não obrigatória, 1:N)
ALTER TABLE Equipe
    ADD COLUMN patrocinio_idPatrocinio INT NULL,
    ADD CONSTRAINT fk_equipe_patrocinio FOREIGN KEY (patrocinio_idPatrocinio)
        REFERENCES Patrocinio (idPatrocinio);
        
-- Adicionando FK de Equipe a Piloto (1:N)
ALTER TABLE Piloto
    ADD COLUMN Equipe_idEquipe INT NOT NULL,
    ADD CONSTRAINT fk_piloto_equipe FOREIGN KEY (Equipe_idEquipe)
        REFERENCES Equipe (idEquipe);
        
-- Criando tabela de relacionamento (Etapas e Pilotos, N:N)
CREATE TABLE Etapa_has_Piloto (
    Etapa_idEtapa   INT NOT NULL,
    Piloto_idPiloto INT NOT NULL,
    PRIMARY KEY (Etapa_idEtapa, Piloto_idPiloto),
    CONSTRAINT fk_ehp_etapa  FOREIGN KEY (Etapa_idEtapa)  REFERENCES Etapa  (idEtapa),
    CONSTRAINT fk_ehp_piloto FOREIGN KEY (Piloto_idPiloto) REFERENCES Piloto (idPiloto)
    );
    
INSERT INTO Temporada (numero) VALUES (1);

-- Etapas da Temporada 1
INSERT INTO Etapa (local, data, hora, Temporada_idTemporada) VALUES
	('São Paulo',    '2024-01-15', '14:00', 1),
    ('Rio de Janeiro','2024-02-20', '16:00', 1),
    ('Campo Grande', '2024-03-18', '15:00', 1),
    ('Londrina',     '2024-04-22', '13:00', 1),
    ('Porto Alegre', '2024-05-10', '10:00', 1);
    
-- Patrocinadores
INSERT INTO Patrocinio (nomePatrocinio) VALUES
    ('MotorTech Brasil'),    -- id 1
    ('Velocidade Extrema'),  -- id 2
    ('Alta Performance'),    -- id 3
    ('Turbo Racing'),        -- id 4
    ('Pneus ProDrive');      -- id 5
    
-- Equipes
INSERT INTO Equipe (Nome, patrocinio_idPatrocinio) VALUES
    ('Escuderia Veloz',   1),  -- id 1
    ('Rápidos & Furiosos',2),  -- id 2
    ('Fênix Racing',      3),  -- id 3
    ('Equipe Tempestade', 4),  -- id 4
    ('Corredores de Aço', 5);  -- id 5
    
-- Pilotos  (capitao: 1 = sim, 0 = não)
INSERT INTO Piloto (Nome, peso, capitao, Equipe_idEquipe, nacionalidade) VALUES
    ('Lucas Andrade',   70.5, 1, 1, 'Brasil'),   -- id 1
    ('Renato Figueiredo',75.0, 0, 1, 'Brasil'),  -- id 2
    ('Mateus Silva',    68.0, 0, 2, 'Brasil'),   -- id 3
    ('Bruno Almeida',   78.3, 1, 2, 'Brasil'),   -- id 4
    ('Carla Pereira',   60.0, 1, 3, 'Portugal'), -- id 5
    ('Gabriela Torres', 58.5, 0, 3, 'Brasil'),   -- id 6
    ('João Costa',      80.5, 0, 4, 'Brasil'),   -- id 7
    ('Thiago Santos',   72.5, 0, 4, 'Brasil'),   -- id 8
    ('Mariana Gomes',   62.0, 1, 5, 'Portugal'), -- id 9
    ('Beatriz Lopes',   63.2, 1, 5, 'Portugal'); -- id 10
    
-- Participação na Etapa 1 (São Paulo) — Todos os pilotos
INSERT INTO Etapa_has_Piloto (Etapa_idEtapa, Piloto_idPiloto) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
    (1, 6), (1, 7), (1, 8), (1, 9), (1, 10);
    
SELECT * FROM Temporada;
SELECT * FROM Etapa;
select * from Equipe;
SELECT * FROM Patrocinio;
select * from Piloto;
SELECT Equipe.Nome AS Equipe, Patrocinio.nomePatrocinio AS Patrocinio FROM Equipe
LEFT JOIN Patrocinio ON Equipe.patrocinio_idPatrocinio = Patrocinio.idPatrocinio;

-- Alteração de locais das etapas
-- Campo Grande (id 3) -> Salvador
-- Londrina (id 4) -> Goiânia
-- OBS: Fiz a atelração por local, mas poderia ser "WHERE idEtapa = 3" (ou 4)
SET SQL_SAFE_UPDATES = 0;
UPDATE Etapa SET local = 'Salvador' WHERE local = 'Campo Grande';
UPDATE Etapa SET local = 'Goiânia' WHERE local = 'Londrina';

-- Remoção do patrocinador da equipe Corredores de Aço
-- Pneus ProDrive, idPatrocinio = 5
UPDATE Equipe SET patrocinio_idPatrocinio = NULL WHERE Nome = 'Corredores de Aço';
-- A atividade também pede para excluir o patrocinador da base de dados
DELETE FROM Patrocinio WHERE nomePatrocinio = 'Pneus ProDrive';

-- Por fim, é necessário exibir os dados dos pilotos.
-- Usei comandos para abreviação e formatação conforme conteúdos de consulta e manipulação de dados.
-- Adicionei também a coluna Patrocínio.
SELECT 
p.idPiloto 		AS ID,
p.Nome			AS Piloto,
p.peso 			AS 'Peso (Kg)',
p.capitao 		AS Capitão,
p.nacionalidade	AS Nacionalidade,
e.Nome 			AS Equipe,
pt.nomePatrocinio AS Patrocinador
FROM Piloto p
JOIN Equipe e ON p.Equipe_idEquipe = e.idEquipe
LEFT JOIN Patrocinio pt ON e.patrocinio_idPatrocinio = pt.idPatrocinio;
CREATE DATABASE Eventos;
USE Eventos;
CREATE TABLE participantes(
    idParticipante INT (9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200),
    dt_nasc DATE,
    genero VARCHAR(2),
    logradouro VARCHAR(200),
    bairro VARCHAR(200),
    cidade VARCHAR(200),
    complemento VARCHAR(200),
    uf VARCHAR(2),
    cep VARCHAR(200),
    comunidade VARCHAR(200),
    participa VARCHAR(1),
    movimento VARCHAR(1),
    escola VARCHAR(200),
    sabendo VARCHAR(200)
);

INSERT INTO participantes(
    nome, dt_nasc, genero, logradouro, bairro, cidade, complemento, uf, cep, 
    comunidade, participa, movimento, escola, sabendo
) VALUES (
    "Amanda", "2000-10-10", "F", "Rua das Andradas", "Centro", "Porto Alegre", "Final da rua",
    "RS", "911111000", "Do bairro", "S", "S", "Dom Francisco", "Internet"),
    ("Ricardo", "2000-10-10", "M", "Rua das Nereidas", "Centro", "Porto Alegre", "Bloco C",
    "RS", "911000000", "Do bairro", "S", "S", "João XXIII", "Internet"),
    ("Amadeu", "2010-05-20", "M", "Rua Gal Osório", "Porto", "Porto Alegre", "Bloco C",
    "RS", "911009999", "Do bairro", "N", "N", "João XXIII", "Revista"),
    ("Teobaldo", "1995-05-01", "M", "Rua Félix da Cunha", "Partenon", "Porto Alegre", "Casa 2",
    "RS", "900009999", "Do bairro", "N", "N", "Dohms", "Jornal"),
    ("Cremilda", "1980-05-01", "F", "Rua Silvério Souto", "Teresópolis", "Porto Alegre", "Casa 2",
    "RS", "946309999", "Do bairro", "N", "N", "Padre Pio", "Internet"
);
Select * from participantes;
CREATE VIEW view_participante AS SELECT * FROM participantes;
SHOW TABLES;
SELECT * FROM VIEW_PARTICIPANTE;
CREATE VIEW view_participante2 AS SELECT nome, cidade, escola FROM participantes;
SELECT * FROM VIEW_PARTICIPANTE2;
SELECT nome FROM view_participante2;
SELECT * FROM VIEW_PARTICIPANTE WHERE complemento = 'Casa 2';

-- Active: 1720829133941@@127.0.0.1@3306@kk
CREATE DATABASE interstellarinsight 
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE interstellarinsight;
CREATE TABLE TBL_CORPO_CELESTE (
    ID_CorpoCeleste INT PRIMARY KEY,
    Nome VARCHAR(255)
);
INSERT INTO TBL_CORPO_CELESTE (ID_CorpoCeleste, Nome) VALUES
(1, 'Mercúrio'),
(2, 'Vênus'),
(3, 'Terra'),
(4, 'Marte'),
(5, 'Júpiter'),
(6, 'Saturno'),
(7, 'Nebulosa de Emissão'),
(8, 'Nebulosa de Reflexão'),
(9, 'Cometa Halley'),
(10, 'Cometa Hale-Bopp'),
(11, 'Alpha Centauri A'),
(12, 'Alpha Centauri B'),
(13, 'Sirius'),
(14, 'Procyon');
-- TABELA_PLANETAS
CREATE TABLE TBL_PLANETAS (
    ID_CorpoCeleste INT,
    Distância VARCHAR(255),
    Tamanho VARCHAR(255),
    Composição VARCHAR(255),
    Atmosfera VARCHAR(255),
    Características_Geológicas TEXT,
    PRIMARY KEY (ID_CorpoCeleste),
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste)
);

INSERT INTO TBL_PLANETAS (ID_CorpoCeleste, Distância, Tamanho, Composição, Atmosfera, Características_Geológicas) VALUES
(1, '57.91 milhões km do Sol', '4.880 km', 'Rochoso', 'Não possui atmosfera significativa', 'Superfície com crateras e planícies'),
(2, '108 milhões km do Sol', '12.104 km', 'Rochoso', 'Dióxido de carbono', 'Vulcões, planícies e montanhas'),
(3, '149.6 milhões km do Sol', '12.742 km', 'Rochoso', 'Oxigênio e nitrogênio', 'Oceanos, continentes e montanhas'),
(4, '227.9 milhões km do Sol', '6.779 km', 'Rochoso', 'Carbono dióxido', 'Desertos e calotas polares'),
(5, '778.5 milhões km do Sol', '139.820 km', 'Gasoso', 'Hidrogênio e hélio', 'Sistema de anéis e luas'),
(6, '1.427 bilhões km do Sol', '116.460 km', 'Gasoso', 'Hidrogênio e hélio', 'Anéis complexos e luas grandes');


-- TABELA_COMETAS
CREATE TABLE TBL_COMETAS (
    ID_CorpoCeleste INT PRIMARY KEY,
    Órbita VARCHAR(255),
    Tipodecoma TEXT,
    Posição TEXT,
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste)
);
INSERT INTO TBL_COMETAS (ID_CorpoCeleste, Órbita, Tipodecoma, Posição) VALUES
(9, 'Elíptica', 'Nuvem de poeira e gases', 'Período de 76 anos');
INSERT INTO TBL_COMETAS (ID_CorpoCeleste, Órbita, Tipodecoma, Posição) VALUES
(10, 'Elíptica', 'Coma de água e poeira', 'Período de 2000 anos');

-- TABELA_ESTRELAS
CREATE TABLE TBL_ESTRELAS (
    ID_CorpoCeleste INT PRIMARY KEY,
    Distância DECIMAL(5,2),
    Sistema VARCHAR(255),
    Tamanho DECIMAL(5,3),
    Composição VARCHAR(255),
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste)
);
INSERT INTO TBL_ESTRELAS (ID_CorpoCeleste, Distância, Sistema, Tamanho, Composição) VALUES
(11, '4.37 ', 'Alpha Centauri', 1.223, 'Hidrogênio e hélio'),
(12, '4.37 ', 'Alpha Centauri', 0.863, 'Hidrogênio e hélio'),
(13, '8.61 ', 'Sirius', 1.711, 'Hidrogênio e hélio'),
(14, '25.8', 'Procyon', 1.52, 'Hidrogênio e hélio');


-- TABELA_NEBULOSA
CREATE TABLE TBL_NEBULOSA (
    ID_CorpoCeleste INT PRIMARY KEY,
    Tipo VARCHAR(255),
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste)
);
INSERT INTO TBL_NEBULOSA (ID_CorpoCeleste, Tipo) VALUES
(7, 'Nebulosa de Emissão'),
(8, 'Nebulosa de Reflexão');

-- TABELA_SONDAS
CREATE TABLE TBL_SONDAS (
    ID_Sonda INT PRIMARY KEY,
    Nome VARCHAR(255),
    Status VARCHAR(255)
);
INSERT INTO TBL_SONDAS (ID_Sonda, Nome, Status) VALUES
(1, 'Voyager 1', 'Ativa'),
(2, 'New Horizons', 'Ativa'),
(3, 'Pioneer 10', 'Desativada'),
(4, 'Pioneer 11', 'Desativada'),
(5, 'Voyager 2', 'Ativa'),
(6, 'Juno', 'Ativa'),
(7, 'Cassini', 'Desativada'),
(8, 'Hubble', 'Ativa');

-- TABELA_NAVES
CREATE TABLE TBL_NAVES (
    ID_Nave INT PRIMARY KEY,
    Nome VARCHAR(255),
    Status VARCHAR(255)
);
INSERT INTO TBL_NAVES (ID_Nave, Nome, Status) VALUES
(1, 'Apollo 11', 'Finalizada'),
(2, 'Dragon 2', 'Ativa'),
(3, 'Columbia', 'Desativada'),
(4, 'Endeavour', 'Desativada'),
(5, 'Atlantis', 'Desativada'),
(6, 'Discovery', 'Desativada'),
(7, 'Orion', 'Ativa');

-- TABELA_GALÁXIAS
CREATE TABLE TBL_GALÁXIAS (
    ID_Galáxia INT PRIMARY KEY,
    Nome VARCHAR(255)
);

INSERT INTO TBL_GALÁXIAS (ID_Galáxia, Nome) VALUES
(1, 'Galáxia do Triângulo'),
(2, 'Galáxia de Sombrero'),
(3, 'Via Láctea'),
(4, 'Andromeda'),
(5, 'Galáxia do Remanso'),
(6, 'Galáxia do Redemoinho'),
(7, 'Galáxia da Pata de Gato');

-- TABELA_MISSÕES_TRIPULADAS

CREATE TABLE TBL_MISSOES_TRIPULADAS (
    NomeMissao VARCHAR(255) PRIMARY KEY,
    DataDeLancamento DATE,
    Duracao VARCHAR(255),
    Objetivos TEXT,
    ID_CorpoCeleste INT,
    ID_Nave INT,
    ID_Galáxia INT,
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste),
    FOREIGN KEY (ID_Nave) REFERENCES TBL_NAVES(ID_Nave),
    FOREIGN KEY (ID_Galáxia) REFERENCES TBL_GALÁXIAS(ID_Galáxia)
);

INSERT INTO TBL_MISSOES_TRIPULADAS (NomeMissao, DataDeLancamento, Duracao, Objetivos, ID_CorpoCeleste, ID_Nave, ID_Galáxia) VALUES
('Apollo 11', '1969-07-16', '8 dias', 'Pousar na Lua e retornar em segurança', 3, 1, 1),
('Demo-2', '2020-05-30', '64 dias', 'Testar e certificar a Dragon 2 para missoes tripuladas', 4, 2, 3),
('Mars 2020', '2020-07-30', '687 dias', 'Explorar Marte e coletar amostras', 4, 7, 3),
('Gemini 4', '1965-06-03', '4 dias', 'Realizar a primeira caminhada no espaco', 3, 6, 1),
('Apollo 13', '1970-04-11', '6 dias', 'Missao abortada devido a problemas tecnicos', 4, 1, 1),
('Shenzhou 12', '2021-06-17', '30 dias', 'Construir e manter a estacao espacial Tiangong', 4, 7, 1),
('Soyuz MS-09', '2018-06-06', '187 dias', 'Visitar a ISS', 4, 7, 1),
('Apollo 15', '1971-07-26', '12 dias', 'Explorar a Lua com um rover', 4, 1, 1);

-- TABELA_MISSOES_NÃO_TRIPULADAS
CREATE TABLE TBL_MISSOES_NÃO_TRIPULADAS (
    NomeMissão VARCHAR(255) PRIMARY KEY,
    DataDeLançamento DATE,
    ID_CorpoCeleste INT,
    Objetivos TEXT,
    ID_Sonda INT,
    Duracao VARCHAR(255),
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste),
    FOREIGN KEY (ID_Sonda) REFERENCES TBL_SONDAS(ID_Sonda)
);
 
INSERT INTO TBL_MISSOES_NÃO_TRIPULADAS (NomeMissão, DataDeLançamento, ID_CorpoCeleste, Objetivos, ID_Sonda, Duracao) VALUES
('New Horizons', '2006-01-19', 4, 'Explorar Plutão e o Cinturão de Kuiper', 2, 'Em operação'),
('Pioneer 10', '1972-03-02', 9, 'Explorar Júpiter', 3, 'Em operação'),
('Pioneer 11', '1973-04-06', 5, 'Explorar Saturno', 4, 'Em operação'),
('Voyager 2', '1977-08-20', 5, 'Explorar os planetas exteriores e o espaço interestelar', 5, 'Em operação'),
('Juno', '2011-08-05', 9, 'Analisar a orbita do cometa', 6, 'Em operação'),
('Cassini', '1997-10-15', 10, 'Analisar a orbita do cometa', 7, 'Em operação'),
('Hubble', '1990-04-24', 7, 'Observações astronômicas', 8, 'Em operação');


CREATE  TABLE TBL_TIPO_FUNCIONARIO(
    ID_Tipo INT PRIMARY KEY,
    Tipo VARCHAR(255)
);
INSERT INTO TBL_TIPO_FUNCIONARIO (ID_Tipo, Tipo) VALUES
(1, 'Cientista'),
(2, 'Engenheiro'),
(3, 'Astronauta'),
(4, 'Administrativo'),
(5, 'Recursos Humanos');



-- TABELA_FUNCIONÁRIOS
CREATE TABLE TABELA_FUNCIONÁRIOS (
    ID_Funcionario INT PRIMARY KEY,
    id_tipo INT,
    Nome VARCHAR(255),
    Sobrenome VARCHAR(255),
    Salário DECIMAL(10,2),
    FOREIGN KEY (id_tipo) REFERENCES TBL_TIPO_FUNCIONARIO(ID_Tipo)
);
INSERT INTO TABELA_FUNCIONÁRIOS (ID_Funcionario,id_tipo, Nome, Sobrenome, Salário) VALUES
(1,1,'John', 'Doe', 120000.00),
(2,1, 'Jane', 'Smith', 135000.00),
(3,2, 'Alan', 'Turing', 150000.00),
(4,3, 'Ada', 'Lovelace', 140000.00),
(5,1, 'Carl', 'Sagan', 160000.00),
(6,4, 'Neil', 'Armstrong', 170000.00),
(7,1,'Mae', 'Jemison', 155000.00),
(8,3, 'Galileo', 'Galilei', 125000.00),
(9,5,'Isaac', 'Newton', 130000.00),
(10,3, 'Nikola', 'Tesla', 145000.00),
(11, 4,'Marie', 'Curie', 165000.00),
(12, 2,'Albert', 'Einstein', 175000.00),
(13,1, 'Stephen', 'Hawking', 180000.00),
(14, 2,'Katherine', 'Johnson', 125000.00);

DROP TABLE tbl_tripulação;
-- TABELA_TRIPULAÇÃO
-- Criação da tabela com o nome correto
CREATE TABLE tbl_tripulação (
    ID_Tripulacao INT PRIMARY KEY,
    NomeMissão VARCHAR(255),
    ID_Funcionario INT,
    FOREIGN KEY (NomeMissão) REFERENCES TBL_MISSOES_TRIPULADAS(NomeMissao),
    FOREIGN KEY (ID_Funcionario) REFERENCEs TABELA_FUNCIONÁRIOS(ID_Funcionario)
);

-- Inserção dos dados
INSERT INTO tbl_tripulação (ID_Tripulacao,NomeMissão, ID_Funcionario) VALUES
(1, 'Apollo 11', 1),
(2, 'Apollo 11', 2),
(3, 'Demo-2', 3),
(4, 'Demo-2', 4),
(5, 'Mars 2020', 5),
(6, 'Mars 2020', 6),
(7, 'Shenzhou 12', 7),
(8, 'Shenzhou 12', 8);
 

CREATE TABLE Tbl_especializacao (
    ID_especializacao INT PRIMARY KEY,
    Especializacao VARCHAR(255)
);

INSERT INTO Tbl_especializacao (ID_especializacao, Especializacao) VALUES
(1, 'Astrofísica'),
(2, 'Biologia Molecular'),
(3, 'Química Orgânica'),
(4, 'Física de Partículas'),
(5, 'Geologia Planetária'),
(6, 'Biologia Espacial'),
(7, 'Química Cósmica'),
(8, 'Química Inorgânica'),
(9, 'Física Teórica'),
(10, 'Física Experimental');

DROP TABLE TABELA_CIENTISTA;
-- TABELA_CIENTISTA
CREATE TABLE TABELA_CIENTISTA (
    ID_Funcionário INT PRIMARY KEY,
    ÁreaDePesquisa VARCHAR(255),
    ID_Especialização INT,
    FOREIGN KEY (ID_Funcionário) REFERENCES TABELA_FUNCIONÁRIOS(ID_Funcionario),
    FOREIGN KEY (ID_Especialização) REFERENCES Tbl_especializacao(ID_especializacao)
);
INSERT INTO TABELA_CIENTISTA (ID_Funcionário, ÁreaDePesquisa, ID_Especialização) VALUES
(1, 'Astrofísica', 1),
(2, 'Biologia Molecular', 2),
(8, 'Química Cósmica', 8);

-- TABELA_ASTRONAUTAS
CREATE TABLE TABELA_ASTRONAUTAS (
    ID_Funcionário INT PRIMARY KEY,
    Status VARCHAR(255),
    FOREIGN KEY (ID_Funcionário) REFERENCES TABELA_FUNCIONÁRIOS(ID_Funcionario)
);
INSERT INTO TABELA_ASTRONAUTAS (ID_Funcionário, Status) VALUES
(6, 'Ativo'),
(7, 'Desativado');



-- TABELA_DADOS_FINANCEIROS
CREATE TABLE TABELA_DADOS_FINANCEIROS (
    ID_dados_financeiros INT PRIMARY KEY,
    Nome_Missão VARCHAR(255),
    Orçamento DECIMAL(15,2),
    Gastos DECIMAL(15,2),
    Receitas DECIMAL(15,2),
    BalançosFinanceiros DECIMAL(15,2),
    FOREIGN KEY (Nome_Missão) REFERENCES TBL_MISSÕES_TRIPULADAS(NomeMissão)
);
INSERT INTO tabela_dados_financeiros (ID_dados_financeiros,Nome_Missão, Orçamento, Gastos, Receitas, BalançosFinanceiros) VALUES
(1,'Apollo 11', 1000000.00, 800000.00, 1200000.00, 400000.00),
(2,'Demo-2', 2000000.00, 1500000.00, 2500000.00, 1000000.00),
(3,'Mars 2020', 3000000.00, 2500000.00, 3500000.00, 1000000.00),
(4,'Gemini 4', 4000000.00, 3500000.00, 4500000.00, 1000000.00),
(5,'Apollo 13', 5000000.00, 4500000.00, 5500000.00, 1000000.00),
(6,'Shenzhou 12', 6000000.00, 5500000.00, 6500000.00, 1000000.00),
(7,'Soyuz MS-09', 7000000.00, 6500000.00, 7500000.00, 1000000.00),
(8,'Apollo 15', 8000000.00, 7500000.00, 8500000.00, 1000000.00);


CREATE TABLE TABELA_DADOS_CIENTÍFICOS (
    ID_dados_científicos INT PRIMARY KEY,
    NomeMissão VARCHAR(255),
    DataDeLançamento DATE,
    Conteúdo TEXT,
    FOREIGN KEY (NomeMissão) REFERENCES TBL_MISSOES_NÃO_TRIPULADAS(NomeMissão)
);
INSERT INTO tabela_dados_científicos (ID_dados_científicos,NomeMissão, DataDeLançamento, Conteúdo) VALUES
(1,'Voyager 1', '1977-09-05', 'Explorou Júpiter e Saturno'),
(2,'New Horizons', '2006-01-19', 'Explorou Plutão e o Cinturão de Kuiper'),
(3,'Pioneer 10', '1972-03-02', 'Explorou Júpiter'),
(4,'Pioneer 11', '1973-04-06', 'Explorou Saturno'),
(5,'Voyager 2', '1977-08-20', 'Explorou Júpiter, Saturno, Urano e Netuno'),
(6,'Juno', '2011-08-05', 'Explorou Júpiter'),
(7,'Cassini', '1997-10-15', 'Explorou Saturno'),
(8,'Hubble', '1990-04-24', 'Observações astronômicas');

       

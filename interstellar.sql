-- Active: 1720829133941@@127.0.0.1@3306@kk
CREATE DATABASE interstellarinsight 
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE kk;
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
    ID_CorpoCeleste INT PRIMARY KEY,
    Distância VARCHAR(255),
    Tamanho VARCHAR(255),
    Composição VARCHAR(255),
    Atmosfera VARCHAR(255),
    Características_Geológicas TEXT,
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
(9, 'Elíptica', 'Nuvem de poeira e gases', 'Período de 76 anos'),
(11, 'Elíptica', 'Coma de água e poeira', 'Período de 2000 anos');

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
CREATE TABLE TBL_MISSÕES_TRIPULADAS (
    NomeMissão VARCHAR(255) PRIMARY KEY,
    DataDeLançamento DATE,
    Duração VARCHAR(255),
    Objetivos TEXT,
    ID_CorpoCeleste INT,
    ID_Nave INT,
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste),
    FOREIGN KEY (ID_Nave) REFERENCES TBL_NAVES(ID_Nave)
);
INSERT INTO TBL_MISSÕES_TRIPULADAS (NomeMissão, DataDeLançamento, Duração, Objetivos, ID_CorpoCeleste, ID_Nave) VALUES
('Apollo 11', '1969-07-16', '8 dias', 'Pousar na Lua e retornar em segurança', 3, 1),
('Demo-2', '2020-05-30', '64 dias', 'Testar e certificar a Dragon 2 para missões tripuladas', 4, 2),
('Mars 2020', '2020-07-30', '687 dias', 'Explorar Marte e coletar amostras', 4, 7),
('Gemini 4', '1965-06-03', '4 dias', 'Realizar a primeira caminhada no espaço', 3, 3),
('Apollo 13', '1970-04-11', '6 dias', 'Missão abortada devido a problemas técnicos', 4, 1),
('Shenzhou 12', '2021-06-17', '30 dias', 'Construir e manter a estação espacial Tiangong', 4, 7),
('Soyuz MS-09', '2018-06-06', '187 dias', 'Visitar a ISS', 4, 7),
('Apollo 15', '1971-07-26', '12 dias', 'Explorar a Lua com um rover', 4, 1);


-- TABELA_MISSOES_NÃO_TRIPULADAS
CREATE TABLE TBL_MISSOES_NÃO_TRIPULADAS (
    NomeMissão VARCHAR(255) PRIMARY KEY,
    DataDeLançamento DATE,
    ID_CorpoCeleste INT,
    Objetivos TEXT,
    ID_Sonda INT,
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste),
    FOREIGN KEY (ID_Sonda) REFERENCES TBL_SONDAS(ID_Sonda)
);
---erro 
INSERT INTO TBL_MISSOES_NÃO_TRIPULADAS (NomeMissão, DataDeLançamento, ID_CorpoCeleste, Objetivos, ID_Sonda) VALUES
('New Horizons', '2006-01-19', 4, 'Explorar Plutão e o Cinturão de Kuiper', 2),
('Pioneer 10', '1972-03-02', 5, 'Explorar Júpiter', 3),
('Pioneer 11', '1973-04-06', 5, 'Explorar Saturno', 4),
('Voyager 2', '1977-08-20', 5, 'Explorar os planetas exteriores e o espaço interestelar', 5),
('Juno', '2011-08-05', 9, 'Analisar a orbita do cometa  ', 6),
('Cassini', '1997-10-15', 10, 'Analisar a orbita do  cometa ', 7),
('Hubble', '1990-04-24', 7, 'Observações astronômicas', 8);


-- TABELA_FUNCIONÁRIOS
CREATE TABLE TABELA_FUNCIONÁRIOS (
    ID_Funcionario INT PRIMARY KEY,
    Nome VARCHAR(255),
    Sobrenome VARCHAR(255),
    Salário DECIMAL(10,2)
);
INSERT INTO TABELA_FUNCIONÁRIOS (ID_Funcionario, Nome, Sobrenome, Salário) VALUES
(1, 'John', 'Doe', 120000.00),
(2, 'Jane', 'Smith', 135000.00),
(3, 'Alan', 'Turing', 150000.00),
(4, 'Ada', 'Lovelace', 140000.00),
(5, 'Carl', 'Sagan', 160000.00),
(6, 'Neil', 'Armstrong', 170000.00),
(7, 'Mae', 'Jemison', 155000.00),
(8, 'Galileo', 'Galilei', 125000.00),
(9, 'Isaac', 'Newton', 130000.00),
(10, 'Nikola', 'Tesla', 145000.00),
(11, 'Marie', 'Curie', 165000.00),
(12, 'Albert', 'Einstein', 175000.00),
(13, 'Stephen', 'Hawking', 180000.00),
(14, 'Katherine', 'Johnson', 125000.00);


-- TABELA_TRIPULAÇÃO
CREATE TABLE TBL_TRIPULAÇÃO (
    NomeMissão VARCHAR(255),
    ID_Funcionário INT,
    PRIMARY KEY (NomeMissão, ID_Funcionário),
    FOREIGN KEY (NomeMissão) REFERENCES TBL_MISSÕES_TRIPULADAS(NomeMissão),
    FOREIGN KEY (ID_Funcionário) REFERENCES TABELA_FUNCIONÁRIOS(ID_Funcionario)
);
INSERT INTO TBL_TRIPULAÇÃO (NomeMissão, ID_Funcionário) VALUES
('Apollo 11', 1),
('Apollo 11', 2),
('Demo-2', 3),
('Demo-2', 4),
('Mars 2020', 5),
('Mars 2020', 6),
('Shenzhou 12', 7),
('Shenzhou 12', 8);

-- TABELA_CIENTISTA
CREATE TABLE TABELA_CIENTISTA (
    ID_Funcionário INT PRIMARY KEY,
    ÁreaDePesquisa VARCHAR(255),
    Especialização INT,
    FOREIGN KEY (ID_Funcionário) REFERENCES TABELA_FUNCIONÁRIOS(ID_Funcionario)
);
INSERT INTO TABELA_CIENTISTA (ID_Funcionário, ÁreaDePesquisa, Especialização) VALUES
(1, 'Astrofísica', 1),
(2, 'Biologia Molecular', 2),
(8, 'Química Cósmica', 8);



-- TABELA_ESPECILIZACAO_CIENTISTA
CREATE TABLE TABELA_ESPECIALIZACAO_CIENTISTA (
    ID_Funcionario INT,
    Especialização INT,
    PRIMARY KEY (ID_Funcionario, Especialização),
    FOREIGN KEY (ID_Funcionario) REFERENCES TABELA_CIENTISTA(ID_Funcionário)
);
INSERT INTO TABELA_ESPECIALIZACAO_CIENTISTA (ID_Funcionario, Especialização) VALUES
(1, 1),
(2, 2),
(8, 8);


-- TABELA_ENGENHEIRO
CREATE TABLE TABELA_ENGENHEIRO (
    ID_Funcionário INT PRIMARY KEY,
    Especialização CHAR(255),
    FOREIGN KEY (ID_Funcionário) REFERENCES TABELA_FUNCIONÁRIOS(ID_Funcionario)
);
INSERT INTO TABELA_ENGENHEIRO (ID_Funcionário, Especialização) VALUES
(3, 'Mecanica'),
(4, 'Aeroespacial'),
(5, 'Elétrica');


-- TABELA_ASTRONAUTAS
CREATE TABLE TABELA_ASTRONAUTAS (
    ID_Funcionário INT PRIMARY KEY,
    Status VARCHAR(255),
    FOREIGN KEY (ID_Funcionário) REFERENCES TABELA_FUNCIONÁRIOS(ID_Funcionario)
);
INSERT INTO TABELA_ASTRONAUTAS (ID_Funcionário, Status) VALUES
(6, 'Ativo'),
(7, 'Desativado');

drop TABLE tabela_adm;
-- TABELA_ADM
CREATE TABLE TABELA_ADM (
    ID_Funcionário INT,
    Setor VARCHAR(255),
    PRIMARY KEY (ID_Funcionário),
    FOREIGN KEY (ID_Funcionário) REFERENCES TABELA_FUNCIONÁRIOS(ID_Funcionario)
);
--erro
INSERT INTO TABELA_ADM (ID_Funcionário, Setor) VALUES
(10, 'Financeiro'),
(11, 'Recursos Humanos'),
(12, 'Financeiro'),
(13, 'Recursos Humanos'),
(14, 'Financeiro');

-- TABELA_RH
CREATE TABLE TABELA_RH (
    ID_Funcionário INT,
    Setor VARCHAR(255),
    PRIMARY KEY (ID_Funcionário),
    FOREIGN KEY (ID_Funcionário) REFERENCES TABELA_FUNCIONÁRIOS(ID_Funcionario)
);
INSERT INTO tabela_rh (ID_Funcionário, Setor) VALUES
(9, 'Recursos Humanos'),
(11, 'Recursos Humanos'),
(13, 'Recursos Humanos');

-- TABELA_DADOS_FINANCEIROS
CREATE TABLE TABELA_DADOS_FINANCEIROS (
    Nome_Missão VARCHAR(255),
    Orçamento DECIMAL(15,2),
    Gastos DECIMAL(15,2),
    Receitas DECIMAL(15,2),
    BalançosFinanceiros DECIMAL(15,2),
    PRIMARY KEY (Nome_Missão),
    FOREIGN KEY (Nome_Missão) REFERENCES TBL_MISSÕES_TRIPULADAS(NomeMissão)
);
INSERT INTO tabela_dados_financeiros (Nome_Missão, Orçamento, Gastos, Receitas, BalançosFinanceiros) VALUES
('Apollo 11', 1000000.00, 800000.00, 1200000.00, 400000.00),
('Demo-2', 2000000.00, 1500000.00, 2500000.00, 1000000.00),
('Mars 2020', 3000000.00, 2500000.00, 3500000.00, 1000000.00),
('Gemini 4', 4000000.00, 3500000.00, 4500000.00, 1000000.00),
('Apollo 13', 5000000.00, 4500000.00, 5500000.00, 1000000.00),
('Shenzhou 12', 6000000.00, 5500000.00, 6500000.00, 1000000.00),
('Soyuz MS-09', 7000000.00, 6500000.00, 7500000.00, 1000000.00),
('Apollo 15', 8000000.00, 7500000.00, 8500000.00, 1000000.00);

CREATE TABLE TABELA_DADOS_CIENTÍFICOS (
    NomeMissão VARCHAR(255),
    DataDeLançamento DATE,
    Conteúdo TEXT,
    PRIMARY KEY (NomeMissão),
    FOREIGN KEY (NomeMissão) REFERENCES TBL_MISSOES_NÃO_TRIPULADAS(NomeMissão)
);
INSERT INTO tabela_dados_científicos (NomeMissão, DataDeLançamento, Conteúdo) VALUES
('Voyager 1', '1977-09-05', 'Explorou Júpiter e Saturno'),
('New Horizons', '2006-01-19', 'Explorou Plutão e o Cinturão de Kuiper'),
('Pioneer 10', '1972-03-02', 'Explorou Júpiter'),
('Pioneer 11', '1973-04-06', 'Explorou Saturno'),
('Voyager 2', '1977-08-20', 'Explorou Júpiter, Saturno, Urano e Netuno'),
('Juno', '2011-08-05', 'Explorou Júpiter'),
('Cassini', '1997-10-15', 'Explorou Saturno'),
('Hubble', '1990-04-24', 'Observações astronômicas');

CREATE TABLE TBL_MISSOES_GALAXIAS (
    NomeMissão VARCHAR(255),
    ID_Galáxia INT,
    FOREIGN KEY (NomeMissão) REFERENCES TBL_MISSÕES_TRIPULADAS(NomeMissão),
    FOREIGN KEY (ID_Galáxia) REFERENCES TBL_GALÁXIAS(ID_Galáxia)
);

INSERT INTO TBL_MISSOES_GALAXIAS (NomeMissão, ID_Galáxia) VALUES
('Apollo 11', 3),          
('Demo-2', 3),            
('Mars 2020', 3),         
('Gemini 4', 3),          
('Shenzhou 12', 3),       
('Soyuz MS-09', 3),       
('Apollo 15', 3);         

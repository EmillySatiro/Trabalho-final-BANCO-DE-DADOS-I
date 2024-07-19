-- Active: 1720829133941@@127.0.0.1@3306@kk
CREATE DATABASE interstellarinsight 
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE interstellarinsight;

create table TBL_CORPO_CELESTE(
    ID_CorpoCeleste INT PRIMARY KEY, 
    nome varchar(100)
);

INSERT INTO TBL_CORPO_CELESTE (ID_CorpoCeleste, nome) VALUES 
(1, 'Marte'), 
(2, 'Vênus'), 
(3, 'Jupiter'),  
(4, 'Saturno'),  
(5, 'Cometa Halley'),  
(6, 'Cometa Hale-Bopp'), 
(7, 'Cometa Encke'), 
(8, 'Cometa McNaught'), 
(9, 'Sirius'), 
(10, 'Betelguese'), 
(11, 'polaris'), 
(12, 'Nebulosa de Órion'),
(13, 'Nebulosa de Carina')
ON DUPLICATE KEY UPDATE nome = VALUES(nome);
SELECT * FROM TBL_CORPO_CELESTE;



CREATE TABLE TBL_PLANETAS (
    ID_CorpoCeleste INT PRIMARY KEY,
    Distancia VARCHAR(100),
    Tamanho VARCHAR(100),
    Composicao VARCHAR(100),
    atmosfera VARCHAR(100),
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste)
);
INSERT INTO TBL_PLANETAS (ID_CorpoCeleste, Distancia, Tamanho, Composicao, atmosfera) VALUES 
(1, '227.9 milhões de km', '6.779 km de diâmetro', 'Rocha e metal', 'Dióxido de carbono, nitrogênio, argônio'),
(2, '108.2 milhões de km', '12.104 km de diâmetro', 'Rocha e metal', 'Dióxido de carbono, nitrogênio, argônio'),
(3, '778.3 milhões de km', '139.820 km de diâmetro', 'Hidrogênio e hélio', 'Hidrogênio, hélio, metano'),
(4, '1.429 bilhões de km', '116.460 km de diâmetro', 'Hidrogênio e hélio', 'Hidrogênio, hélio, metano')
ON DUPLICATE KEY UPDATE Distancia = VALUES(Distancia), Tamanho = VALUES(Tamanho), Composicao = VALUES(Composicao), atmosfera = VALUES(atmosfera);
SELECT * FROM TBL_PLANETAS;



CREATE TABLE TBL_CARACTERISTICAS_GEOLOGICAS(
    ID_CorpoCeleste INT PRIMARY KEY,
    CaracteristicasGeologicas VARCHAR(100)
);
INSERT INTO TBL_CARACTERISTICAS_GEOLOGICAS (ID_CorpoCeleste, CaracteristicasGeologicas) VALUES 
(1, 'Possui uma superfície rochosa com vulcões e vales'),
(2, 'Uma atmosfera densa e uma superfície coberta por crateras'),
(3, 'Um gigante gasoso com uma atmosfera turbulenta e uma grande mancha vermelha'),
(4, 'Conhecido por seus anéis impressionantes e sua atmosfera gasosa'),
(5, 'Um cometa periódico que visita o sistema solar a cada 76 anos'),
(6, 'Um cometa brilhante que passou pelo sistema solar em 1997'),
(7, 'Um cometa de curto período que orbita o sol a cada 3,3 anos'),
(8, 'U cometa brilhante que foi visível da Terra em 2007'),
(9, 'A estrela mais brilhante no céu noturno e faz parte da constelação do Cão Maior'),
(10, 'Uma estrela supergigante vermelha na constelação de Orion'),
(11, 'Também conhecida como Estrela do Norte, é a estrela mais brilhante na constelação da Ursa Menor'),
(12, 'Uma região de formação estelar localizada na constelação de Orion'),
(13, 'Uma grande nebulosa de emissão localizada na constelação de Carina');
SELECT * FROM tbl_caracteristicas_geologicas;



CREATE TABLE TBL_COMETAS (
    ID_CorpoCeleste INT PRIMARY KEY,
    Orbita VARCHAR(100),
    TipoDeComa VARCHAR(100),
    Posicao VARCHAR(100),
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste)
);
INSERT INTO TBL_COMETAS (ID_CorpoCeleste, Orbita, TipoDeComa, Posicao) VALUES 
(5, 'Órbita elíptica', 'Coma difusa', 'Próximo ao Sol'),
(6, 'Órbita elíptica', 'Coma brilhante', 'Próximo ao Sol'),
(7, 'Órbita elíptica', 'Coma difusa', 'Próximo ao Sol'),
(8, 'Órbita elíptica', 'Coma brilhante', 'Próximo ao Sol')
ON DUPLICATE KEY UPDATE Orbita = VALUES(Orbita), TipoDeComa = VALUES(TipoDeComa), Posicao = VALUES(Posicao);
SELECT * FROM TBL_COMETAS;


CREATE TABLE TBL_ESTRELAS (
    EID_CorpoCeleste INT PRIMARY KEY,
    Distancia FLOAT,
    Sistema VARCHAR(100),
    Tamanho FLOAT,
    Composicao VARCHAR(100)
);
INSERT INTO TBL_ESTRELAS (EID_CorpoCeleste, Distancia, Sistema, Tamanho, Composicao) VALUES 
(14, 4.22, 'Sistema Alpha Centauri', 1.227, 'Hidrogênio e hélio'),
(15, 10.5, 'Sistema Solar', 1.989, 'Hidrogênio e hélio')
ON DUPLICATE KEY UPDATE Distancia = VALUES(Distancia), Sistema = VALUES(Sistema), Tamanho = VALUES(Tamanho), Composicao = VALUES(Composicao);
SELECT *FROM tbl_estrelas;


CREATE TABLE TBL_NEBULOSA(
    ID_CorpoCeleste INT PRIMARY KEY,
    Tipo VARCHAR(100),
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste)
);
INSERT INTO TBL_NEBULOSA (ID_CorpoCeleste, Tipo) VALUES 
(12, 'Nebulosa'),
(13, 'Nebulosa')
ON DUPLICATE KEY UPDATE Tipo = VALUES(Tipo);
SELECT * FROM TBL_NEBULOSA;



CREATE TABLE TBL_SONDAS (
    ID_Sonda INT PRIMARY KEY,
    Nome VARCHAR(100),
    Status VARCHAR(50)
);
INSERT INTO TBL_SONDAS (ID_Sonda, Nome, Status) VALUES 
(1, 'Voyager 1', 'Ativa'),
(2, 'Curiosity Rover', 'Ativa'),
(3, 'Hubble Space Telescope', 'Ativa'),
(4, 'Cassini', 'Inativa'),
(5, 'New Horizons', 'Ativa'),
(6, 'Rosetta', 'Inativa'),
(7, 'Chang''e 4', 'Ativa')
ON DUPLICATE KEY UPDATE Nome = VALUES(Nome), Status = VALUES(Status);
SELECT * FROM TBL_SONDAS;


CREATE TABLE TBL_HISTORICO_SONDAS (
    ID_Sonda INT,
    ID_Historico INT,
    PRIMARY KEY (ID_Sonda, ID_Historico),
    FOREIGN KEY (ID_Sonda) REFERENCES TBL_SONDAS(ID_Sonda)
);
INSERT INTO TBL_HISTORICO_SONDAS (ID_Sonda, ID_Historico) VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2);
SELECT * FROM tbl_historico_sondas;


CREATE TABLE TBL_NAVES (
    ID_Nave INT PRIMARY KEY,
    Nome VARCHAR(100),
    Status VARCHAR(50)
);
INSERT INTO TBL_NAVES (ID_Nave, Nome, Status) VALUES 
(1, 'SpaceX Crew Dragon (Endeavour)', 'Ativa'),
(2, 'Soyuz TM-31', 'Inativa'),
(3, 'SpaceX Crew Dragon (Resilience)', 'Ativa'),
(4, 'Command Module Columbia / Lunar Module Eagle', 'Inativa'),
(5, 'Gemini 4', 'Inativa'),
(6, 'Space Shuttle Columbia', 'Inativa'),
(7, 'Space Shuttle Challenger', 'Inativa')
ON DUPLICATE KEY UPDATE Nome = VALUES(Nome), Status = VALUES(Status);
SELECT *FROM tbl_naves;



CREATE TABLE TBL_HISTORICO_NAVES (
    ID_Nave INT,
    ID_Historico INT,
    PRIMARY KEY (ID_Nave, ID_Historico),
    FOREIGN KEY (ID_Nave) REFERENCES TBL_NAVES(ID_Nave)
);
INSERT INTO TBL_HISTORICO_NAVES (ID_Nave, ID_Historico) VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1)
(7, 2);
SELECT * FROM TBL_HISTORICO_NAVES;



CREATE TABLE TBL_GALAXIAS (
    ID_Galaxia INT PRIMARY KEY,
    Nome VARCHAR(100)
);
INSERT INTO TBL_GALAXIAS (ID_Galaxia, Nome) VALUES 
(60, 'Via Láctea'),
(61, 'Galáxia de Andrômeda'),
(62, 'Galáxia do Triângulo (M33)'),
(63, 'Galáxia de Sombrero (M104)'),
(64, 'Galáxia de Whirlpool (M51)'),
(65, 'Galáxia de Cata-vento do Sul (M83)'),
(66, 'Galáxia de Sombreiro (NGC 4594)'),
(67, 'Galáxia de Olho Negro (M64)'),
(68, 'Galáxia de Girassol (M63)'),
(69, 'Galáxia de Bode (M81)')
ON DUPLICATE KEY UPDATE Nome = VALUES(Nome);
SELECT * FROM TBL_GALAXIAS;



CREATE TABLE TBL_HISTORICO_GALAXIAS (
    ID_Galaxia INT,
    ID_Historico INT,
    PRIMARY KEY (ID_Galaxia, ID_Historico),
    FOREIGN KEY (ID_Galaxia) REFERENCES TBL_GALAXIAS(ID_Galaxia)
);
INSERT INTO TBL_HISTORICO_GALAXIAS (ID_Galaxia, ID_Historico) VALUES 
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2);
SELECT * FROM TBL_HISTORICO_GALAXIAS;



CREATE TABLE TBL_MISSOES_TRIPULADAS (
    NomeMissao VARCHAR(100) PRIMARY KEY,
    DataDeLancamento DATE,
    DuracaoEstipulada VARCHAR(50),
    Objetivos TEXT
);
INSERT INTO TBL_MISSOES_TRIPULADAS (NomeMissao, DataDeLancamento, DuracaoEstipulada, Objetivos) VALUES 
('Demo-2', '2020-05-30', '64 dias', 'Primeiro voo tripulado da Crew Dragon, demonstração do sistema de transporte'),
('Expedition 1', '2000-10-31', '136 dias', 'Primeira tripulação a habitar a ISS'),
('SpaceX Crew-1 (Resilience)', '2020-11-15', '180 dias', 'Primeira missão operacional da Crew Dragon'),
('Apollo 11', '1969-07-16', '8 dias', 'Primeiro pouso tripulado na Lua'),
('Gemini 4', '1965-06-03', '4 dias', 'Primeira caminhada espacial americana'),
('STS-107', '2003-01-16', '16 dias', 'Experimentos em microgravidade'),
('STS-41-B', '1984-02-03', '7 dias', 'Primeira caminhada espacial com unidade de manobra tripulada');
SELECT * FROM TBL_MISSOES_TRIPULADAS;



CREATE TABLE TBL_NOMEMISSAO_NAVE (
    NomeMissao VARCHAR(100),
    ID_Nave INT,
    PRIMARY KEY (NomeMissao, ID_Nave),
    FOREIGN KEY (NomeMissao) REFERENCES TBL_MISSOES_TRIPULADAS(NomeMissao),
    FOREIGN KEY (ID_Nave) REFERENCES TBL_NAVES(ID_Nave)
);
INSERT INTO TBL_NOMEMISSAO_NAVE (NomeMissao, ID_Nave) VALUES 
('Demo-2', 1),
('Demo-2', 3),
('Expedition 1', 2),
('SpaceX Crew-1 (Resilience)', 1),
('Apollo 11', 4),
('Gemini 4', 5),
('STS-107', 6),
('STS-41-B', 6);
SELECT * FROM TBL_NOMEMISSAO_NAVE;


CREATE TABLE TBL_MISSOES_NAO_TRIPULADAS (
    NomeMissao VARCHAR(100) PRIMARY KEY,
    DataDeLancamento DATE,
    Duracao VARCHAR(50),
    Objetivos TEXT
);
INSERT INTO TBL_MISSOES_NAO_TRIPULADAS (NomeMissao, DataDeLancamento, Duracao, Objetivos) VALUES 
('Voyager 1', '1977-09-05', 'Em operação', 'Exploração dos limites do Sistema Solar e além'),
('Mars Science Laboratory', '2011-11-26', 'Em operação', 'Investigação da habitabilidade passada e presente de Marte'),
('Hubble Space Telescope', '1990-04-24', 'Em operação', 'Observação astronômica em várias faixas do espectro eletromagnético'),
('Cassini-Huygens', '1997-10-15', '19 anos', 'Estudo de Saturno, seus anéis e luas, incluindo a sonda Huygens em Titã'),
('New Horizons', '2006-01-19', 'Em operação', 'Exploração de Plutão e do Cinturão de Kuiper');
SELECT * FROM TBL_MISSOES_NAO_TRIPULADAS;


CREATE TABLE TBL_ENVOLVIDOS (
    ID_Sonda INT PRIMARY KEY,
    NomeSonda VARCHAR(100)
);
INSERT INTO TBL_ENVOLVIDOS (ID_Sonda, NomeSonda) VALUES 
(1, 'Voyager 1'),
(2, 'Curiosity Rover'),
(3, 'Hubble Space Telescope'),
(4, 'Cassini'),
(5, 'New Horizons'),
(6, 'Rosetta'),
(7, 'Chang''e 4')
ON DUPLICATE KEY UPDATE NomeSonda = VALUES(NomeSonda);
SELECT * FROM TBL_ENVOLVIDOS;


CREATE TABLE TBL_TRIPULACAO (
    ID_Tripulacao INT PRIMARY KEY,
    NomeMissao VARCHAR(100),
    FOREIGN KEY (NomeMissao) REFERENCES TBL_MISSOES_TRIPULADAS(NomeMissao)
);
INSERT INTO TBL_TRIPULACAO (ID_Tripulacao, NomeMissao) VALUES 
    (1, 'Demo-2'),
    (2, 'Expedition 1'),
    (3, 'SpaceX Crew-1 (Resilience)'),
    (4, 'Apollo 11'),
    (5, 'Gemini 4'),
    (6, 'STS-107'),
    (7, 'STS-41-B')
ON DUPLICATE KEY UPDATE NomeMissao = VALUES(NomeMissao);
SELECT * FROM TBL_TRIPULACAO;



CREATE TABLE TBL_FUNCIONARIOS_TRIPULACAO (
    ID_Tripulacao INT,
    ID_Funcionario INT,
    PRIMARY KEY (ID_Tripulacao, ID_Funcionario),
    FOREIGN KEY (ID_Tripulacao) REFERENCES TBL_TRIPULACAO(ID_Tripulacao),
    FOREIGN KEY (ID_Funcionario) REFERENCES TBL_FUNCIONARIOS(ID_Funcionario)
);
INSERT INTO TBL_FUNCIONARIOS_TRIPULACAO (ID_Tripulacao, ID_Funcionario) VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8);
SELECT * FROM TBL_FUNCIONARIOS_TRIPULACAO;



CREATE TABLE TBL_FUNCIONARIOS (
    ID_Funcionario INT PRIMARY KEY,
    Status VARCHAR(50)
);
INSERT INTO TBL_FUNCIONARIOS (ID_Funcionario, Status) VALUES 
(1, 'Ativo'),
(2, 'Indisponivel'),
(3, 'Ativo'),
(4, 'Ativo'),
(5, 'Indisponivel'),
(6, 'Ativo'),
(7, 'Ativo'),
(8, 'Indisponivel');

SELECT * FROM TBL_FUNCIONARIOS;

CREATE TABLE TBL_CIENTISTAS (
    ID_Funcionario INT PRIMARY KEY,
    AreaDePesquisa VARCHAR(100),
    Especializacao INT,
    FOREIGN KEY (ID_Funcionario) REFERENCES TBL_FUNCIONARIOS(ID_Funcionario)
);

INSERT INTO TBL_CIENTISTAS (ID_Funcionario, AreaDePesquisa, Especializacao) VALUES 
(1, 'Astrobiologia', 1),
(2, 'Cosmologia', 2),
(3, 'Exoplanetologia', 3),
(4, 'Biologia Espacial', 4),
(5, 'Genômica Espacial', 5),
(6, 'Bioengenharia para o Espaço', 6),
(7, 'Astronomia de Ondas Gravitacionais', 7)
ON DUPLICATE KEY UPDATE AreaDePesquisa = VALUES(AreaDePesquisa), Especializacao = VALUES(Especializacao);
SELECT * FROM TBL_CIENTISTAS;


CREATE TABLE TABELA_ESPECIALIZACAO_CIENTISTA (
    ID_especializacao INT PRIMARY KEY,
    Especializacao VARCHAR(100)
);
INSERT INTO TABELA_ESPECIALIZACAO_CIENTISTA (ID_especializacao, Especializacao) VALUES 
(1, 'Bioquímica'),
(2, 'Física Teórica'),
(3, 'Astronomia'),
(4, 'Biologia Celular'),
(5, 'Genômica'),
(6, 'Engenharia Genética'),
(7, 'Astrofísica');
SELECT * FROM TABELA_ESPECIALIZACAO_CIENTISTA;

CREATE TABLE TBL_ENGENHEIRO (
    ID_Funcionario INT PRIMARY KEY,
    Especializacao VARCHAR(100),
    FOREIGN KEY (ID_Funcionario) REFERENCES TBL_FUNCIONARIOS(ID_Funcionario)
);
INSERT INTO TBL_ENGENHEIRO (ID_Funcionario, Especializacao) VALUES 
(1, 'Engenheiro Aeroespacial'),
(2, 'Engenheiro de Sistemas'),
(3, 'Engenheiro de Software'),
(4, 'Engenheiro de Materiais'),
(5, 'Engenheiro de Controle'),
(6, 'Engenheiro de Eletrônica'),
(7, 'Engenheiro de Telecomunicações');

SELECT * FROM TBL_ENGENHEIRO;


CREATE TABLE TABELA_TIPO_FUNCIONARIOS (
    ID_Funcionario INT,
    TipoFuncionario VARCHAR(100),
    PRIMARY KEY (ID_Funcionario),
    FOREIGN KEY (ID_Funcionario) REFERENCES TBL_FUNCIONARIOS(ID_Funcionario)
);
INSERT INTO TABELA_TIPO_FUNCIONARIOS (ID_Funcionario, TipoFuncionario) VALUES 
(1, 'Cientista'),
(2, 'Cientista'),
(3, 'Engenheiro'),
(4, 'RH'),
(5, 'Astronalta'),
(6, 'engenheiro'),
(7, 'Cientista');

SELECT * FROM TABELA_TIPO_FUNCIONARIOS;


CREATE TABLE TABELA_HISTORICO_MISSOES_FUNCIONARIO (
    ID_Historico INT PRIMARY KEY,
    ID_Funcionario INT,
    FOREIGN KEY (ID_Funcionario) REFERENCES TBL_FUNCIONARIOS(ID_Funcionario)
);
INSERT INTO TABELA_HISTORICO_MISSOES_FUNCIONARIO (ID_Historico, ID_Funcionario) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);
SELECT * FROM TABELA_HISTORICO_MISSOES_FUNCIONARIO;



CREATE TABLE TABELA_HISTORICO_MISSOES_NOMEMISSAO (
    ID_Historico INT PRIMARY KEY,
    NomeMissao VARCHAR(100),
    FOREIGN KEY (NomeMissao) REFERENCES TBL_MISSOES_TRIPULADAS(NomeMissao)
);
INSERT INTO TABELA_HISTORICO_MISSOES_NOMEMISSAO (ID_Historico, NomeMissao) VALUES 
(1, 'Demo-2'),
(2, 'Expedition 1'),
(3, 'SpaceX Crew-1 (Resilience)'),
(4, 'Apollo 11'),
(5, 'Gemini 4'),
(6, 'STS-107'),
(7, 'STS-41-B');
SELECT * FROM TABELA_HISTORICO_MISSOES_NOMEMISSAO;



CREATE TABLE TABELA_ID_SETOR (
    ID_SETOR INT PRIMARY KEY,
    Setor VARCHAR(100)
);
INSERT INTO TABELA_ID_SETOR (ID_SETOR, Setor) VALUES 
(1, 'RH'),
(2, 'FINANCEIRO'),
(3, 'RH'),
(4, 'TI'),
(5, 'TI'),
(6, 'RH');
SELECT * FROM TABELA_ID_SETOR;


CREATE TABLE TABELA_ADM (
    ID_Funcionario INT PRIMARY KEY,
    Nome VARCHAR(100),
    Sobrenome VARCHAR(100),
    FOREIGN KEY (ID_Funcionario) REFERENCES TBL_FUNCIONARIOS(ID_Funcionario)
);
INSERT INTO TABELA_ADM (ID_Funcionario, Nome, Sobrenome) VALUES 
(1, 'João', 'Silva'),
(2, 'Maria', 'Santos'),
(4, 'Ana', 'Ferreira'),
(5, 'Pedro', 'Souza');
SELECT * FROM TABELA_ADM;


CREATE TABLE TABELA_FUNCIONARIO_SETOR (
    ID_Funcionario INT,
    ID_SETOR INT,
    PRIMARY KEY (ID_Funcionario),
    FOREIGN KEY (ID_Funcionario) REFERENCES TBL_FUNCIONARIOS(ID_Funcionario),
    FOREIGN KEY (ID_SETOR) REFERENCES TABELA_ID_SETOR(ID_SETOR)
);
INSERT INTO TABELA_FUNCIONARIO_SETOR (ID_Funcionario, ID_SETOR) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);     
SELECT * FROM TABELA_FUNCIONARIO_SETOR;

CREATE TABLE TABELA_RH (
    ID_Funcionario INT PRIMARY KEY,
    ID_SETOR INT,
    FOREIGN KEY (ID_Funcionario) REFERENCES TBL_FUNCIONARIOS(ID_Funcionario),
    FOREIGN KEY (ID_SETOR) REFERENCES TABELA_ID_SETOR(ID_SETOR)
);
INSERT INTO TABELA_RH (ID_Funcionario, ID_SETOR) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6); 
SELECT * FROM TABELA_RH;

CREATE TABLE TABELA_DADOS_FINANCEIROS (
    NomeMissao VARCHAR(100),
    Orcamento DECIMAL(10, 2),
    Gastos DECIMAL(10, 2),
    Receitas DECIMAL(10, 2),
    BalancoFinanceiro DECIMAL(10, 2),
    FOREIGN KEY (NomeMissao) REFERENCES TBL_MISSOES_TRIPULADAS(NomeMissao)
);
INSERT INTO TABELA_DADOS_FINANCEIROS (NomeMissao, Orcamento, Gastos, Receitas, BalancoFinanceiro) VALUES 
('Demo-2', 1000000.00, 500000.00, 700000.00, 200000.00),
('Expedition 1', 2000000.00, 1000000.00, 1500000.00, 500000.00),
('SpaceX Crew-1 (Resilience)', 3000000.00, 1500000.00, 2000000.00, 500000.00),
('Apollo 11', 4000000.00, 2000000.00, 3000000.00, 1000000.00),
('Gemini 4', 5000000.00, 2500000.00, 3500000.00, 1000000.00),
('STS-107', 6000000.00, 3000000.00, 4000000.00, 1000000.00),
('STS-41-B', 7000000.00, 3500000.00, 4500000.00, 1000000.00);
SELECT * FROM TABELA_DADOS_FINANCEIROS;


CREATE TABLE TABELA_DADOS_CIENTIFICOS (
    NomeMissao VARCHAR(100),
    DataDeLancamento DATE,
    Conteudo TEXT,
    FOREIGN KEY (NomeMissao) REFERENCES TBL_MISSOES_TRIPULADAS(NomeMissao)
);
INSERT INTO TABELA_DADOS_CIENTIFICOS (NomeMissao, DataDeLancamento, Conteudo) VALUES 
('Demo-2', '2020-05-30', 'Primeiro voo tripulado da Crew Dragon, demonstração do sistema de transporte'),
('Expedition 1', '2000-10-31', 'Primeira tripulação a habitar a ISS'),
('SpaceX Crew-1 (Resilience)', '2020-11-15', 'Primeira missão operacional da Crew Dragon'),
('Apollo 11', '1969-07-16', 'Primeiro pouso tripulado na Lua'),
('Gemini 4', '1965-06-03', 'Primeira caminhada espacial americana'),
('STS-107', '2003-01-16', 'Experimentos em microgravidade'),
('STS-41-B', '1984-02-03', 'Primeira caminhada espacial com unidade de manobra tripulada');
SELECT * FROM TABELA_DADOS_CIENTIFICOS;




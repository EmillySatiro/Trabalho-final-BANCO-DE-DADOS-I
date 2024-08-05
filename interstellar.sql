-- Active: 1720829133941@@127.0.0.1@3306@interstellarinsight
CREATE DATABASE interstellarinsight 
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE interstellarinsight;
-- Table: TBL_CORPO_CELESTE
CREATE TABLE TBL_CORPO_CELESTE (
    ID_CorpoCeleste INT PRIMARY KEY,
    Nome VARCHAR(255)
);
INSERT INTO TBL_CORPO_CELESTE (ID_CorpoCeleste, Nome) VALUES
(1, 'Mercurio'),
(2, 'Venus'),
(3, 'Terra'),
(4, 'Marte'),
(5, 'Jupiter'),
(6, 'Saturno'),
(7, 'Nebulosa de Emissao'),
(8, 'Nebulosa de Reflexao'),
(9, 'Plutao'),
(10, 'Cometa Halley'),
(11, 'Estrela Vega'),
(12, 'Cometa Hale-Bopp'),
(13, 'Nebulosa do Caranguejo'),
(14, 'Cometa Ison'),
(15, 'Estrela Sirius');


-- Table: TBL_PLANETAS
CREATE TABLE TBL_PLANETAS (
    ID_CorpoCeleste INT,
    Distancia VARCHAR(255),
    Tamanho VARCHAR(255),
    Composicao VARCHAR(255),
    Atmosfera VARCHAR(255),
    Caracteristicas_Geologicas VARCHAR(255),
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste)
);
INSERT INTO TBL_PLANETAS (ID_CorpoCeleste, Distancia, Tamanho, Composicao, Atmosfera, Caracteristicas_Geologicas) VALUES
(1, '57.91 milhoes km do Sol', '4.880 km', 'rochoso', 'Oxigenio, sodio e hidrogenio', 'Superficie marcada por crateras de impacto.'),
(2, '108 milhoes km do Sol', '12.104 km', 'rochoso', 'Dioxido de carbono', 'Vulcoes e planicies.'),
(3, '149.6 milhoes km do Sol', '12.742 km', 'rochoso', 'Nitrogenio e oxigenio', 'Superficie com oceanos e continentes.'),
(4, '227.9 milhoes km do Sol', '6.779 km', 'rochoso', 'Dioxido de carbono', 'Superficie com crateras e vales.'),
(5, '778.5 milhoes km do Sol', '139.820 km', 'gasoso', 'Hidrogenio e helio', 'Superficie com manchas e anel gigante.'),
(6, '1.434 bilhoes km do Sol', '116.460 km', 'gasoso', 'Hidrogenio e helio', 'Sistema de aneis complexo.'),
(7, '5.906 bilhoes km do Sol', '2.377 km', 'gelo e rochoso', 'Nitrogenio e metano', 'Superficie com gelo e crateras.');

-- Table: TBL_COMETAS
CREATE TABLE TBL_COMETAS (
    ID_CorpoCeleste INT,
    Orbita VARCHAR(255),
    Tipo_de_coma VARCHAR(255),
    Posicao VARCHAR(255),
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste)
);
INSERT INTO TBL_COMETAS (ID_CorpoCeleste, Orbita, Tipo_de_coma, Posicao) VALUES
(10, 'Eliptica', 'Nuvem de poeira e gases ao redor do nucleo', 'Retorna a cada 76 anos e e um cometa periodico'),
(12, 'Eliptica', 'Coma gasosa, composta principalmente de vapor dagua', 'Visivel a cada 4.2 anos'),
(14, 'Parabola', 'Coma de poeira e gases', 'Passa perto do Sol uma vez antes de sair do sistema solar');


-- Table: TBL_ESTRELAS
CREATE TABLE TBL_ESTRELAS (
    ID_CorpoCeleste INT,
    Distancia VARCHAR(255),
    Sistema VARCHAR(255),
    Tamanho VARCHAR(255),
    Composicao VARCHAR(255),
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste)
);
INSERT INTO TBL_ESTRELAS (ID_CorpoCeleste, Distancia, Sistema, Tamanho, Composicao) VALUES
(11, '25.00 anos-luz', 'Sistema Solar', '1.00', 'Hidrogenio, Helio'),
(15, '8.6 anos-luz', 'Sistema Solar', '2.00', 'Hidrogenio, Helio');

-- Table: TBL_NEBULOSA
CREATE TABLE TBL_NEBULOSA (
    ID_CorpoCeleste INT,
    Tipo VARCHAR(255),
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste)
);
INSERT INTO TBL_NEBULOSA (ID_CorpoCeleste, Tipo) VALUES
(7, 'Nebulosa de Emissao'),
(8, 'Nebulosa de Reflexao'),
(13, 'Nebulosa Planetaria');


-- Table: TBL_SONDAS
CREATE TABLE TBL_SONDAS (
    ID_Sonda INT PRIMARY KEY,
    Nome VARCHAR(255),
    Status VARCHAR(255)
);
INSERT INTO TBL_SONDAS (ID_Sonda, Nome, Status) VALUES
(1, 'Voyager 1', 'Ativa'),
(2, 'New Horizons', 'Ativa'),
(3, 'Pioneer 10', 'Inativa'),
(4, 'Voyager 2', 'Ativa'),
(5, 'Juno', 'Ativa'),
(6, 'Cassini', 'Inativa');

-- Table: TBL_NAVES
CREATE TABLE TBL_NAVES (
    ID_Nave INT PRIMARY KEY,
    Nome VARCHAR(255),
    Status VARCHAR(255)
);
INSERT INTO TBL_NAVES (ID_Nave, Nome, Status) VALUES
(1, 'Apollo 11', 'Inativa'),
(2, 'Dragon 2', 'Ativa'),
(3, 'Columbia', 'Inativa'),
(4, 'Endeavour', 'Inativa'),
(5, 'Challenger', 'Inativa'),
(6, 'Discovery', 'Inativa');

-- Table: TBL_GALAXIAS
CREATE TABLE TBL_GALAXIAS (
    ID_Galaxia INT PRIMARY KEY,
    Nome VARCHAR(255)
);
INSERT INTO TBL_GALAXIAS (ID_Galaxia, Nome) VALUES
(1, 'Galaxia do Triangulo'),
(2, 'Galaxia de Sombrero'),
(3, 'Via Lactea'),
(4, 'Galaxia de Andromeda'),
(5, 'Galaxia do Remolino');


-- Table: TBL_MISSOES_TRIPULADAS
CREATE TABLE TBL_MISSOES_TRIPULADAS (
    NomeMissao VARCHAR(255) PRIMARY KEY,
    DataDeLancamento DATE,
    Duracao VARCHAR(255),
    Objetivos VARCHAR(255),
    ID_CorpoCeleste INT,
    ID_Nave INT,
    ID_Galaxia INT,
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste),
    FOREIGN KEY (ID_Nave) REFERENCES TBL_NAVES(ID_Nave),
    FOREIGN KEY (ID_Galaxia) REFERENCES TBL_GALAXIAS(ID_Galaxia)
);
INSERT INTO TBL_MISSOES_TRIPULADAS (NomeMissao, DataDeLancamento, Duracao, Objetivos, ID_CorpoCeleste, ID_Nave, ID_Galaxia) VALUES
('Apollo 11', '1969-07-16', '8 dias', 'Pousar na Lua e retornar em seguranca', 4, 1, 3),
('Demo-2', '2020-05-30', '64 dias', 'Testar e certificar a Dragon 2 para missoes tripuladas', 3, 2, 3),
('Mars Science Laboratory', '2011-11-26', '687 dias', 'Explorar Marte com o rover Curiosity', 4, 3, 4),
('Expedition 1', '2000-10-31', '150 dias', 'Estabelecer a primeira tripulação permanente na ISS', 1, 4, 5),
('ISS Expedition 57', '2018-06-06', '150 dias', 'Manutenção e experimentos na ISS', 3, 5, 3);
-- Table: TBL_MISSOES_NAO_TRIPULADAS
CREATE TABLE TBL_MISSOES_NAO_TRIPULADAS (
    NomeMissao VARCHAR(255) PRIMARY KEY,
    DataDeLancamento DATE,
    Duracao VARCHAR(255),
    Objetivos VARCHAR(255),
    ID_CorpoCeleste INT,
    ID_Sonda INT,
    ID_Galaxia INT,
    FOREIGN KEY (ID_CorpoCeleste) REFERENCES TBL_CORPO_CELESTE(ID_CorpoCeleste),
    FOREIGN KEY (ID_Sonda) REFERENCES TBL_SONDAS(ID_Sonda),
    FOREIGN KEY (ID_Galaxia) REFERENCES TBL_GALAXIAS(ID_Galaxia)
);
INSERT INTO TBL_MISSOES_NAO_TRIPULADAS (NomeMissao, DataDeLancamento, Duracao, Objetivos, ID_CorpoCeleste, ID_Sonda, ID_Galaxia) VALUES
('Voyager 1', '1977-09-05', 'Em operacao', 'Explorar os planetas exteriores e o espaco interestelar', 3, 1, 3),
('New Horizons', '2006-01-19', 'Em operacao', 'Explorar Plutao e o Cinturao de Kuiper', 9, 2, 3),
('Pioneer 10', '1972-03-02', 'Em operacao', 'Primeira sonda a atravessar o Cinturao de Asteroides', 1, 3, 3),
('Juno', '2011-08-05', 'Em operacao', 'Estudar o planeta Jupiter', 5, 5, 3),
('Cassini', '1997-10-15', 'Em operacao', 'Estudar Saturno e seus aneis', 6, 6, 3);

-- Table: TABELA_TIPOFUNCIONARIO
CREATE TABLE TABELA_TIPOFUNCIONARIO (
    ID_Tipo INT PRIMARY KEY,
    TipoFuncionario VARCHAR(255)
);
INSERT INTO TABELA_TIPOFUNCIONARIO (ID_Tipo, TipoFuncionario) VALUES
(1, 'astronauta'),
(2, 'cientista'),
(3, 'engenheiro'),
(4, 'tecnico');

-- Table: TABELA_FUNCIONARIOS
CREATE TABLE TABELA_FUNCIONARIOS (
    ID_Funcionario INT PRIMARY KEY,
    ID_Tipo INT,
    Nome VARCHAR(255),
    Sobrenome VARCHAR(255),
    Salario DECIMAL(10, 2),
    FOREIGN KEY (ID_Tipo) REFERENCES TABELA_TIPOFUNCIONARIO(ID_Tipo)
);

INSERT INTO TABELA_FUNCIONARIOS (ID_Funcionario, ID_Tipo, Nome, Sobrenome, Salario) VALUES
(1, 1, 'John', 'Skyner', 120000),
(2, 1, 'Elisa', 'Albert', 125000),
(3, 2, 'Alice', 'Johnson', 110000),
(4, 4, 'Robert', 'Brown', 115000),
(5, 3, 'Laura', 'Williams', 130000),
(6, 3, 'James', 'Miller', 140000),
(7, 2, 'Sophia', 'Davis', 135000),
(8, 1, 'Michael', 'Garcia', 145000),
(9, 1, 'Emma', 'Rodriguez', 125000),
(10, 2, 'David', 'Martinez', 150000);


-- Table: TBL_TRIPULACAO
CREATE TABLE TBL_TRIPULACAO (
    ID_Tripulacao INT PRIMARY KEY,
    NomeMissao VARCHAR(255),
    ID_Funcionario INT,
    FOREIGN KEY (NomeMissao) REFERENCES TBL_MISSOES_TRIPULADAS(NomeMissao),
    FOREIGN KEY (ID_Funcionario) REFERENCES TABELA_FUNCIONARIOS(ID_Funcionario)
);

-- Inserir dados na tabela TBL_TRIPULACAO
INSERT INTO TBL_TRIPULACAO (ID_Tripulacao, NomeMissao, ID_Funcionario) VALUES
(1, 'Apollo 11', 1),         
(2, 'Demo-2', 2),            
(3, 'Mars Science Laboratory', 3), 
(4, 'Expedition 1', 4),     
(5, 'ISS Expedition 57', 5); 


-- Table: TBL_ESPECIALIZACAO
CREATE TABLE TBL_ESPECIALIZACAO (
    ID_Especializacao INT PRIMARY KEY,
    Especializacao VARCHAR(255)
);
-- Inserir dados na tabela TBL_ESPECIALIZACAO
INSERT INTO TBL_ESPECIALIZACAO (ID_Especializacao, Especializacao) VALUES
(1, 'Astrofísica'),
(2, 'Biologia Molecular'),
(3, 'Física de Partículas'),
(4, 'Engenharia Aeroespacial'),
(5, 'Ciências Planetárias');


-- Table: TABELA_CIENTISTA
CREATE TABLE TABELA_CIENTISTA (
    ID_Funcionario INT,
    AreaDePesquisa VARCHAR(255),
    ID_Especializacao INT,
    FOREIGN KEY (ID_Funcionario) REFERENCES TABELA_FUNCIONARIOS(ID_Funcionario),
    FOREIGN KEY (ID_Especializacao) REFERENCES TBL_ESPECIALIZACAO(ID_Especializacao)
);
-- Inserir dados na tabela TABELA_CIENTISTA
INSERT INTO TABELA_CIENTISTA (ID_Funcionario, AreaDePesquisa, ID_Especializacao) VALUES
(9, 'Astrofísica', 1),           
(4, 'Biologia Molecular', 2);    


-- Table: TABELA_ESPECIALIZACAO_CIENTISTA
CREATE TABLE TABELA_ESPECIALIZACAO_CIENTISTA (
    ID_Funcionario INT,
    ID_Especializacao INT,
    FOREIGN KEY (ID_Funcionario) REFERENCES TABELA_FUNCIONARIOS(ID_Funcionario),
    FOREIGN KEY (ID_Especializacao) REFERENCES TBL_ESPECIALIZACAO(ID_Especializacao)
);

INSERT INTO TABELA_ESPECIALIZACAO_CIENTISTA (ID_Funcionario, ID_Especializacao) VALUES
(9, 1),
(4, 2);


-- Table: TABELA_ASTRONAUTAS
CREATE TABLE TABELA_ASTRONAUTAS (
    ID_Funcionario INT,
    Status VARCHAR(255),
    FOREIGN KEY (ID_Funcionario) REFERENCES TABELA_FUNCIONARIOS(ID_Funcionario)
);
INSERT INTO TABELA_ASTRONAUTAS (ID_Funcionario, Status) VALUES
(1, 'Ativo'),      
(2, 'Ativo'),       
(4, 'Ativo'),       
(5, 'Desativado'),   
(8, 'Ativo');        

drop TABLE tbl_dados_financeiros;
-- Table: TBL_DADOS_FINANCEIROS
CREATE TABLE TBL_DADOS_FINANCEIROS (
    ID_DadoFinanceiro INT PRIMARY KEY,
    NomeMissao VARCHAR(255),
    Orçamento DECIMAL(15, 2),
    Gastos DECIMAL(15, 2),
    Receitas DECIMAL(15, 2),
    BalancosFinanceiros DECIMAL(15, 2),
    FOREIGN KEY (NomeMissao) REFERENCES TBL_MISSOES_TRIPULADAS_nao(NomeMissao)
);
-- Inserção de dados na tabela TBL_DADOS_FINANCEIROS
INSERT INTO TBL_DADOS_FINANCEIROS (ID_DadoFinanceiro, NomeMissao, Orçamento, Gastos, Receitas, BalancosFinanceiros) VALUES
(77711, 'Apollo 11', 500000.00, 480000.00, 520000.00, 40000.00),
(88822, 'Mars Science Laboratory', 1000000.00, 950000.00, 1050000.00, 100000.00),
(99933, 'Expedition 1', 200000.00, 180000.00, 220000.00, 40000.00),
(10044, 'ISS Expedition 57', 250000.00, 230000.00, 270000.00, 40000.00),
(10055, 'Demo-2', 300000.00, 290000.00, 310000.00, 20000.00);

DROP TABLE tbl_dados_cientificos;
-- Table: TBL_DADOS_CIENTIFICOS
-- Criar a tabela TBL_DADOS_CIENTIFICOS com a referência correta
CREATE TABLE TBL_DADOS_CIENTIFICOS (
    ID_DadoCientifico INT PRIMARY KEY,
    NomeMissao VARCHAR(255),
    DataDeLancamento DATE,
    Conteudo TEXT,
    FOREIGN KEY (NomeMissao) REFERENCES TBL_MISSOES_NAO_TRIPULADAS(NomeMissao)
);


INSERT INTO TBL_DADOS_CIENTIFICOS (ID_DadoCientifico, NomeMissao, DataDeLancamento, Conteudo) VALUES
(747576, 'Voyager 1', '1977-09-05', 'Imagens e dados sobre os planetas exteriores'),
(949596, 'New Horizons', '2006-01-19', 'Dados sobre Plutão e o Cinturão de Kuiper'),
(10567, 'Pioneer 10', '1972-03-02', 'Primeiros dados sobre o Cinturão de Asteroides'),
(10678, 'Cassini', '1997-10-15', 'Estudos sobre Saturno e seus anéis');

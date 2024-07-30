-- Junção Interna (INNER JOIN)
-- 1. Obter os nomes dos cientistas e suas especializações.
SELECT F.Nome AS Nome_Cientista,F.Sobrenome AS Sobrenome_Cientista,E.Especializacao
FROM TABELA_CIENTISTA C
INNER JOIN TABELA_FUNCIONÁRIOS F ON C.ID_Funcionário = F.ID_Funcionario
INNER JOIN Tbl_especializacao E ON C.ID_Especialização = E.ID_especializacao;

--2. Obter os nomes dos cometas e suas órbitas .
SELECT CC.Nome AS Nome_Cometa,C.Órbita
FROM TBL_COMETAS C
INNER JOIN TBL_CORPO_CELESTE CC ON C.ID_CorpoCeleste = CC.ID_CorpoCeleste;


--3 Obter os nomes das missões tripuladas 
SELECT M.NomeMissao
FROM TBL_MISSOES_TRIPULADAS M
INNER JOIN TBL_MISSOES_TRIPULADAS M2 ON M.NomeMissao = M2.NomeMissao;

--4 Obter os nomes dos planetas e suas composições.
SELECT C.Nome AS Nome_Planeta,P.Composição
FROM TBL_CORPO_CELESTE C
INNER JOIN TBL_PLANETAS P ON C.ID_CorpoCeleste = P.ID_CorpoCeleste;


-- Junção Externa Total (FULL OUTER JOIN)

-- 1. Mostrar sonda e seu histórico
SELECT s.Nome AS Nome_Sonda,m.NomeMissão,m.DataDeLançamento,m.Objetivos
FROM TBL_SONDAS s
LEFT JOIN  TBL_MISSOES_NÃO_TRIPULADAS m  ON s.ID_Sonda = m.ID_Sonda
UNION
SELECT s.Nome AS Nome_Sonda,m.NomeMissão,m.DataDeLançamento,m.Objetivos
FROM TBL_MISSOES_NÃO_TRIPULADAS m
RIGHT JOIN TBL_SONDAS s ON s.ID_Sonda = m.ID_Sonda;


-- 2. Mostrar todos os corpos celestes e suas características geológicas (incluindo todas as combinações)
-- Todos os corpos celestes e suas características geológicas (incluindo combinações não correspondentes)
SELECT c.Nome AS Nome_Corpo_Celeste,p.Características_Geológicas
FROM TBL_CORPO_CELESTE c
LEFT JOIN TBL_PLANETAS p ON c.ID_CorpoCeleste = p.ID_CorpoCeleste
UNION
SELECT c.Nome AS Nome_Corpo_Celeste,p.Características_Geológicas
FROM TBL_PLANETAS p
RIGHT JOIN TBL_CORPO_CELESTE c ON c.ID_CorpoCeleste = p.ID_CorpoCeleste;

-- 3. Obter todas as missões não tripuladas e seus dados científicos, se houver.
-- Todas as missões não tripuladas e seus dados científicos (incluindo combinações não correspondentes)
SELECT m.NomeMissão,m.DataDeLançamento AS DataLançamentoMissão,m.Objetivos,m.`Duracao`,d.DataDeLançamento AS DataLançamentoDados,d.Conteúdo
FROM TBL_MISSOES_NÃO_TRIPULADAS m
LEFT JOIN TABELA_DADOS_CIENTÍFICOS d ON m.NomeMissão = d.NomeMissão
UNION
SELECT  m.NomeMissão, m.DataDeLançamento AS DataLançamentoMissão, m.Objetivos, m.`Duracao`, d.DataDeLançamento AS DataLançamentoDados,d.Conteúdo
FROM TABELA_DADOS_CIENTÍFICOS d
RIGHT JOIN TBL_MISSOES_NÃO_TRIPULADAS m ON m.NomeMissão = d.NomeMissão;


--4 

-- Junção Externa à Esquerda (LEFT OUTER JOIN)

--1 Obter todas as missões tripuladas e as naves associadas, se houver.
SELECT M.NomeMissao AS Nome_Missao,N.Nome AS Nome_Nave
FROM TBL_MISSOES_TRIPULADAS M
LEFT OUTER JOIN TBL_NAVES N ON M.ID_Nave = N.ID_Nave;


-- 2. Mostrar todas as missões não tripuladas e as naves associadas (incluindo missões sem naves e naves sem missões)
-- Todas as missões não tripuladas e suas naves associadas (incluindo missões sem naves e naves sem missões)
SELECT m.NomeMissão AS NomeMissaoNaoTripulada,m.DataDeLançamento AS DataLancamentoMissao,m.Objetivos AS ObjetivosMissao,m.`Duracao` AS DuracaoMissao,n.Nome AS NomeNave,n.Status AS StatusNave
FROM TBL_MISSOES_NÃO_TRIPULADAS m
LEFT JOIN TBL_NAVES n ON m.ID_Sonda = n.ID_Nave

--3. Obter todos os planetas e suas atmosferas, se houver.
SELECT C.Nome AS Nome_Planeta,P.Atmosfera AS Atmosfera
FROM TBL_CORPO_CELESTE C
LEFT OUTER JOIN  TBL_PLANETAS P ON C.ID_CorpoCeleste = P.ID_CorpoCeleste
WHERE  C.ID_CorpoCeleste IN (SELECT ID_CorpoCeleste FROM TBL_PLANETAS);

-- 4.Obter todas as naves e os históricos associados, se houver.
-- Todas as naves e seus históricos associados (se houver)
SELECT n.ID_Nave AS IDNave,n.Nome AS NomeNave,n.Status AS StatusNave,t.ID_Tripulacao AS IDTripulacao,t.NomeMissão AS NomeMissao,t.ID_Funcionario AS IDFuncionario
FROM TBL_NAVES n
LEFT JOIN tbl_tripulação t ON n.ID_Nave = t.ID_Funcionario


-- Junção Externa à Direita (RIGHT JOIN)
--1.Obter todos os funcionários e seus setores, se houver.
SELECT F.Nome AS Nome_Funcionario,F.Sobrenome AS Sobrenome_Funcionario,T.Tipo AS Setor
FROM TABELA_FUNCIONÁRIOS F
RIGHT JOIN TBL_TIPO_FUNCIONARIO T ON F.id_tipo = T.ID_Tipo;

--2.Obter todos os cometas e seus tipos de coma, se houver.
SELECT C.ID_CorpoCeleste,C.Órbita AS Orbita_Cometa,C.Tipodecoma AS Tipo_de_Coma
FROM TBL_COMETAS C
RIGHT JOIN TBL_CORPO_CELESTE C2 ON C.ID_CorpoCeleste = C2.ID_CorpoCeleste;

--3.Obter todos os detalhes das missões tripuladas, se houver
SELECT M.NomeMissao,M.DataDeLancamento,M.Duracao,M.Objetivos,N.Nome AS Nome_Nave
FROM TBL_MISSOES_TRIPULADAS M
RIGHT JOIN TBL_NAVES N ON M.ID_Nave = N.ID_Nave;

--4.Obter todas as galáxias e suas propriedades, se houver.

SELECT G.Nome AS Nome_Galaxia,G.ID_Galáxia,C.Nome AS Nome_Corpo_Celeste
FROM TBL_GALÁXIAS G
RIGHT JOIN TBL_CORPO_CELESTE C ON G.ID_Galáxia = C.ID_CorpoCeleste;  -- Assumindo que C.ID_CorpoCeleste pode ter a relação com galáxias, se existir

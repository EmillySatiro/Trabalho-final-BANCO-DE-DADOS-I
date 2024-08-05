-- Quatro consultas para cada tipo de junção (interna, externa total, externa à esquerda, externa à direita).
-- Junção Interna (INNER JOIN)

--1.Obter os nomes dos cientistas e suas especializações
SELECT F.Nome AS Nome_Cientista,E.Especializacao AS Especializacao
FROM TABELA_CIENTISTA C
INNER JOIN TABELA_FUNCIONARIOS F ON C.ID_Funcionario = F.ID_Funcionario
INNER JOIN TBL_ESPECIALIZACAO E ON C.ID_Especializacao = E.ID_Especializacao;

--2.Obter os nomes dos cometas e suas órbitas
SELECT CC.Nome AS Nome_Cometa,C.Orbita AS Orbita
FROM TBL_COMETAS C
INNER JOIN TBL_CORPO_CELESTE CC ON C.ID_CorpoCeleste = CC.ID_CorpoCeleste;

--3 Obter os nomes das missões tripuladas(simplificado por motivos de implementação prof)
SELECT NomeMissao
FROM TBL_MISSOES_TRIPULADAS;

--4.Obter os nomes dos planetas e suas composições
SELECT CC.Nome AS Nome_Planeta, P.Composicao AS Composicao
FROM TBL_PLANETAS P
INNER JOIN TBL_CORPO_CELESTE CC ON P.ID_CorpoCeleste = CC.ID_CorpoCeleste;

--Junção Externa Total (FULL OUTER JOIN)(o sql não supor diretamente então alterei)

--1.Obter todas as sondas e seus status, se houver
-- Sondas e seus status (utilizando LEFT JOIN e RIGHT JOIN para simular FULL OUTER JOIN)
SELECT S.ID_Sonda,S.Nome AS Nome_Sonda,S.Status AS Status_Sonda
FROM TBL_SONDAS S
LEFT JOIN TBL_NAVES N ON S.ID_Sonda = N.ID_Nave
UNION
SELECT S.ID_Sonda,S.Nome AS Nome_Sonda,S.Status AS Status_Sonda
FROM TBL_SONDAS S
RIGHT JOIN TBL_NAVES N ON S.ID_Sonda = N.ID_Nave
WHERE S.ID_Sonda IS NULL;


--2 Obter todos os corpos celestes e seus nomes
-- Todos os corpos celestes e seus nomes (utilizando LEFT JOIN e RIGHT JOIN para simular FULL OUTER JOIN)
SELECT CC.ID_CorpoCeleste,CC.Nome AS Nome_Corpo_Celeste
FROM TBL_CORPO_CELESTE CC
LEFT JOIN 
    (SELECT DISTINCT ID_CorpoCeleste FROM TBL_PLANETAS
     UNION 
     SELECT DISTINCT ID_CorpoCeleste FROM TBL_COMETAS
     UNION 
     SELECT DISTINCT ID_CorpoCeleste FROM TBL_ESTRELAS
     UNION 
     SELECT DISTINCT ID_CorpoCeleste FROM TBL_NEBULOSA) AS Subquery
ON 
    CC.ID_CorpoCeleste = Subquery.ID_CorpoCeleste
UNION
SELECT CC.ID_CorpoCeleste,CC.Nome AS Nome_Corpo_Celeste
FROM 
    (SELECT DISTINCT ID_CorpoCeleste FROM TBL_PLANETAS
     UNION 
     SELECT DISTINCT ID_CorpoCeleste FROM TBL_COMETAS
     UNION 
     SELECT DISTINCT ID_CorpoCeleste FROM TBL_ESTRELAS
     UNION 
     SELECT DISTINCT ID_CorpoCeleste FROM TBL_NEBULOSA) AS Subquery
LEFT JOIN 
    TBL_CORPO_CELESTE CC
ON 
    Subquery.ID_CorpoCeleste = CC.ID_CorpoCeleste
WHERE 
    CC.ID_CorpoCeleste IS NULL;

--3 Obter todas as missões não tripuladas e seus dados científicos, se houver
-- Missões não tripuladas e seus dados científicos (utilizando LEFT JOIN e RIGHT JOIN para simular FULL OUTER JOIN)
SELECT M.NomeMissao AS NomeMissao_Nao_Tripulada,DC.Conteudo AS Conteudo_Dado_Cientifico
FROM TBL_MISSOES_NAO_TRIPULADAS M
LEFT JOIN TBL_DADOS_CIENTIFICOS DC ON M.NomeMissao = DC.NomeMissao
UNION
SELECT DC.NomeMissao AS NomeMissao_Nao_Tripulada, DC.Conteudo AS Conteudo_Dado_Cientifico
FROM TBL_DADOS_CIENTIFICOS DC
LEFT JOIN TBL_MISSOES_NAO_TRIPULADAS M ON DC.NomeMissao = M.NomeMissao
WHERE M.NomeMissao IS NULL;

--4 Obter todas as naves e seus status
SELECT ID_Nave, Nome, 
    Status
FROM TBL_NAVES;

--Junção Externa à Esquerda (LEFT OUTER JOIN)
--1.Obter todas as missões tripuladas e as naves associadas, se houver
SELECT MT.NomeMissao,MT.DataDeLancamento,MT.Duracao,MT.Objetivos,N.Nome AS NomeNave,N.Status AS StatusNave
FROM TBL_MISSOES_TRIPULADAS MT
LEFT JOIN TBL_NAVES N ON MT.ID_Nave = N.ID_Nave;

--2 Obter todas as missões não tripuladas e seus objetivos
SELECT NomeMissao,Objetivos
FROM TBL_MISSOES_NAO_TRIPULADAS;

--.3 Obter todos os planetas e suas atmosferas, se houver
SELECT C.Nome AS NomePlaneta,P.Atmosfera
FROM TBL_CORPO_CELESTE C
LEFT JOIN TBL_PLANETAS P ON C.ID_CorpoCeleste = P.ID_CorpoCeleste
WHERE C.ID_CorpoCeleste IN (SELECT ID_CorpoCeleste FROM TBL_PLANETAS);

--4 Obter todos os astronautas e seus respectivos status
SELECT F.Nome,F.Sobrenome,
    A.Status
FROM TABELA_ASTRONAUTAS A
LEFT JOIN TABELA_FUNCIONARIOS F ON A.ID_Funcionario = F.ID_Funcionario;

--Junção Externa à Direita (RIGHT OUTER JOIN)
--1 Obter todos os funcionários e seus salários
SELECT f.ID_Funcionario, f.Nome, f.Sobrenome, f.Salario, t.TipoFuncionario
FROM TABELA_FUNCIONARIOS f
RIGHT OUTER JOIN TABELA_TIPOFUNCIONARIO t
ON f.ID_Tipo = t.ID_Tipo;

--2 Obter todos os cometas e seus tipos de coma, se houver
SELECT c.ID_CorpoCeleste, c.Orbita, c.Tipo_de_coma, c.Posicao
FROM TBL_COMETAS c
RIGHT OUTER JOIN TBL_CORPO_CELESTE cc
ON c.ID_CorpoCeleste = cc.ID_CorpoCeleste;


--3 Obter todas as datas das missões tripuladas(mudança a nivel de implementação)

SELECT NomeMissao, DataDeLancamento
FROM TBL_MISSOES_TRIPULADAS
UNION
SELECT NomeMissao, DataDeLancamento
FROM TBL_MISSOES_NAO_TRIPULADAS;


--4 Obter todas as galáxias e seus nomes
SELECT g.ID_Galaxia, g.Nome
FROM TBL_GALAXIAS g
RIGHT OUTER JOIN TBL_MISSOES_TRIPULADAS m
ON g.ID_Galaxia = m.ID_Galaxia;

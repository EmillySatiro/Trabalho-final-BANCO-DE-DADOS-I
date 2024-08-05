--Cinco consultas que utilizem os operadores de intersecção, união ou subtração.

--1.União entre missões tripuladas e missões não tripuladas
SELECT NomeMissao AS NomeMissao
FROM TBL_MISSOES_TRIPULADAS
UNION
SELECT NomeMissao AS NomeMissao
FROM TBL_MISSOES_NAO_TRIPULADAS;

--2.Intersecção entre as sondas e naves que estão ativas(mudança a nivel de implementaçao)
SELECT 'Sonda' AS Tipo, Nome
FROM TBL_SONDAS
WHERE Status = 'Ativa'
UNION ALL
SELECT 'Nave' AS Tipo, Nome
FROM TBL_NAVES
WHERE Status = 'Ativa';
--3.Subtração entre naves e sondas para obter somente as sondas inativas

SELECT Nome
FROM TBL_SONDAS
WHERE Status = 'Inativa'
AND Nome NOT IN (
    SELECT Nome
    FROM TBL_NAVES
);

--4 Subtração entre naves e sondas para obter somente as sondas ativas
SELECT Nome
FROM TBL_SONDAS
WHERE Status = 'Ativa'
AND Nome NOT IN (
    SELECT Nome
    FROM TBL_NAVES
);

--5.União entre todos os cometas e estrelas cadastrados
SELECT TCC.Nome
FROM TBL_COMETAS TC
JOIN TBL_CORPO_CELESTE TCC ON TC.ID_CorpoCeleste = TCC.ID_CorpoCeleste
UNION
SELECT TCC.Nome
FROM TBL_ESTRELAS TE
JOIN TBL_CORPO_CELESTE TCC ON TE.ID_CorpoCeleste = TCC.ID_CorpoCeleste;
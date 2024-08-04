-- Cinco consultas que utilizem os operadores de intersecção, união ou subtração
USE kk;

--União entre todos os funcionários cadastrados como engenheiro e como cientistas
SELECT tf.id_tipo,tf.Nome
FROM TABELA_FUNCIONÁRIOS tf
WHERE id_tipo = 2
UNION
SELECT f.id_tipo,f.Nome
FROM TABELA_FUNCIONÁRIOS f
WHERE id_tipo = 1;

--Intersecção entre as sondas e naves que estão ativas// consulta em analise
SELECT S.Nome AS Nome_Sonda,N.Nome AS Nome_Nave, S.`Status` AS Status_Sonda
FROM TBL_SONDAS S
INNER JOIN TBL_NAVES N ON S.Status = 'Ativa' AND N.Status = 'Ativa';

--Subtração entre naves e sondas para obter somente as sondas inativas
SELECT Nome, Status
FROM TBL_SONDAS
WHERE Status = 'Desativada'
EXCEPT
SELECT Nome, Status
FROM TBL_NAVES;

--Subtração entre naves e sondas para obter somente as sondas ativas
SELECT Nome, Status
FROM TBL_SONDAS
WHERE Status = 'Ativa'
EXCEPT
SELECT Nome, Status
FROM TBL_NAVES;

--União entre todos os cometas e estrelas cadastrados 
SELECT Nome
FROM TBL_CORPO_CELESTE
WHERE ID_CorpoCeleste IN (SELECT ID_CorpoCeleste FROM TBL_COMETAS)
UNION
SELECT Nome
FROM TBL_CORPO_CELESTE
WHERE ID_CorpoCeleste IN (SELECT ID_CorpoCeleste FROM TBL_ESTRELAS);

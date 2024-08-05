-- Consultas utilizando Funções Agregadas

--1. Contar quantas naves estão inativas
SELECT COUNT(*) AS TotalNavesInativas
FROM TBL_NAVES
WHERE Status = 'Inativa';

--2.Selecionar o ID da menor estrela
SELECT ID_CorpoCeleste
FROM TBL_ESTRELAS
ORDER BY Tamanho ASC
LIMIT 1;

--3. Calcular a média de orçamento das missões tripuladas
SELECT AVG(Orçamento) AS MediaOrçamento
FROM TBL_DADOS_FINANCEIROS
WHERE NomeMissao IN (SELECT NomeMissao FROM TBL_MISSOES_TRIPULADAS);

--4.Selecionar o ID da estrela mais distante
SELECT ID_CorpoCeleste
FROM TBL_ESTRELAS
ORDER BY Distancia DESC
LIMIT 1;

--5.Calcular o total de missões (tripuladas e não tripuladas)
SELECT COUNT(*) AS TotalMissoes
FROM (
    SELECT NomeMissao FROM TBL_MISSOES_TRIPULADAS
    UNION
    SELECT NomeMissao FROM TBL_MISSOES_NAO_TRIPULADAS
) AS TodasMissoes;

--6.Encontrar a média de duração das missões tripuladas em dias
SELECT AVG(DATEDIFF(DATE_ADD(DataDeLancamento, INTERVAL Duracao DAY), DataDeLancamento)) AS MediaDuracao
FROM TBL_MISSOES_TRIPULADAS;

--7. Contar o total de cientistas por área de pesquisa
SELECT AreaDePesquisa, COUNT(*) AS TotalCientistas
FROM TABELA_CIENTISTA
GROUP BY AreaDePesquisa;

--8.Calcular a média de gastos das missões
SELECT AVG(Gastos) AS MediaGastos
FROM TBL_DADOS_FINANCEIROS;

--9.Encontrar a missão com o maior número de astronautas
SELECT NomeMissao
FROM (
    SELECT NomeMissao, COUNT(ID_Funcionario) AS TotalAstronautas
    FROM TBL_TRIPULACAO
    GROUP BY NomeMissao
) AS MissaoAstronautas
ORDER BY TotalAstronautas DESC
LIMIT 1;


--10 Encontrar a missão tripulada mais recente
SELECT NomeMissao
FROM TBL_MISSOES_TRIPULADAS
ORDER BY DataDeLancamento DESC
LIMIT 1;

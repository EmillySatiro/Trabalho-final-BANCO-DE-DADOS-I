-- Consultas utilizando Funções Agregadas

--1.Número total de engenheiros por especialização
SELECT e.Tipo AS Especializacao,COUNT(f.ID_Funcionario) AS TotalEngenheiros
FROM TABELA_FUNCIONÁRIOS f
JOIN tbl_tipo_funcionario e ON f.id_tipo = e.ID_Tipo
WHERE f.id_tipo = 2  -- Tipo 2 é Engenheiro
GROUP BY e.Tipo;

--2.Encontrar a média de orçamento das missões tripuladas
SELECT AVG(Orçamento) AS MediaOrcamento
FROM TABELA_DADOS_FINANCEIROS;

--3.Contar o número total de missões por ano
SELECT YEAR(DataDeLancamento) AS Ano,COUNT(*) AS TotalMissao
FROM TBL_MISSOES_TRIPULADAS
GROUP BY YEAR(DataDeLancamento);

--SEM FUNÇÃO DE EXTRAÇÃO:

--.numero total de missões(tripuladas e não tripuladas)
SELECT 
    (SELECT COUNT(*) FROM TBL_MISSOES_TRIPULADAS) +
    (SELECT COUNT(*) FROM TBL_MISSOES_NÃO_TRIPULADAS) AS TotalMissões
;

--4.Contar quantas naves estão inativas
SELECT COUNT(*) AS Total_Naves_Inativas
FROM TBL_NAVES
WHERE Status = 'Desativada';


--5.Encontrar a missão com a maior quantidade total de dados científicos coletados
SELECT d.`NomeMissão`,SUM(d.`ID_dados_científicos`) AS TotalDados
FROM tabela_dados_científicos d
GROUP BY d.`NomeMissão`
ORDER BY TotalDados DESC
LIMIT 1;

--6.Encontrar a média de duração das missões tripuladas
-- Para calcular a média da duração das missões tripuladas em dias
SELECT AVG(CAST(SUBSTRING_INDEX(Duracao, ' ', 1) AS DECIMAL)) AS MediaDuracao
FROM TBL_MISSOES_TRIPULADAS;

--7.Encontrar a missão mais recente
SELECT NomeMissao,MAX(DataDeLancamento) AS DataRecente
FROM TBL_MISSOES_TRIPULADAS
GROUP BY NomeMissao
ORDER BY DataRecente DESC
LIMIT 1;

--8.Contar o número total de cientistas por área de pesquisa
SELECT ÁreaDePesquisa, COUNT(*) AS TotalCientistas
FROM TABELA_CIENTISTA
GROUP BY ÁreaDePesquisa;

--9.Encontrar a média de gastos das missões
SELECT AVG(Gastos) AS MediaGastos
FROM TABELA_DADOS_FINANCEIROS;

--10Encontrar a missão com o maior número de astronautas
SELECT NomeMissão, COUNT(ID_Funcionario) AS TotalAstronautas
FROM tbl_tripulação
GROUP BY NomeMissão
ORDER BY TotalAstronautas DESC
LIMIT 1;
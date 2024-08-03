@ -1,22 +1,74 @@
-- Consultas utilizando Funções Agregadas

-- 1. Contar quantas naves estão inativas
select count(*) as Naves_Inativas
from interstellarinsight.tbl_naves as Inativas
where Status = 'Desativada';

-- 2. Selecionar o ID da menor estrela
SELECT ID_CorpoCeleste AS ID_MenorEstrela
FROM interstellarinsight.tbl_estrelas
WHERE Tamanho = (SELECT MIN(Tamanho) FROM interstellarinsight.tbl_estrelas);

-- 3. Calcular a média de orçamento das missões tripuladas
SELECT AVG(Orçamento) AS MediaOrcamento
FROM interstellarinsight.TABELA_DADOS_FINANCEIROS;

-- 4. Selecionar o ID da estrela mais distante
select ID_CorpoCeleste as ID_MaiorDistancia
from interstellarinsight.tbl_estrelas
where Distância = (select max(Distância) from interstellarinsight.tbl_estrelas);

-- 5. Calcular o total de missões (tripuladas e não tripuladas)
SELECT 
    (SELECT COUNT(*) FROM interstellarinsight.TBL_MISSÕES_TRIPULADAS) +
    (SELECT COUNT(*) FROM interstellarinsight.TBL_MISSOES_NÃO_TRIPULADAS) AS TotalMissoes
;

-- 6. Encontrar a média de duração das missões tripuladas em dias
SELECT AVG(Duração) AS MediaDuracao
FROM interstellarinsight.tbl_missões_tripuladas;

-- 7. Contar o total de cientistas por área de pesquisa
SELECT ÁreaDePesquisa, COUNT(*) AS TotalCientistas
FROM interstellarinsight.TABELA_CIENTISTA
GROUP BY ÁreaDePesquisa;

-- 8. Calcular a média de gastos das missões
SELECT AVG(Gastos) AS MediaGastos
FROM TABELA_DADOS_FINANCEIROS;

-- 9. Encontrar a missão com o maior número de astronautas
SELECT NomeMissão, COUNT(ID_Funcionário) AS TotalAstronautas
FROM interstellarinsight.tbl_tripulação
GROUP BY NomeMissão
ORDER BY TotalAstronautas DESC
LIMIT 1;

-- 10. Encontrar a missão tripulada mais recente
SELECT NomeMissão
FROM interstellarinsight.tbl_missões_tripuladas
ORDER BY DataDeLançamento DESC
LIMIT 1;

-- 1. Consulta sobre planetas e suas características geológicas
-- Mostrar o Nome dos planetas, Distancia e Características Geológicas
SELECT c.Nome AS Nome_Planeta, p.Distância, p.Características_Geológicas
FROM TBL_PLANETAS p
JOIN TBL_CORPO_CELESTE c ON p.ID_CorpoCeleste = c.ID_CorpoCeleste;

-- 2. Consulta sobre cometas e missões  associadas
-- Mostrar o ID dos cometas, das missões associadas
SELECT c.ID_CorpoCeleste AS ID_Cometa, m.`NomeMissão` AS Nome_Missao
FROM TBL_COMETAS c
JOIN tbl_missoes_não_tripuladas m ON c.ID_CorpoCeleste = m.ID_CorpoCeleste;
   

-- 3. Consulta sobre estrelas e as missões associadas
-- Mostrar o Nome das estrelas, Nome das missões não tripuladas associadas
SELECT c.Nome AS Nome_Estrela, m.`NomeMissão` 
FROM TBL_CORPO_CELESTE c
JOIN tbl_missoes_não_tripuladas m ON c.ID_CorpoCeleste = m.ID_CorpoCeleste
WHERE c.ID_CorpoCeleste = m.ID_CorpoCeleste;

-- 4. Quantidade de missões tripuladas em cada galaxia 
SELECT g.Nome AS Nome_Galaxia, COUNT(mt.NomeMissao) AS Quantidade_Missoes_Tripuladas
FROM TBL_GALÁXIAS g
JOIN TBL_MISSOES_TRIPULADAS mt ON g.ID_Galáxia = mt.ID_Galáxia
GROUP BY g.ID_Galáxia, g.Nome;


-- 5. Consulta sobre funcionários, setores e tipos de funcionários
-- Mostrar o ID dos funcionários, Status e Tipo de Funcionário
SELECT 
    f.ID_Funcionario AS ID_Funcionario,
    t.Tipo AS Tipo_Funcionario
FROM 
    TABELA_FUNCIONÁRIOS f
JOIN 
    tbl_tipo_funcionario t 
ON 
    f.`ID_Funcionario` = t.ID_Tipo;

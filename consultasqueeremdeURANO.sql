-- 1. Consulta sobre planetas e suas características geológicas
-- Mostrar o Nome dos planetas, Distancia e Características Geológicas
SELECT c.Nome AS Nome_Planeta, p.Distância, p.Características_Geológicas
FROM TBL_PLANETAS p
JOIN TBL_CORPO_CELESTE c ON p.ID_CorpoCeleste = c.ID_CorpoCeleste;

-- 2. Consulta sobre cometas e missões  associadas
-- Mostrar o ID dos cometas, das missões associadas
--erro 
SELECT c.ID_CorpoCeleste AS ID_Cometa, m.ID_Sonda AS ID_Missao
FROM TBL_COMETAS c
JOIN TBL_MISSOES_NÃO_TRIPULADAS m ON c.ID_CorpoCeleste = m.ID_CorpoCeleste;


-- 3. Consulta sobre estrelas e as missões associadas
-- Mostrar o Nome das estrelas, Sistema e Nome das missões não tripuladas associadas
SELECT ce.Nome AS Nome_Estrela, e.Sistema, m.NomeMissão
FROM TBL_ESTRELAS e
JOIN TBL_CORPO_CELESTE ce ON e.ID_CorpoCeleste = ce.ID_CorpoCeleste
LEFT JOIN TBL_MISSOES_NÃO_TRIPULADAS m ON e.ID_CorpoCeleste = m.ID_CorpoCeleste; -- ta ficando null pq ta com um erro no banco 

-- 4. Quantidade de missões tripuladas em cada galaxia 
SELECT g.Nome AS Nome_Galáxia, COUNT(m.NomeMissão) AS Quantidade_Missoes
FROM TBL_GALÁXIAS g
LEFT JOIN TBL_MISSOES_GALAXIAS m ON g.ID_Galáxia = m.ID_Galáxia
GROUP BY g.ID_Galáxia, g.Nome;

-- 5. Consulta sobre funcionários, setores e tipos de funcionários
-- Mostrar o ID dos funcionários, Status e Tipo de Funcionário
SELECT f.ID_Funcionario, f.Status, tf.Tipo_Funcionario
FROM TBL_FUNCIONARIOS f
INNER JOIN TABELA_TIPO_FUNCIONARIOS tf ON f.ID_Funcionario = tf.ID_Funcionario;

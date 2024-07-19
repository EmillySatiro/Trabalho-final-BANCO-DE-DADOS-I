-- 1. Consulta sobre planetas e suas características geológicas
-- Mostrar o Nome dos planetas, Distancia e Características Geológicas
SELECT p.Nome, p.Distancia, c.CaracteristicasGeologicas
FROM TBL_PLANETAS p
INNER JOIN TBL_CARACTERISTICAS_GEOLOGICAS c ON p.ID_CorpoCeleste = c.ID_CorpoCeleste;

-- 2. Consulta sobre cometas e missões não tripuladas associadas
-- Mostrar o Nome dos cometas, Orbita e Nome das missões não tripuladas associadas
SELECT c.Nome, c.Orbita, m.NomeMissao
FROM TBL_COMETAS c
INNER JOIN TBL_MISSOES_NAO_TRIPULADAS m ON c.ID_CorpoCeleste = m.ID_CorpoCeleste;

-- 3. Consulta sobre estrelas e as missões associadas
-- Mostrar o Nome das estrelas, Sistema e Nome das missões não tripuladas associadas
SELECT e.Nome, e.Sistema, m.NomeMissao
FROM TBL_ESTRELAS e
INNER JOIN TBL_MISSOES_NAO_TRIPULADAS m ON e.ID_CorpoCeleste = m.ID_CorpoCeleste;

-- 4. Consulta sobre galáxias e seu histórico
-- Mostrar o Nome das galáxias e o ID do histórico associado
SELECT g.Nome, h.ID_Historico
FROM TBL_GALAXIAS g
INNER JOIN TBL_HISTORICO_GALAXIAS h ON g.ID_Galaxia = h.ID_Galaxia;

-- 5. Consulta sobre funcionários, setores e tipos de funcionários
-- Mostrar o ID dos funcionários, Status e Tipo de Funcionário
SELECT f.ID_Funcionario, f.Status, tf.Tipo_Funcionario
FROM TBL_FUNCIONARIOS f
INNER JOIN TABELA_TIPO_FUNCIONARIOS tf ON f.ID_Funcionario = tf.ID_Funcionario;

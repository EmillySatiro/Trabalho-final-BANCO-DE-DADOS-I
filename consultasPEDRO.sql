-- 1.1 Obter os nomes dos corpos celestes e suas características geológicas
SELECT c.nome AS NomeCorpoCeleste, g.CaracteristicasGeologicas
FROM TBL_CORPO_CELESTE c
JOIN TBL_CARACTERISTICAS_GEOLOGICAS g ON c.ID_CorpoCeleste = g.ID_CorpoCeleste;

-- 1.2 Obter os nomes dos cometas e suas órbitas
SELECT c.nome AS NomeCometa, co.Orbita
FROM TBL_CORPO_CELESTE c
JOIN TBL_COMETAS co ON c.ID_CorpoCeleste = co.ID_CorpoCeleste;

-- 1.3 Obter os nomes das missões tripuladas e as naves associadas
SELECT m.NomeMissao, n.Nome AS NomeNave
FROM TBL_MISSOES_TRIPULADAS m
JOIN TBL_NOMEMISSAO_NAVE mn ON m.NomeMissao = mn.NomeMissao
JOIN TBL_NAVES n ON mn.ID_Nave = n.ID_Nave;

-- 1.4 Obter os nomes dos funcionários e seus setores
SELECT f.ID_Funcionario, t.TipoFuncionario AS Setor
FROM TBL_FUNCIONARIOS f
JOIN TABELA_TIPO_FUNCIONARIOS t ON f.ID_Funcionario = t.ID_Funcionario;

-- 2.1 Obter todas as sondas e seus históricos, se houver
SELECT s.Nome AS NomeSonda, h.ID_Historico
FROM TBL_SONDAS s
LEFT JOIN TBL_HISTORICO_SONDAS h ON s.ID_Sonda = h.ID_Sonda;

-- 2.3 Obter todas as missões não tripuladas e seus dados científicos, se houver

-- 2.4 Obter todas as naves e os nomes das missões associadas, se houver
SELECT n.Nome AS NomeNave, m.NomeMissao
FROM TBL_NAVES n
LEFT JOIN TBL_NOMEMISSAO_NAVE mn ON n.ID_Nave = mn.ID_Nave
LEFT JOIN TBL_MISSOES_TRIPULADAS m ON mn.NomeMissao = m.NomeMissao;

-- 3.1 Obter todas as missões tripuladas e as naves associadas, se houver
SELECT m.NomeMissao, n.Nome AS NomeNave
FROM TBL_MISSOES_TRIPULADAS m
LEFT JOIN TBL_NOMEMISSAO_NAVE mn ON m.NomeMissao = mn.NomeMissao
LEFT JOIN TBL_NAVES n ON mn.ID_Nave = n.ID_Nave;

-- 3.2 Obter todas as missões não tripuladas e os funcionários associados, se houver

-- 3.3 Obter todas as sondas e os históricos associados, se houver
SELECT s.Nome AS NomeSonda, h.ID_Historico
FROM TBL_SONDAS s
LEFT JOIN TBL_HISTORICO_SONDAS h ON s.ID_Sonda = h.ID_Sonda;

-- 3.4 Obter todas as naves e os históricos associados, se houver
SELECT n.Nome AS NomeNave, h.ID_Historico
FROM TBL_NAVES n
LEFT JOIN TBL_HISTORICO_NAVES h ON n.ID_Nave = h.ID_Nave;

-- 4.1 Obter todos os funcionários e seus setores, se houver
SELECT f.ID_Funcionario, t.TipoFuncionario AS Setor
FROM TBL_FUNCIONARIOS f
LEFT JOIN TABELA_TIPO_FUNCIONARIOS t ON f.ID_Funcionario = t.ID_Funcionario;

-- 4.2 Obter todos os cometas e suas órbitas, se houver
-- Esta consulta já está coberta pela 1.2

-- 4.3 Obter todas as missões tripuladas e as naves associadas, se houver
-- Esta consulta já está coberta pela 1.3

-- 4.4 Obter todas as naves e os históricos associados, se houver
-- Esta consulta já está coberta pela 3.4

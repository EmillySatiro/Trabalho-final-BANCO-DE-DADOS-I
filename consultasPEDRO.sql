-- Junção Interna (INNER JOIN)
-- 1. Mostrar planetas e suas características geológicas

SELECT p.ID_CorpoCeleste, p.Distancia, p.Tamanho, p.Composicao, p.atmosfera, c.CaracteristicasGeologicas
FROM TBL_PLANETAS p
INNER JOIN TBL_CARACTERISTICAS_GEOLOGICAS c ON p.ID_CorpoCeleste = c.ID_CorpoCeleste;

-- 2. Mostrar missões tripuladas e as naves usadas
SELECT m.NomeMissao, n.Nome
FROM TBL_MISSOES_TRIPULADAS m
INNER JOIN TBL_NOMEMISSAO_NAVE nn ON m.NomeMissao = nn.NomeMissao
INNER JOIN TBL_NAVES n ON nn.ID_Nave = n.ID_Nave;

-- 3. Mostrar cientistas e suas especializações
SELECT f.ID_Funcionario, f.Status, c.AreaDePesquisa, e.Especializacao
FROM TBL_CIENTISTAS c
INNER JOIN TBL_FUNCIONARIOS f ON c.ID_Funcionario = f.ID_Funcionario
INNER JOIN TABELA_ESPECIALIZACAO_CIENTISTA e ON c.Especializacao = e.ID_especializacao;

-- 4. Mostrar sonda e seu histórico
SELECT s.Nome, h.ID_Historico
FROM TBL_SONDAS s
INNER JOIN TBL_HISTORICO_SONDAS h ON s.ID_Sonda = h.ID_Sonda;

-- Junção Externa Total (FULL OUTER JOIN)
-- 1. Mostrar todos os corpos celestes e suas características geológicas (incluindo todas as combinações)
SELECT c.ID_CorpoCeleste, c.nome, cg.CaracteristicasGeologicas
FROM TBL_CORPO_CELESTE c
LEFT JOIN TBL_CARACTERISTICAS_GEOLOGICAS cg ON c.ID_CorpoCeleste = cg.ID_CorpoCeleste
UNION
SELECT c.ID_CorpoCeleste, c.nome, cg.CaracteristicasGeologicas
FROM TBL_CORPO_CELESTE c
RIGHT JOIN TBL_CARACTERISTICAS_GEOLOGICAS cg ON c.ID_CorpoCeleste = cg.ID_CorpoCeleste;

-- 2. Mostrar todos os funcionários e suas missões (incluindo funcionários sem missões e missões sem funcionários)
SELECT f.ID_Funcionario, m.NomeMissao
FROM TBL_FUNCIONARIOS f
LEFT JOIN TBL_FUNCIONARIOS_TRIPULACAO ft ON f.ID_Funcionario = ft.ID_Funcionario
LEFT JOIN TBL_TRIPULACAO t ON ft.ID_Tripulacao = t.ID_Tripulacao
LEFT JOIN TBL_MISSOES_TRIPULADAS m ON t.NomeMissao = m.NomeMissao
UNION
SELECT f.ID_Funcionario, m.NomeMissao
FROM TBL_MISSOES_TRIPULADAS m
RIGHT JOIN TBL_TRIPULACAO t ON m.NomeMissao = t.NomeMissao
RIGHT JOIN TBL_FUNCIONARIOS_TRIPULACAO ft ON t.ID_Tripulacao = ft.ID_Tripulacao
RIGHT JOIN TBL_FUNCIONARIOS f ON ft.ID_Funcionario = f.ID_Funcionario;

-- 3. Mostrar todos os cometas e suas características (incluindo cometas sem características e características sem cometas)
SELECT c.ID_CorpoCeleste, c.nome, cm.Orbita, cm.TipoDeComa, cm.Posicao
FROM TBL_CORPO_CELESTE c
LEFT JOIN TBL_COMETAS cm ON c.ID_CorpoCeleste = cm.ID_CorpoCeleste
UNION
SELECT c.ID_CorpoCeleste, c.nome, cm.Orbita, cm.TipoDeComa, cm.Posicao
FROM TBL_COMETAS cm
RIGHT JOIN TBL_CORPO_CELESTE c ON cm.ID_CorpoCeleste = c.ID_CorpoCeleste;

-- 4. Mostrar todas as missões não tripuladas e as naves associadas (incluindo missões sem naves e naves sem missões)
SELECT m.NomeMissao, n.Nome
FROM TBL_MISSOES_NAO_TRIPULADAS m
LEFT JOIN TBL_NOMEMISSAO_NAVE nn ON m.NomeMissao = nn.NomeMissao
LEFT JOIN TBL_NAVES n ON nn.ID_Nave = n.ID_Nave
UNION
SELECT m.NomeMissao, n.Nome
FROM TBL_NOMEMISSAO_NAVE nn
RIGHT JOIN TBL_MISSOES_NAO_TRIPULADAS m ON nn.NomeMissao = m.NomeMissao
RIGHT JOIN TBL_NAVES n ON nn.ID_Nave = n.ID_Nave;

-- Junção Externa à Esquerda (LEFT JOIN)
-- 1. Mostrar planetas e suas características (incluindo planetas sem características)
SELECT p.ID_CorpoCeleste, p.Distancia, p.Tamanho, p.Composicao, p.atmosfera, c.CaracteristicasGeologicas
FROM TBL_PLANETAS p
LEFT JOIN TBL_CARACTERISTICAS_GEOLOGICAS c ON p.ID_CorpoCeleste = c.ID_CorpoCeleste;

-- 2. Mostrar todas as missões tripuladas e as naves usadas (incluindo missões sem naves)
SELECT m.NomeMissao, n.Nome
FROM TBL_MISSOES_TRIPULADAS m
LEFT JOIN TBL_NOMEMISSAO_NAVE nn ON m.NomeMissao = nn.NomeMissao
LEFT JOIN TBL_NAVES n ON nn.ID_Nave = n.ID_Nave;

-- 3. Mostrar todas as sondas e seu histórico (incluindo sondas sem histórico)
SELECT s.Nome, h.ID_Historico
FROM TBL_SONDAS s
LEFT JOIN TBL_HISTORICO_SONDAS h ON s.ID_Sonda = h.ID_Sonda;

-- 4. Mostrar todos os funcionários e seus setores (incluindo funcionários sem setor)
SELECT f.ID_Funcionario, f.Status, fs.ID_SETOR, s.Setor
FROM TBL_FUNCIONARIOS f
LEFT JOIN TABELA_FUNCIONARIO_SETOR fs ON f.ID_Funcionario = fs.ID_Funcionario
LEFT JOIN TABELA_ID_SETOR s ON fs.ID_SETOR = s.ID_SETOR;

-- Junção Externa à Direita (RIGHT JOIN)
-- 1. Mostrar todas as características geológicas e os corpos celestes associados (incluindo características sem corpos celestes)
SELECT c.ID_CorpoCeleste, c.nome, cg.CaracteristicasGeologicas
FROM TBL_CARACTERISTICAS_GEOLOGICAS cg
RIGHT JOIN TBL_CORPO_CELESTE c ON cg.ID_CorpoCeleste = c.ID_CorpoCeleste;

-- 2. Mostrar todas as naves e as missões tripuladas associadas (incluindo naves sem missões)
SELECT n.Nome, m.NomeMissao
FROM TBL_NAVES n
RIGHT JOIN TBL_NOMEMISSAO_NAVE nn ON n.ID_Nave = nn.ID_Nave
RIGHT JOIN TBL_MISSOES_TRIPULADAS m ON nn.NomeMissao = m.NomeMissao;

-- 3. Mostrar todas as naves e sua tripulação (incluindo naves sem tripulação)
SELECT n.Nome, t.ID_Tripulacao
FROM TBL_NAVES n
RIGHT JOIN TBL_NOMEMISSAO_NAVE nn ON n.ID_Nave = nn.ID_Nave
RIGHT JOIN TBL_TRIPULACAO t ON nn.ID_Tripulacao = t.ID_Tripulacao;

-- 4. Mostrar todas as especializações e os cientistas associados (incluindo especializações sem cientistas)
SELECT e.Especializacao, c.ID_Funcionario
FROM TABELA_ESPECIALIZACAO_CIENTISTA e
RIGHT JOIN TBL_CIENTISTAS c ON e.ID_especializacao = c.Especializacao;

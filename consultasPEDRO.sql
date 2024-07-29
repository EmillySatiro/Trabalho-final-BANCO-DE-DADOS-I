-- Junção Interna (INNER JOIN)
-- 1. Mostrar planetas e suas características geológicas// repetida 

-- 2. Mostrar missões tripuladas e as naves usadas
SELECT mt.NomeMissao AS Nome_Missao, n.Nome AS Nome_Nave
FROM TBL_MISSOES_TRIPULADAS mt
INNER JOIN TBL_NAVES n 
ON mt.ID_Nave = n.ID_Nave;

-- 3. Mostrar cientistas e suas especializações
SELECT c.ID_Funcionário, f.Nome AS Nome_Cientista, f.Sobrenome AS Sobrenome_Cientista, e.Especializacao
FROM TABELA_CIENTISTA c
INNER JOIN TABELA_FUNCIONÁRIOS f ON c.ID_Funcionário = f.ID_Funcionario
INNER JOIN Tbl_especializacao e ON c.ID_Especialização = e.ID_especializacao;

--4. Obter os nomes dos cometas e suas órbitas -- rever o Bd depois 
SELECT c.Nome AS Nome_Cometa,cm.Órbita
FROM TBL_COMETAS cm
INNER JOIN TBL_CORPO_CELESTE c ON cm.ID_CorpoCeleste = c.ID_CorpoCeleste;


-- Junção Externa Total (FULL OUTER JOIN)

-- 1. Mostrar sonda e seu histórico
SELECT s.Nome AS Nome_Sonda,m.NomeMissão,m.DataDeLançamento,m.Objetivos
FROM TBL_SONDAS s
LEFT JOIN  TBL_MISSOES_NÃO_TRIPULADAS m  ON s.ID_Sonda = m.ID_Sonda
UNION
SELECT s.Nome AS Nome_Sonda,m.NomeMissão,m.DataDeLançamento,m.Objetivos
FROM TBL_MISSOES_NÃO_TRIPULADAS m
RIGHT JOIN TBL_SONDAS s ON s.ID_Sonda = m.ID_Sonda;


-- 2. Mostrar todos os corpos celestes e suas características geológicas (incluindo todas as combinações)
-- Todos os corpos celestes e suas características geológicas (incluindo combinações não correspondentes)
SELECT c.Nome AS Nome_Corpo_Celeste,p.Características_Geológicas
FROM TBL_CORPO_CELESTE c
LEFT JOIN TBL_PLANETAS p ON c.ID_CorpoCeleste = p.ID_CorpoCeleste
UNION
SELECT c.Nome AS Nome_Corpo_Celeste,p.Características_Geológicas
FROM TBL_PLANETAS p
RIGHT JOIN TBL_CORPO_CELESTE c ON c.ID_CorpoCeleste = p.ID_CorpoCeleste;

-- 3. Obter todas as missões não tripuladas e seus dados científicos, se houver.
-- Todas as missões não tripuladas e seus dados científicos (incluindo combinações não correspondentes)
SELECT m.NomeMissão,m.DataDeLançamento AS DataLançamentoMissão,m.Objetivos,m.`Duracao`,d.DataDeLançamento AS DataLançamentoDados,d.Conteúdo
FROM TBL_MISSOES_NÃO_TRIPULADAS m
LEFT JOIN TABELA_DADOS_CIENTÍFICOS d ON m.NomeMissão = d.NomeMissão
UNION
SELECT  m.NomeMissão, m.DataDeLançamento AS DataLançamentoMissão, m.Objetivos, m.`Duracao`, d.DataDeLançamento AS DataLançamentoDados,d.Conteúdo
FROM TABELA_DADOS_CIENTÍFICOS d
RIGHT JOIN TBL_MISSOES_NÃO_TRIPULADAS m ON m.NomeMissão = d.NomeMissão;

-- Junção Externa à Esquerda (LEFT JOIN)

-- 2. Mostrar todas as missões não tripuladas e as naves associadas (incluindo missões sem naves e naves sem missões)
-- Todas as missões não tripuladas e suas naves associadas (incluindo missões sem naves e naves sem missões)
SELECT m.NomeMissão AS NomeMissaoNaoTripulada,m.DataDeLançamento AS DataLancamentoMissao,m.Objetivos AS ObjetivosMissao,m.`Duracao` AS DuracaoMissao,n.Nome AS NomeNave,n.Status AS StatusNave
FROM TBL_MISSOES_NÃO_TRIPULADAS m
LEFT JOIN TBL_NAVES n ON m.ID_Sonda = n.ID_Nave


-- 4.Obter todas as naves e os históricos associados, se houver.
-- Todas as naves e seus históricos associados (se houver)
SELECT n.ID_Nave AS IDNave,n.Nome AS NomeNave,n.Status AS StatusNave,t.ID_Tripulacao AS IDTripulacao,t.NomeMissão AS NomeMissao,t.ID_Funcionario AS IDFuncionario
FROM TBL_NAVES n
LEFT JOIN tbl_tripulação t ON n.ID_Nave = t.ID_Funcionario


-- Junção Externa à Direita (RIGHT JOIN)

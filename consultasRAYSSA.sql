WITH NavesMissoes AS (
    SELECT ID_Nave, NomeMissao
    FROM TBL_NAVE_MISSAO
),

MTripuladas AS (
    SELECT NomeMissao
    FROM TBL_MISSOES_TRIPULADAS
),

NavesEmTodasMissoes AS (
    SELECT ID_Nave
    FROM NavesMissoes
    GROUP BY ID_Nave
    HAVING COUNT(DISTINCT NomeMissao) = (SELECT COUNT(*) FROM MTripuladas)
)

SELECT ID_Nave
FROM NavesEmTodasMissoes;
WITH CientistasMissoes AS (
    SELECT f.ID_Funcionario, m.NomeMissao
    FROM TBL_FUNCIONARIOS_TRIPULACAO f
    JOIN TBL_CIENTISTAS c ON f.ID_Funcionario = c.ID_Cientista
    JOIN TBL_TRIPULACAO t ON f.ID_Funcionario = t.ID_Funcionario
    JOIN TBL_MISSOES m ON t.ID_Missao = m.ID_Missao
),

MissoesComDadosCientificos AS (
    SELECT NomeMissao
    FROM DADOS_CIENTIFICOS
),

CientistasEmTodasMissoes AS (
    SELECT ID_Funcionario
    FROM CientistasMissoes
    GROUP BY ID_Funcionario
    HAVING COUNT(DISTINCT NomeMissao) = (SELECT COUNT(*) FROM MissoesComDadosCientificos)
)

SELECT ID_Funcionario
FROM CientistasEmTodasMissoes;
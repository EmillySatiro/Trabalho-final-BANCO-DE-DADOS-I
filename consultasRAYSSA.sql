WITH interstellarinsight AS (
    SELECT f.ID_Funcionario, m.NomeMissao
    FROM TBL_FUNCIONARIOS_TRIPULACAO f
    JOIN TBL_CIENTISTAS c ON f.ID_Funcionario = c.ID_Funcionario
    JOIN TBL_TRIPULACAO t ON f.ID_Tripulacao = t.ID_Tripulacao
    JOIN TBL_MISSOES_TRIPULADAS m ON t.NomeMissao = m.NomeMissao
),

MissoesComDadosCientificos AS (
    SELECT DISTINCT NomeMissao
    FROM TABELA_DADOS_CIENTIFICOS
),

CientistasEmTodasMissoes AS (
    SELECT ID_Funcionario
    FROM CientistasMissoes
    WHERE NomeMissao IN (SELECT NomeMissao FROM MissoesComDadosCientificos)
    GROUP BY ID_Funcionario
    HAVING COUNT(DISTINCT NomeMissao) = (SELECT COUNT(DISTINCT NomeMissao) FROM MissoesComDadosCientificos)
)

SELECT ID_Funcionario
FROM CientistasEmTodasMissoes;
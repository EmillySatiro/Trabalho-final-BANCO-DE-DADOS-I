--Duas consultas usando o operador de divisão:
-- Todas as sondas que possuem pelo menos um histórico associado a elas
SELECT Nome
FROM TBL_SONDAS
WHERE ID_Sonda IN (
    SELECT ID_Sonda
    FROM TBL_MISSOES_NÃO_TRIPULADAS
    WHERE ID_Sonda IS NOT NULL
);

-- Todos os corpos celestes que possuem pelo menos uma característica geológica associada a eles
SELECT Nome
FROM TBL_CORPO_CELESTE
WHERE ID_CorpoCeleste IN (
    SELECT ID_CorpoCeleste
    FROM TBL_PLANETAS
    WHERE Características_Geológicas IS NOT NULL
);

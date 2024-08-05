--Duas consultas usando o operador de divisão.
--1. Todas as sondas que possuem pelo menos um histórico associado a elas
-- Encontre todos os IDs de sondas que têm registros na tabela de missões não tripuladas
SELECT s.ID_Sonda
FROM TBL_SONDAS s
WHERE EXISTS (
    SELECT 1
    FROM TBL_MISSOES_NAO_TRIPULADAS mn
    WHERE mn.ID_Sonda = s.ID_Sonda
);


--2.Todos os corpos celestes que possuem pelo menos uma característica geológica associada a eles. 
-- Encontre todos os IDs de corpos celestes que têm características geológicas na tabela de planetas
SELECT DISTINCT cc.ID_CorpoCeleste
FROM TBL_CORPO_CELESTE cc
WHERE EXISTS (
    SELECT 1
    FROM TBL_PLANETAS p
    WHERE p.ID_CorpoCeleste = cc.ID_CorpoCeleste
      AND p.Caracteristicas_Geologicas IS NOT NULL
      AND p.Caracteristicas_Geologicas <> ''
);

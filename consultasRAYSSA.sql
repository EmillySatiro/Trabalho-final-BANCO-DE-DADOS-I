SELECT DISTINCT p.ID_CorpoCeleste, p.Nome
FROM TBL_CORPO_CELESTE p
WHERE NOT EXISTS (
    SELECT c.ID_CorpoCeleste
    FROM TBL_CARACTERISTICAS_GEOLOGICAS c
    WHERE NOT EXISTS (
        SELECT 1
        FROM TBL_CARACTERISTICAS_GEOLOGICAS c2
        WHERE c2.ID_CorpoCeleste = p.ID_CorpoCeleste
        AND c2.Características_Geológicas = c.Características_Geológicas
    )
);
SELECT s.ID_Sonda, s.Nome
FROM TBL_SONDAS s
WHERE NOT EXISTS (
    SELECT h.ID_Historico_
    FROM TBL_HISTÓRICO_SONDAS h
    WHERE NOT EXISTS (
        SELECT 1
        FROM TBL_HISTÓRICO_SONDAS h2
        WHERE h2.ID_Sonda = s.ID_Sonda
        AND h2.ID_Historico_ = h.ID_Historico_
    )
);

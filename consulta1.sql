--Cinco consultas cujos resultados contenham dados provenientes de pelo menos 3 relações.
--1.Consulta sobre planetas e suas características geológicas
SELECT c.Nome AS Nome_Corpo_Celeste,p.Distancia,p.Tamanho,p.Composicao,p.Atmosfera,p.Caracteristicas_Geologicas
FROM TBL_PLANETAS p
JOIN TBL_CORPO_CELESTE c ON p.ID_CorpoCeleste = c.ID_CorpoCeleste;

--2 Consulta sobre cometas e missões associadas(se tiver)
SELECT c.Nome AS Nome_Cometa, mnt.NomeMissao
FROM TBL_CORPO_CELESTE c
JOIN TBL_COMETAS co ON c.ID_CorpoCeleste = co.ID_CorpoCeleste
LEFT JOIN TBL_MISSOES_NAO_TRIPULADAS mnt ON c.ID_CorpoCeleste = mnt.ID_CorpoCeleste
ORDER BY c.Nome;

--3 Consulta sobre estrelas e as missões associadas(se exitir)
SELECT c.Nome AS Nome_Estrela,COALESCE(mt.NomeMissao, mnt.NomeMissao) AS Nome_Missao
FROM TBL_ESTRELAS e
JOIN TBL_CORPO_CELESTE c ON e.ID_CorpoCeleste = c.ID_CorpoCeleste
LEFT JOIN TBL_MISSOES_TRIPULADAS mt ON e.ID_CorpoCeleste = mt.ID_CorpoCeleste
LEFT JOIN TBL_MISSOES_NAO_TRIPULADAS mnt ON e.ID_CorpoCeleste = mnt.ID_CorpoCeleste
ORDER BY c.Nome;

--4 Quantidade de missões tripuladas em cada galáxia
SELECT g.Nome AS Nome_Galaxia,COUNT(mt.NomeMissao) AS Quantidade_Missoes_Tripuladas
FROM TBL_GALAXIAS g
LEFT JOIN TBL_MISSOES_TRIPULADAS mt ON g.ID_Galaxia = mt.ID_Galaxia
GROUP BY g.Nome
ORDER BY Quantidade_Missoes_Tripuladas DESC;


--5 Consulta sobre funcionários, setores e tipos de funcionários
SELECT f.ID_Funcionario AS ID_Funcionario,f.Nome AS Nome_Funcionario,f.Sobrenome AS Sobrenome_Funcionario,t.TipoFuncionario AS Tipo_Funcionario,
    CASE
        WHEN a.ID_Funcionario IS NOT NULL THEN 'Astronauta'
        WHEN c.ID_Funcionario IS NOT NULL THEN 'Cientista'
        ELSE 'Outros'
    END AS Setor
FROM TABELA_FUNCIONARIOS f
JOIN TABELA_TIPOFUNCIONARIO t ON f.ID_Tipo = t.ID_Tipo
LEFT JOIN TABELA_ASTRONAUTAS a ON f.ID_Funcionario = a.ID_Funcionario
LEFT JOIN TABELA_CIENTISTA c ON f.ID_Funcionario = c.ID_Funcionario
ORDER BY f.Nome, f.Sobrenome;

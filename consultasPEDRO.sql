SELECT c.ID_CorpoCeleste, c.nome, g.CaracteristicasGeologicas
FROM TBL_CORPO_CELESTE c
JOIN TBL_CARACTERISTICAS_GEOLOGICAS g ON c.ID_CorpoCeleste = g.ID_CorpoCeleste;

SELECT p.ID_CorpoCeleste, c.nome, p.Distancia, p.Tamanho, p.Composicao, p.atmosfera
FROM TBL_PLANETAS p
JOIN TBL_CORPO_CELESTE c ON p.ID_CorpoCeleste = c.ID_CorpoCeleste;

SELECT m.NomeMissao, m.DataDeLancamento, m.DuracaoEstipulada, m.Objetivos, n.Nome AS NaveNome, n.Status AS NaveStatus
FROM TBL_MISSOES_TRIPULADAS m
JOIN TBL_NOMEMISSAO_NAVE mn ON m.NomeMissao = mn.NomeMissao
JOIN TBL_NAVES n ON mn.ID_Nave = n.ID_Nave;

SELECT NomeMissao, DataDeLancamento, Duracao, Objetivos
FROM TBL_MISSOES_NAO_TRIPULADAS;

SELECT ID_Sonda, Nome, Status
FROM TBL_SONDAS;

SELECT c.ID_Funcionario, f.Status, c.AreaDePesquisa, e.Especializacao
FROM TBL_CIENTISTAS c
JOIN TBL_FUNCIONARIOS f ON c.ID_Funcionario = f.ID_Funcionario
JOIN TABELA_ESPECIALIZACAO_CIENTISTA e ON c.Especializacao = e.ID_especializacao;

SELECT e.ID_Funcionario, f.Status, e.Especializacao
FROM TBL_ENGENHEIRO e
JOIN TBL_FUNCIONARIOS f ON e.ID_Funcionario = f.ID_Funcionario;

SELECT ID_Nave, Nome, Status
FROM TBL_NAVES;

SELECT g.ID_Galaxia, g.Nome, h.ID_Historico
FROM TBL_GALAXIAS g
JOIN TBL_HISTORICO_GALAXIAS h ON g.ID_Galaxia = h.ID_Galaxia;

SELECT m.NomeMissao, t.ID_Tripulacao
FROM TBL_MISSOES_TRIPULADAS m
JOIN TBL_TRIPULACAO t ON m.NomeMissao = t.NomeMissao;


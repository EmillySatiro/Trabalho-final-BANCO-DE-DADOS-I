-- Consultas utilizando Funções Agregadas

-- Contar quantas naves estão inativas
select count(*) as Naves_Inativas
from interstellarinsight.tbl_naves as Inativas
where Status = 'Inativa';

-- Selecionar o ID da menor estrela
select EID_CorpoCeleste as ID_MenorEstrela
from interstellarinsight.tbl_estrelas
where Tamanho = (select min(Tamanho) from interstellarinsight.tbl_estrelas);

-- Selecionar o ID da estrela mais distante
select EID_CorpoCeleste as ID_MaiorDistancia
from interstellarinsight.tbl_estrelas
where Distancia = (select max(Distancia) from interstellarinsight.tbl_estrelas);

-- Contar quantas sondas estão ativas
select count(*) as Sondas_Ativas
from interstellarinsight.TBL_SONDAS as Ativas
where Status = 'Ativa';

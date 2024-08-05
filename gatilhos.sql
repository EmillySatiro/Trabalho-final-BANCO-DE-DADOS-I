-- Gatilho para Atualizar o Salário ao Alterar o Cargo
--Atualiza o salário de um funcionário se o cargo for alterado para 'Cientista' ou 'Engenheiro

CREATE TRIGGER AtualizaSalario
BEFORE UPDATE ON TABELA_FUNCIONARIOS
FOR EACH ROW
BEGIN
    IF OLD.ID_Tipo <> NEW.ID_Tipo THEN
        IF NEW.ID_Tipo = 2 THEN  -- Cientista
            SET NEW.Salario = 10000;
        ELSEIF NEW.ID_Tipo = 3 THEN  -- Engenheiro
            SET NEW.Salario = 8000;
        ELSE
            -- Manter o salário atual se o cargo não é Cientista ou Engenheiro
            SET NEW.Salario = OLD.Salario;
        END IF;
    END IF;
END; //


--Gatilho para Não Permitir Gastos Acima do Orçamento
--Impede que os gastos registrados em TABELA_DADOS_FINANCEIROS ultrapassem o orçamento da missão.

CREATE TRIGGER VerificaGastos
BEFORE INSERT ON TBL_DADOS_FINANCEIROS
FOR EACH ROW
BEGIN
    DECLARE orçamento DECIMAL(15, 2);

    SELECT Orçamento INTO orçamento
    FROM TBL_DADOS_FINANCEIROS
    WHERE NomeMissao = NEW.NomeMissao;

    IF NEW.Gastos > orçamento THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Os gastos não podem exceder o orçamento da missão.';
    END IF;
END; //

--Gatilho para Atualizar Status de Sondas
--Atualiza o status de uma sonda para 'Desativada' quando a missão correspondente é concluída.

CREATE TRIGGER AtualizaStatusSondas
AFTER UPDATE ON TBL_MISSOES_NAO_TRIPULADAS
FOR EACH ROW
BEGIN
    IF OLD.DataDeLancamento IS NOT NULL AND NEW.DataDeLancamento IS NULL THEN
        UPDATE TBL_SONDAS
        SET Status = 'Desativada'
        WHERE ID_Sonda = (SELECT ID_Sonda FROM TBL_MISSOES_NAO_TRIPULADAS WHERE NomeMissao = OLD.NomeMissao);
    END IF;
END; //


--Gatilho para Registrar a Data de Lançamento
--Adiciona a data de lançamento da missão em TABELA_DADOS_CIENTÍFICOS quando uma nova missão é inserida em TBL_MISSOES_NÃO_TRIPULADAS.

CREATE TRIGGER AdicionaDataLancamento
AFTER INSERT ON TBL_MISSOES_NAO_TRIPULADAS
FOR EACH ROW
BEGIN
    INSERT INTO TBL_DADOS_CIENTIFICOS (NomeMissao, DataDeLancamento)
    VALUES (NEW.NomeMissao, NEW.DataDeLancamento);
END; //


--Gatilho para Adicionar Astronautas a Missões
--Adiciona automaticamente um astronauta à tabela de tripulação quando um novo astronauta é inserido na tabela TABELA_ASTRONAUTAS.

CREATE TRIGGER AdicionaAstronauta
AFTER INSERT ON TABELA_ASTRONAUTAS
FOR EACH ROW
BEGIN
    INSERT INTO TBL_TRIPULACAO (NomeMissao, ID_Funcionario)
    VALUES ('Missão Padrão', NEW.ID_Funcionario);
END; //

-- Para vcs testarem os gatilhos, podem fazer assim:

-- 1. Inserir ou atualizar dados nas tabelas  e verificar se o gatilho faz as alterações esperadas.
--    Por exemplo, inserir uma nova missão tripulada na tabela TBL_MISSOES_TRIPULADAS e verificar se o gatilho
--    que atualiza o status da missão ou verifica a consistência dos dados é acionado corretamente.

-- 2. Executar consultas SELECT nas tabelas para confirmar se os gatilhos estão funcionando corretamente.
--    Executem consultas para visualizar os dados nas tabelas afetadas pelos gatilhos e verificar se as alterações feitas
--    pelos gatilhos foram aplicadas conforme o esperado.




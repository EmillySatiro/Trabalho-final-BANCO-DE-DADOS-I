-- Gatilho para Atualizar o Salário ao Alterar o Cargo
--Atualiza o salário de um funcionário se o cargo for alterado para 'Cientista' ou 'Engenheiro
CREATE TRIGGER AtualizaSalario
AFTER UPDATE ON TABELA_FUNCIONÁRIOS
FOR EACH ROW
BEGIN
    IF NEW.id_tipo IN (1, 2) THEN
        UPDATE TABELA_FUNCIONÁRIOS
        SET Salário = CASE
            WHEN NEW.id_tipo = 1 THEN 160000.00 -- Valor para Cientistas
            WHEN NEW.id_tipo = 2 THEN 150000.00 -- Valor para Engenheiros
        END
        WHERE ID_Funcionario = NEW.ID_Funcionario;
    END IF;
END //

--Gatilho para Não Permitir Gastos Acima do Orçamento
--Impede que os gastos registrados em TABELA_DADOS_FINANCEIROS ultrapassem o orçamento da missão.
CREATE TRIGGER VerificaGastos
BEFORE INSERT ON TABELA_DADOS_FINANCEIROS
FOR EACH ROW
BEGIN
    IF NEW.Gastos > NEW.Orçamento THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Os gastos não podem ultrapassar o orçamento.';
    END IF;
END //

--Gatilho para Atualizar Status de Sondas
--Atualiza o status de uma sonda para 'Desativada' quando a missão correspondente é concluída.
CREATE TRIGGER AtualizaStatusSonda
AFTER UPDATE ON TBL_MISSOES_NÃO_TRIPULADAS
FOR EACH ROW
BEGIN
    IF NEW.Duracao = 'Concluída' THEN
        UPDATE TBL_SONDAS
        SET Status = 'Desativada'
        WHERE ID_Sonda = NEW.ID_Sonda;
    END IF;
END //

--Gatilho para Registrar a Data de Lançamento
--Adiciona a data de lançamento da missão em TABELA_DADOS_CIENTÍFICOS quando uma nova missão é inserida em TBL_MISSOES_NÃO_TRIPULADAS.
CREATE TRIGGER RegistraDataLancamento
AFTER INSERT ON TBL_MISSOES_NÃO_TRIPULADAS
FOR EACH ROW
BEGIN
    INSERT INTO TABELA_DADOS_CIENTÍFICOS (NomeMissão, DataDeLançamento, Conteúdo)
    VALUES (NEW.NomeMissão, NEW.DataDeLançamento, 'Dados científicos associados.');
END //

--Gatilho para Adicionar Astronautas a Missões
--Adiciona automaticamente um astronauta à tabela de tripulação quando um novo astronauta é inserido na tabela TABELA_ASTRONAUTAS.
CREATE TRIGGER AdicionaAstronauta
AFTER INSERT ON TABELA_ASTRONAUTAS
FOR EACH ROW
BEGIN
    INSERT INTO tbl_tripulação (NomeMissão, ID_Funcionario)
    VALUES ('Missão padrão', NEW.ID_Funcionário);
END //

-- Para vcs testarem os gatilhos, podem fazer assim:

-- 1. Inserir ou atualizar dados nas tabelas  e verificar se o gatilho faz as alterações esperadas.
--    Por exemplo, inserir uma nova missão tripulada na tabela TBL_MISSOES_TRIPULADAS e verificar se o gatilho
--    que atualiza o status da missão ou verifica a consistência dos dados é acionado corretamente.

-- 2. Executar consultas SELECT nas tabelas para confirmar se os gatilhos estão funcionando corretamente.
--    Executem consultas para visualizar os dados nas tabelas afetadas pelos gatilhos e verificar se as alterações feitas
--    pelos gatilhos foram aplicadas conforme o esperado.




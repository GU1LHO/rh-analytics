-- VIEWs fornecidas pelo autor. Executar com search_path incluindo public.
CREATE OR REPLACE VIEW vw_rh_funcionarios AS
SELECT ID_Funcionario, Nome, Genero, Data_Nascimento, Idade, Estado, Cidade,
       Departamento, Cargo, Nivel, Data_Admissao, Data_Desligamento,
       Tempo_Empresa_Anos, Status, Motivo_Desligamento, Salario, Salario_Anterior,
       Tipo_Contrato, Modalidade, Avaliacao_Desempenho, Satisfacao,
       Horas_Treinamento, Promovido, Ultima_Promocao, Ferias_Dias, Faltas,
       Horas_Extras, Ano_Admissao, Ano_Desligamento
FROM rh_funcionarios;

CREATE OR REPLACE VIEW vw_rh_turnover AS
SELECT ID_Funcionario, Departamento, Cargo, Nivel, Status, Data_Admissao,
       Data_Desligamento, Ano_Desligamento, Tempo_Empresa_Anos, Motivo_Desligamento
FROM rh_funcionarios
WHERE Status = 'Desligado';

CREATE OR REPLACE VIEW vw_rh_performance AS
SELECT ID_Funcionario, Departamento, Cargo, Nivel, Modalidade,
       Avaliacao_Desempenho, Satisfacao, Horas_Treinamento, Promovido,
       Salario, Salario_Anterior
FROM rh_funcionarios;

CREATE OR REPLACE VIEW vw_rh_remuneracao AS
SELECT ID_Funcionario, Departamento, Cargo, Nivel, Modalidade,
       Salario, Salario_Anterior,
       Salario - Salario_Anterior AS Variacao_Salarial,
       CASE WHEN Salario_Anterior > 0
            THEN ((Salario - Salario_Anterior) / Salario_Anterior) * 100
            ELSE NULL END AS Variacao_Salarial_Percentual
FROM rh_funcionarios;

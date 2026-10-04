-- Consultas adicionadas para reprodução e conferência.
SELECT COUNT(*) AS total, COUNT(*) FILTER (WHERE Status = 'Ativo') AS ativos,
       COUNT(*) FILTER (WHERE Status = 'Desligado') AS desligados,
       ROUND(AVG(Salario), 2) AS salario_medio,
       ROUND(AVG(Satisfacao), 2) AS satisfacao_media,
       ROUND(AVG(Avaliacao_Desempenho), 2) AS desempenho_medio
FROM vw_rh_funcionarios;
-- Esperado: 500 | 415 | 85 | 6434.50 | 3.06 | 3.55

SELECT Departamento, COUNT(*) AS total,
       ROUND(AVG(Salario), 2) AS salario_medio
FROM vw_rh_funcionarios GROUP BY Departamento ORDER BY total DESC;

SELECT Modalidade, COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS percentual
FROM vw_rh_funcionarios GROUP BY Modalidade ORDER BY total DESC;

SELECT COUNT(*) AS datas_inconsistentes
FROM rh_funcionarios WHERE Data_Desligamento < Data_Admissao;
-- Esperado: 0
SELECT COUNT(*) AS status_inconsistentes
FROM rh_funcionarios
WHERE (Status = 'Ativo' AND Data_Desligamento IS NOT NULL)
   OR (Status = 'Desligado' AND Data_Desligamento IS NULL);
-- Esperado: 0
SELECT COUNT(*) AS total_desligados FROM vw_rh_turnover;
-- Esperado: 85

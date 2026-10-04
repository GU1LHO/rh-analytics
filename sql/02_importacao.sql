-- Opção psql: execute a partir da raiz do repositório.
-- Não executar o comando \copy no Query Tool do pgAdmin.
\copy public.rh_funcionarios FROM 'dados/tratados/dataset_rh_dashboard-limpo.csv' WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8', NULL '');

-- Opção pgAdmin: Import/Export Data na tabela rh_funcionarios.
-- Import; formato CSV; cabeçalho ligado; delimitador ; ; encoding UTF8.
-- Importar as 29 colunas na ordem da tabela; NULL como campo vazio.
-- Carregar uma vez em tabela vazia para evitar duplicação de IDs.

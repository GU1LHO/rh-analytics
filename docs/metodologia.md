# Metodologia e rastreabilidade

## Base de estudo

Utilizei dados fictícios para desenvolver este projeto de portfólio. A origem externa e a licença do conjunto não estão documentadas no repositório. O arquivo Excel original contém Funcionarios (500 registros, 29 colunas), Departamentos (8 linhas) e Niveis (6 linhas). As abas auxiliares permanecem disponíveis no arquivo original.

## Limpeza no Google Colab

Realizei o data cleaning em Python no Google Colab, com pandas e NumPy. A rotina principal converte datas com errors="coerce", recalcula idade considerando aniversário e usa (data final − admissão)/365,25 para tempo de empresa, arredondado para duas casas. Data final é a data de desligamento quando preenchida; caso contrário, é a data de referência.

O notebook registra 25/09/2026 como referência da limpeza. Na comparação entre as bases original e tratada, identifiquei alterações em 11 idades, 267 registros de gênero e 500 tempos de empresa. Outros campos permanecem iguais após normalização da representação das datas. A validação do CSV tratado confirma os cálculos de idade e tempo nessa referência.

Para o ajuste de gênero, utilizei um dicionário de primeiros nomes do conjunto fictício. Essa é uma convenção do exercício, não uma regra válida para inferir a identidade de pessoas em dados reais.

O notebook original exporta um Excel com todas as abas. O CSV utilizado na análise contém apenas Funcionarios; a etapa de conversão para CSV não está registrada nesse notebook.

## Organização para reprodução

O repositório mantém o notebook original e as bases original e tratada. Também inclui uma versão organizada da rotina principal, com data de referência fixa e saída em CSV, além de um script de conferência. A tabela SQL e as consultas de validação apoiam a reprodução do projeto, e as quatro VIEWs compõem a camada analítica.

## Valores ausentes

Data_Desligamento, Ano_Desligamento e Motivo_Desligamento estão ausentes nos 415 ativos. Ultima_Promocao tem 439 valores ausentes. Promovido e Ultima_Promocao não são usados como equivalentes: a definição do indicador Promovido e seu período não estão documentados na base.

## Limites da validação

A validação documentada compara as bases original e tratada, a definição do relatório no PBIX e os indicadores da imagem do dashboard. Os resultados apresentados foram recalculados em Python. Essa conferência não inclui uma nova atualização do relatório no Power BI Desktop nem a execução dos scripts em uma instância PostgreSQL; essas etapas dependem da configuração local do ambiente.

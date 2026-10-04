# Metodologia e rastreabilidade

## Origem

Dados fictícios fornecidos pelo autor para estudo. Não foi fornecida uma URL de origem ou licença externa. O arquivo Excel original contém Funcionarios (500 registros, 29 colunas), Departamentos (8 linhas) e Niveis (6 linhas). As abas auxiliares foram preservadas no arquivo original.

## Trabalho realizado pelo autor

O notebook recebido utiliza pandas, NumPy e Google Colab. A rotina principal converte datas com errors="coerce", recalcula idade considerando aniversário e usa (data final − admissão)/365,25 para tempo de empresa, arredondado para duas casas. Data final é a data de desligamento quando preenchida; caso contrário, é a data de referência.

A saída registrada no notebook informa 25/09/2026. A comparação dos arquivos recebidos identifica 11 idades, 267 registros de gênero e 500 tempos de empresa alterados. Outros campos permanecem iguais após normalização da representação das datas. A validação do CSV tratado confirma os cálculos de idade e tempo nessa referência.

O ajuste de gênero usa um dicionário de primeiros nomes do conjunto fictício. Isso é uma convenção do exercício, não uma regra válida para inferir a identidade de pessoas em dados reais.

A rotina de origem exporta um Excel com todas as abas. O CSV fornecido contém apenas Funcionarios; a etapa exata de conversão para CSV não aparece no notebook recebido.

## Material acrescentado à documentação

O notebook original e os dados recebidos foram preservados. Foi acrescentada uma versão organizada da rotina principal, com data de referência fixa e saída em CSV, além de um script de conferência. A tabela SQL e as consultas de validação são recursos de reprodução preparados para o portfólio; as quatro VIEWs são as fornecidas pelo autor.

## Valores ausentes

Data_Desligamento, Ano_Desligamento e Motivo_Desligamento estão ausentes nos 415 ativos. Ultima_Promocao tem 439 valores ausentes. Promovido e Ultima_Promocao não são usados como equivalentes: a semântica do indicador Promovido e seu período não foram fornecidos.

## Limites da validação

A conferência é feita sobre os arquivos disponibilizados. O PBIX e sua definição de relatório foram inspecionados, e os principais indicadores foram reconciliados com a imagem. O relatório não foi atualizado no Power BI Desktop nem conectado ao banco original. Não há instância PostgreSQL disponível para executar os scripts nesta entrega; os resultados foram calculados em Python.

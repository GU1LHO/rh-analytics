"""Recalcula resultados e compara os arquivos entregues, sem modificá-los."""
from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
df = pd.read_csv(ROOT / "dados/tratados/dataset_rh_dashboard-limpo.csv", sep=";")
original = pd.read_excel(ROOT / "dados/originais/dataset_rh_dashboard-original.xlsx", sheet_name="Funcionarios")
reference = pd.Timestamp("2026-09-25")
print("Registros:", len(df), "Colunas:", len(df.columns))
print("Status:", df.Status.value_counts().to_dict())
print("Médias:", df[["Salario", "Satisfacao", "Avaliacao_Desempenho", "Idade", "Tempo_Empresa_Anos"]].mean().round(4).to_dict())
print("Modalidade:", df.Modalidade.value_counts().to_dict())
print("Departamentos:", df.Departamento.value_counts().to_dict())
print("IDs duplicados:", df.ID_Funcionario.duplicated().sum())
print("Linhas duplicadas:", df.duplicated().sum())
left = original.set_index("ID_Funcionario").sort_index()
right = df.set_index("ID_Funcionario").sort_index()
if not left.index.equals(right.index):
    raise ValueError("IDs diferentes entre as bases")
for col in ["Idade", "Genero", "Tempo_Empresa_Anos"]:
    changed = (left[col] != right[col]) & ~(left[col].isna() & right[col].isna())
    print("Registros alterados em", col, ":", int(changed.sum()))
birth = pd.to_datetime(df.Data_Nascimento)
expected_age = reference.year - birth.dt.year - ((birth.dt.month > reference.month) | ((birth.dt.month == reference.month) & (birth.dt.day > reference.day))).astype(int)
end = pd.to_datetime(df.Data_Desligamento).fillna(reference)
expected_tenure = ((end - pd.to_datetime(df.Data_Admissao)).dt.days / 365.25).round(2)
print("Idades divergentes da referência:", int((df.Idade != expected_age).sum()))
print("Tempos divergentes da referência:", int((df.Tempo_Empresa_Anos != expected_tenure).sum()))
print("Saídas anteriores à admissão:", int((pd.to_datetime(df.Data_Desligamento) < pd.to_datetime(df.Data_Admissao)).sum()))

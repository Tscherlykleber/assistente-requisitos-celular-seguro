#  Assistente Inteligente para Apoio à Análise de Requisitos

Este projeto é um MVP de uma ferramenta baseada em Inteligência Artificial que auxilia analistas de requisitos na identificação, organização e priorização de requisitos de sistemas. Ele foi desenvolvido como parte do curso de Python e IA, com aplicação prática no projeto **Celular Seguro** do **MJSP**, e visa gerar impacto real na área de TI da Qintess.

---

##  Objetivo

Automatizar e otimizar o processo de análise de requisitos utilizando:
- Processamento de Linguagem Natural (NLP)
- Classificação automática de requisitos
- Visualização de dados
- Estimativa de esforço com regressão
- Geração de relatórios em PDF com logotipos institucionais

---

##  Funcionalidades

- Upload de arquivo CSV com requisitos
- Classificação por tipo (Funcional / Não Funcional)
- Visualização por prioridade e tipo
- Estimativa de esforço com base na complexidade
- Sugestão de requisito com IA generativa (simulada)
- Geração de relatório em PDF com logotipos da Qintess e MJSP

---

##  Instalação

1. Clone o repositório:

git clone https://github.com/seu-usuario/assistente-requisitos-celular-seguro.git
# Assistente Inteligente para Apoio à Análise de Requisitos

Este projeto é um MVP desenvolvido para auxiliar analistas de requisitos na identificação, organização e priorização de requisitos de sistemas.

## Funcionalidades
- Upload de requisitos via CSV
- Classificação automática
- Visualização com gráficos
- Estimativa de esforço com regressão
- Sugestão de requisito com IA generativa
- Geração de relatório em PDF

## Como executar
```bash
pip install streamlit pandas matplotlib scikit-learn pymupdf
streamlit run app.py
```

## Estrutura esperada do CSV
- ID
- Descrição
- Tipo (Funcional / Não Funcional)
- Prioridade (Alta / Média / Baixa)
- Complexidade (1 a 5)
- Esforco (horas)                                                                                                            

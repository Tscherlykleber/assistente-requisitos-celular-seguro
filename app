
import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
import numpy as np
import fitz  # PyMuPDF

st.title("Assistente Inteligente para Apoio à Análise de Requisitos")

uploaded_file = st.file_uploader("Envie o arquivo de requisitos (.csv)", type="csv")
if uploaded_file:
    df = pd.read_csv(uploaded_file)
    st.dataframe(df)

    st.subheader("Distribuição por Tipo")
    fig1, ax1 = plt.subplots()
    df['Tipo'].value_counts().plot(kind='bar', ax=ax1)
    st.pyplot(fig1)

    st.subheader("Distribuição por Prioridade")
    fig2, ax2 = plt.subplots()
    df['Prioridade'].value_counts().plot(kind='pie', autopct='%1.1f%%', ax=ax2)
    st.pyplot(fig2)

    st.subheader("Estimativa de Esforço")
    if 'Complexidade' in df.columns and 'Esforco (horas)' in df.columns:
        model = LinearRegression()
        model.fit(df[['Complexidade']], df['Esforco (horas)'])
        complexidade = st.slider("Complexidade estimada", 1, 5, 3)
        previsao = model.predict([[complexidade]])[0]
        st.write(f"Esforço estimado: {previsao:.2f} horas")

    st.subheader("Sugestão de Requisito com IA")
    st.write("O sistema deve permitir autenticação via biometria.")

    if st.button("Gerar Relatório PDF"):
        doc = fitz.open()
        page = doc.new_page()

        page.insert_text((72, 72), "Relatório de Requisitos", fontsize=14)
        y = 100
        for _, row in df.iterrows():
            texto = f"- {row['ID']}: {row['Descrição']} ({row['Tipo']}, Prioridade: {row['Prioridade']})"
            page.insert_text((72, y), texto, fontsize=11)
            y += 15

        page.insert_text((72, y+15), f"Esforço estimado para complexidade {complexidade}: {previsao:.2f} horas", fontsize=11)
        page.insert_text((72, y+30), "Sugestão de requisito: O sistema deve permitir autenticação via biometria.", fontsize=11)

        doc.save("assistente_requisitos/relatorio_requisitos.pdf")
        doc.close()

        with open("assistente_requisitos/relatorio_requisitos.pdf", "rb") as f:
            st.download_button("Baixar Relatório PDF", f, file_name="relatorio_requisitos.pdf")
else:
    st.info("Envie um arquivo CSV para iniciar.")

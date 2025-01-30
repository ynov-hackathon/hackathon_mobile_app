import streamlit as st
import joblib
import pandas as pd
from sklearn.preprocessing import LabelEncoder, StandardScaler


try:
    model = joblib.load('recycling_model_rf.pkl')
    label_encoders = joblib.load('label_encoders.pkl')
    scaler = joblib.load('scaler.pkl')
    st.success("Modèle chargé avec succès!")
except Exception as e:
    st.error(f"Erreur lors du chargement du modèle: {e}")
    st.stop()


features = ['product_name', 'categories_fr', 'packaging', 'popularity_tags', 
            'Région', 'Commune', 'nutrition-score-fr_100g', 'carbon-footprint_100g']


st.title("Prédiction des Points Bonus pour le Tri des Déchets")


product_name = st.text_input("Nom du produit", "Eau minérale")
categories_fr = st.text_input("Catégorie", "Boissons")
packaging = st.text_input("Emballage", "Bouteille plastique")
popularity_tags = st.text_input("Popularité", "Aucune donnée")


region = st.selectbox("Région", ["Île-de-France", "Provence-Alpes-Côte d'Azur", "Bretagne", "Nouvelle-Aquitaine"])
commune = st.selectbox("Commune", ["Paris", "Marseille", "Rennes", "Bordeaux"])


nutrition_score = st.number_input("Score nutritionnel (100g)", value=0.0, format="%.2f")
carbon_footprint = st.number_input("Empreinte carbone (100g)", value=0.0, format="%.2f")


if st.button("Prédire les Points Bonus"):
    try:
        
        data = pd.DataFrame([[product_name, categories_fr, packaging, popularity_tags, 
                              region, commune, nutrition_score, carbon_footprint]], 
                             columns=features)

       
        for col in label_encoders.keys():
            if data[col][0] in label_encoders[col].classes_:
                data[col] = label_encoders[col].transform(data[col])
            else:
                st.error(f"Valeur inconnue pour '{col}': {data[col][0]}")
                st.stop()

        
        data[['nutrition-score-fr_100g', 'carbon-footprint_100g']] = scaler.transform(
            data[['nutrition-score-fr_100g', 'carbon-footprint_100g']]
        )

        
        prediction = model.predict(data)[0]

        
        st.success(f"Le nombre de points bonus estimé est : {int(prediction)}")

    except Exception as e:
        st.error(f"Erreur lors de la prédiction : {e}")
        
import pandas as pd
import math
import pickle

# create a streamlit app

import streamlit as st

# create a title and a subheader
st.title('Heart Failure Prediction App')

# insert image at home page
st.image('heart-failure-image.jpg', width=500)

# load the model
model = pickle.load(open('model.pkl', 'rb'))

def predict(X): 
    y = model.predict(X)
    return y

# generate streamlit inputs for the following variables: age, sex, bmi, bp, s1, s2, s3, s4, s5, s6
def getInputs():
 
    with st.sidebar:
        # input for age
        age = st.slider('age', 20, 120, 30)

        # input for sex
        anemia = st.radio("anemia", ('no', 'yes') )
        if anemia == 'no': 
            anemia = 0
        else:
            anemia = 1

        # input for Creatinine Phosphokinase level 
        cp_level  = st.number_input('creatinine phosphokinase level (mcg/L)', min_value=1, max_value=8000, format='%d')

        # input for bp
        diabetes  = st.radio('Diabetes ', ('no', 'yes'))
        if diabetes == 'no': 
            diabetes = 0
        else:
            diabetes = 1

        # input for Ejection Fraction
        ejection = st.slider('Ejection fraction (percent)', 0, 100, 60)
        

        # input for High Blood Pressure
        hbp = st.radio('high blood presure', ('no', 'yes'))
        if hbp ==    'no':
            hbp = 0
        else:
            hbp = 1
        
        # input for Platelets
        platelets = st.number_input('platelets (kiloplatelets/mL)', value=300000, step=1)
        
        # input for Serum creatinine
        serum_creatinine = st.number_input('serum creatinine (mg/dL)', value=0.8)
        
        # input for Serum Sodium
        serum_sodium  = st.number_input('serum sodium (mEq/L)', value=130, step=1)
        
        # input for sex
        sex = st.radio('sex', ('female', 'male'))
        if sex == 'female': 
            sex = 0
        else:
            sex =1

        # input for Smoking
        smoking = st.radio('smoking', ('no', 'yes'))
        if smoking == 'no':
            smoking = 0
        else:
            smoking = 1

        time = st.number_input('Follow-up period (days)', step=1)

        values = [[age, anemia, cp_level, diabetes, ejection, hbp, platelets, serum_creatinine, serum_sodium, sex, smoking, time]]
    
        if st.button('Predict'):
            y = predict(values)
            return y[0] 



if __name__ == "__main__":
    y = getInputs()
    
    if y is not None:
        if y == 0:
            st.write('Predicted Heart Failure: No')
        else:
            st.write('Predicted Heart Failure: Yes')
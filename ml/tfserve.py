from flask import Flask
from flask import request
from flask import Response
from flask import jsonify
import numpy as np
import tflite_runtime.interpreter as tflite
import pandas as pd

app = Flask(__name__)
userDF = pd.read_csv('./Data/clientsSynthAgg.csv')
interpreter = tflite.Interpreter(model_path="caminar.tflite")
interpreter.allocate_tensors()
# Get input and output tensors. Examining these will help to understand how to input data and get the results
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()
# For a model taking floating point inputs, the steps to get the prediction response would be something like:
@app.route("/")
def main():
    duration = request.args.get('duration')
    user = request.args.get('user')
    print(user)
    userData = userDF[userDF['NU_CTE_COD'] == user].copy()
    userDataInfer = userData.drop(columns=['CD_ESTADO','CD_POSTAL','CD_SEXO', 'NU_CTE_COD','acc','caminar','ver','escuchar','hablar','cuidado','recordar','mental', 'EDAD']).copy().reset_index(drop=True)
    userDataInfer = userDataInfer.astype('float32')
    infered = {
        'acc': 0,
        'caminar': 0,
        'ver': 0,
        'escuchar': 0,
        'hablar': 0,
        'cuidado': 0,
        'recordar': 0,
        'mental': 0
    }
    if len(userData) > 0:
        infered = {
            'acc': userData.iloc[0]['acc'],
            'caminar': userData.iloc[0]['caminar'],
            'ver': userData.iloc[0]['ver'],
            'escuchar': userData.iloc[0]['escuchar'],
            'hablar': userData.iloc[0]['hablar'],
            'cuidado': userData.iloc[0]['cuidado'],
            'recordar': userData.iloc[0]['recordar'],
            'mental': userData.iloc[0]['mental']
        }
    interpreter.set_tensor(input_details[0]['index'],userDataInfer.to_numpy())
    interpreter.invoke()
    output_data = interpreter.get_tensor(output_details[0]['index'])
    prediction = np.squeeze(output_data)
    print(prediction)
    return jsonify(infered)

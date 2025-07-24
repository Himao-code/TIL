# main.py
# pip install fastapi
# pip install uvicorn[standard]


from fastapi import FastAPI
import random


     
app = FastAPI()

@app.get('/hi')
def hi():
    return {'status': 'ok'}

@app.get('/lotto')
def lotto():
    return {
        'numbers' : random.sample(range(1, 46), 6)
    }

@app.get('gogogo')
def gogogo():
#메세지를 보내기
     return {'status': 'gogogo'}
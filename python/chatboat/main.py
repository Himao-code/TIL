# main.py
# pip install fastapi
# pip install uvicorn[standard]


from fastapi import FastAPI, Request
import random
import requests
from dotenv import load_dotenv
import os
from openai import OpenAI

# env파일에 내용들을 불러옴
load_dotenv()

     
app = FastAPI()



def send_message(chat_id, message,):
    # .env 에서 'TELEGRAM_BOT_TOKEN' 해당하는 내용을 가져옴
    bot_token = os.getenv('TELEGRAM_BOT_TOKEN')
    URL = f'https://api.telegram.org/bot{bot_token}'
    
    body = {
        # 사용자 chat_id는 어디서 가져오지?
    'chat_id': '8264346924',
    'text': message
    }
    requests.get(URL + f'/sendMessage', body)
    

@app.post('/telegram')
async def telegram(request: Request):
    print('텔레그램에서 요청이 들어왔다!')

    data = await request.json()
    sender_id = data['message']['chat']['id']
    input_msg = data['message']['text']
    client = OpenAI(api_key=os.getenv('OPENAI_API_KEY'))
    res = client.responses.create(
        model='gpt-4.1-mini',
        input=input_msg,
        instructions='너는 정말 진짜 다정하고 매일매일이 스윗한 29세 스윗가이야',
        temperature=1.0
    )
   

    send_message(sender_id, res.output_text)
    return {'status': '굿'}


@app.get('/lotto')
def lotto():
    return {
        'numbers' : random.sample(range(1, 46), 6)
    }

@app.get('gogogo')
def gogogo():
#메세지를 보내기
     return {'status': 'gogogo'}
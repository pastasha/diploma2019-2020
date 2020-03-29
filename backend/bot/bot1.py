import requests
from bottle import run, post, response, request as bottle_request
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

BOT_URL = 'https://api.telegram.org/bot899635646:AAFOHKW4Wg3gMBN2AvdKrRndg2Oy_C1tRnA/'
data_from_form = {}


@csrf_exempt
def order_view(request):
    if request.method == "POST":
        dirty_data = request.POST

        for k, v in dirty_data.items():
            data_from_form[k[5:-1]] = v

        print(data_from_form)
        return HttpResponse('post')
    else:
        print('проблема ті че творишь')
        return HttpResponse('no post')


def get_chat_id(data):
    """   Method to extract chat id from telegram request.   """
    chat_id = data['message']['chat']['id']
    return chat_id


def get_message(data):
    """    Method to extract message id from telegram request.    """
    message_text = data_from_form # data['message']['text']
    return message_text


def send_message(prepared_data):
    """    Prepared data should be json which includes at least `chat_id` and `text`    """
    message_url = BOT_URL + 'sendMessage'
    requests.post(message_url, json=prepared_data)  # don't forget to make import requests lib


def prepare_data_for_answer(data):
    answer = get_message(data)
    # answer = "henlo"

    json_data = {
        "chat_id": get_chat_id(data),
        "text": answer,
    }

    return json_data


@post('/')
def main():
    data = bottle_request.json

    answer_data = prepare_data_for_answer(data)
    send_message(answer_data)  # <--- function for sending answer
    print('ready!!!!')
    return response  # status 200 OK by default


if __name__ == '__main__':
    run(host='127.0.0.1', port=8082, debug=True)



"""api.telegram.org/bot899635646:AAFOHKW4Wg3gMBN2AvdKrRndg2Oy_C1tRnA/setWebHook?url=https:///da48b352.ngrok.io/"""
"""api.telegram.org/bot899635646:AAFOHKW4Wg3gMBN2AvdKrRndg2Oy_C1tRnA/getWebhookInfo"""

""""""

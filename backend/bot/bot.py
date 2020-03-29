import json

import requests
from django.http import HttpResponse
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt
from django.core.mail import send_mail

from bot.forms import OrderForm, CommentForm

BOT_URL = 'https://api.telegram.org/bot899635646:AAFOHKW4Wg3gMBN2AvdKrRndg2Oy_C1tRnA/'
data_from_form = {}


def send_message(prepared_data):
    """    Prepared data should be json which includes at least `chat_id` and `text`    """
    message_url = BOT_URL + 'sendMessage?chat_id=' + str(prepared_data["chat_id"]) + '&text=' + str(
        prepared_data["text"])
    requests.post(message_url)  # don't forget to make import requests lib


def form_validation(form):
    if form.is_valid():
        post = form.save(commit=False)
        # post.datetime = timezone.now()
        post.save()
        print('good')
        return True
    else:
        print('bad')
        return False


@csrf_exempt
def order_form(request):
    if request.method == "POST":
        dirty_data = request.POST
        form = OrderForm(request.POST)

        data = ''
        for k in dirty_data.keys():
            data = k

        data = json.loads(data)

        message = "НОВЫЙ ЗАКАЗ\n\nИмя и фамилия: %s\nСтрана: %s\nГород: %s\nМобильный телефон: %s\n" \
                  "Хочу продолжать общение посредством %s\n" \
                  % (data["full_name"], data["country"], data["city"],
                     data["telephone_number"], data["keep_in_touch"])

        if data["nickname"] != '':
            message += "Никнейм: %s\n" % (data["nickname"])

        message += "Получение заказа: %s\nСпособ оплаты: %s\n\nКартина:%s\nОбщая стоимость:$%s\n\nДата заказа: %s" \
                   % (data["receive"], data["payment"], data["picture"], data["total_amount"], data["datetime"])
        json_data = {
            "chat_id": '322095460',
            "text": message,
        }

        """if form_validation(form):
            send_message(json_data)
            send_mail('НОВЫЙ ЗАКАЗ', message, 'papastasha@gmail.com',
                  ['polinicus@gmail.com'], fail_silently=False)
            print(data)
            return HttpResponse('post')
        else:
            print('проблема validation ті че творишь')
            return HttpResponse('no post')"""
        send_message(json_data)
        print(data)
        return HttpResponse('post')
    else:
        print('проблема ті че творишь')
        return HttpResponse('no post')


@csrf_exempt
def comment_form(request):
    if request.method == "POST":
        dirty_data = request.POST

        data = ''
        for k in dirty_data.keys():
            data = k

        data = json.loads(data)

        message = "НОВЫЙ КОММЕНТАРИЙ\n\nКантина: %s\nИмя и фамилия: %s\nОбратная связь: %s\n" \
                  "Комментарий: %s\n\nДата отправки: %s"\
                  % (data["picture"], data["full_name"], data["email_or_phone"],
                     data["comment"], data["datetime"])

        json_data = {
            "chat_id": '322095460',
            "text": message,
        }

        send_message(json_data)
        """send_mail('НОВЫЙ ЗАКАЗ', message, 'papastasha@gmail.com',
                  ['polinicus@gmail.com'], fail_silently=False)"""
        print(data)
        return HttpResponse('post')
    else:
        print('проблема ті че творишь')
        return HttpResponse('no post')



"""api.telegram.org/bot899635646:AAFOHKW4Wg3gMBN2AvdKrRndg2Oy_C1tRnA/setWebHook?url=https://2462eae3.ngrok.io/send-message/"""
"""https://api.telegram.org/bot899635646:AAFOHKW4Wg3gMBN2AvdKrRndg2Oy_C1tRnA/sendMessage?chat_id=322095460&text=<<text>>"""

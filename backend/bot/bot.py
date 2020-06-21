from mosi.config import TOKEN
from django.views.decorators.csrf import csrf_exempt
import bot.bot_funcs as bf
import telebot
from bot.forms import OrderForm, CommentForm
from django.http import HttpResponse

bot = telebot.TeleBot(TOKEN)


@csrf_exempt
def order_form(request):
    if request.method == "POST":
        data = bf.to_clear_data(request.POST)

        form = OrderForm(data)

        if form.is_valid():
            form.save()
            print("--Order saved--")
        else:
            print("--There are errors in order form--")
            print(form.errors)

        message = "НОВЫЙ ЗАКАЗ\n\nИмя и фамилия: %s\nСтрана: %s\nГород: %s\nМобильный телефон: %s\n" \
                  "Хочу продолжать общение посредством %s\n" \
                  % (data["full_name"], data["country"], data["city"],
                     data["telephone_number"], data["keep_in_touch"])

        if data["nickname"] != '':
            message += "Никнейм: %s\n" % (data["nickname"])

        message += "Получение заказа: %s\nСпособ оплаты: %s\n\nКартина:%s\nОбщая стоимость:$%s\n\nДата заказа: %s" \
                   % (data["receive"], data["payment"], data["picture_with_price_list"], data["total_amount"], data["datetime"])

        json_data = {
            "chat_id": '322095460',
            "text": message,
        }

        bf.send_message(json_data)
        print(data)
        return HttpResponse('post')
    else:
        print('проблема ті че творишь')
        return HttpResponse('no post')


@csrf_exempt
def comment_form(request):
    if request.method == "POST":
        data = bf.to_clear_data(request.POST)

        form = CommentForm(data)

        if form.is_valid():
            form.save()
            print("--Comment saved--")
        else:
            print("--There are errors in comment form--")
            print(form.errors)

        message = "НОВЫЙ КОММЕНТАРИЙ\n\nКантина: %s\nИмя и фамилия: %s\nОбратная связь: %s\n" \
                  "Комментарий: %s\n\n" \
                  "Посетите панель администратора: http://127.0.0.1:8000/comments/" \
                  % (data["picture_id"], data["full_name"], data["email_or_phone"],
                     data["comment"])

        json_data = {
            "chat_id": '322095460',
            "text": message,
        }

        bf.send_message(json_data)
        return HttpResponse('post')
    else:
        print('проблема ті че творишь')
        return HttpResponse('no post')



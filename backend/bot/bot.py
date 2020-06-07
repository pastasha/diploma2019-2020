import json
import datetime
from mosi.config import TOKEN, CHAT_ID
from django.shortcuts import get_object_or_404
from bot.models import Comment
from django.http import HttpResponse
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt
from django.core.mail import send_mail
import bot.bot_funcs as bf
import telebot
from telebot import types
from bot.forms import OrderForm, CommentForm
from django.http import HttpResponse
from rest_framework.response import Response
from rest_framework.views import APIView

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
                  "Комментарий: %s\n\nДата отправки: %s" \
                  % (data["picture"], data["full_name"], data["email_or_phone"],
                     data["comment"], data["datetime"])

        send_comment_to_bot(message)
        return HttpResponse('post')
    else:
        print('проблема ті че творишь')
        return HttpResponse('no post')


@bot.message_handler(content_types=["text"])
def send_comment_to_bot(message):
    keyboard = types.InlineKeyboardMarkup()
    callback_button_yes = types.InlineKeyboardButton(text="Подтвердить", callback_data="confirm")
    callback_button_no = types.InlineKeyboardButton(text="Удалить", callback_data="delete")
    keyboard.add(callback_button_yes, callback_button_no)
    bot.send_message(CHAT_ID, message, reply_markup=keyboard)


@bot.callback_query_handler(func=lambda call: True)
def callback_inline(call):
    if call.data == "confirm":
        print('1')
        bot.answer_callback_query(callback_query_id=call.id, show_alert=False, text="Комментарий опубликован")
    elif call.data == "delete":
        bot.answer_callback_query(callback_query_id=call.id, show_alert=False, text="Комментарий удален")
        print('0')
        # bot.edit_message_text(chat_id=CHAT_ID, message_id=call.message.message_id, text="Пыщь")


class UpdateBot(APIView):
    def post(self, request):
        json_str = request.body.decode('UTF-8')
        update = types.Update.de_json(json_str)
        bot.process_new_updates([update])

        return Response({'code': 200})



"""if call.message:
    if call.data == "test":
        bot.edit_message_text(chat_id=CHAT_ID, message_id=call.message.message_id, text="Пыщь")
        bot.answer_callback_query(callback_query_id=call.id, show_alert=False, text="Пыщь!")
        """
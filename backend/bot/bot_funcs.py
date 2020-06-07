import json

from mosi.config import BOT_URL
import requests


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


def to_clear_data(dirty_data):
    data = ''
    for k in dirty_data.keys():
        data = k
    data = json.loads(data)
    print(data)
    return data


"""
@csrf_exempt
def comment_form(request):
    if request.method == "POST":
        dirty_data = request.POST

        data = ''
        for k in dirty_data.keys():
            data = k

        data = json.loads(data)

        message = "НОВЫЙ КОММЕНТАРИЙ\n\nКантина: %s\nИмя и фамилия: %s\nОбратная связь: %s\n" \
                  "Комментарий: %s\n\nДата отправки: %s" \
                  % (data["picture"], data["full_name"], data["email_or_phone"],
                     data["comment"], data["datetime"])

        default_test(message)
        print(data)
        return HttpResponse('post')
    else:
        print('проблема ті че творишь')
        return HttpResponse('no post')"""


"""api.telegram.org/bot899635646:AAFOHKW4Wg3gMBN2AvdKrRndg2Oy_C1tRnA/setWebHook?url=https://2462eae3.ngrok.io/send-message/"""
"""https://api.telegram.org/bot899635646:AAFOHKW4Wg3gMBN2AvdKrRndg2Oy_C1tRnA/sendMessage?chat_id=322095460&text=<<text>>"""

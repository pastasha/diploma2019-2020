from django.shortcuts import render
from catalog.models import Picture, Diploma, Exhibition, \
    Methodical, Technique, Press
from bot.models import Order, Comment


def index(request):
    """
    Функция отображения для домашней страницы сайта.
    """
    # Генерация "количеств" некоторых главных объектов
    num_pictures = Picture.objects.all().count()
    num_diplomas = Diploma.objects.all().count()
    num_exhibition = Exhibition.objects.all().count()
    num_technique = Technique.objects.all().count()
    num_methodical = Methodical.objects.all().count()
    num_press = Press.objects.all().count()
    num_orders = Order.objects.all().count()
    num_comments = Comment.objects.all().count()

    # Отрисовка HTML-шаблона index.html с данными внутри
    # переменной контекста context
    return render(
        request,
        'index.html',
        context={'num_pictures': num_pictures, 'num_diplomas': num_diplomas,
                 'num_exhibition': num_exhibition, 'num_technique': num_technique,
                 'num_methodical': num_methodical, 'num_press': num_press,
                 'num_orders': num_orders, 'num_comments': num_comments},
    )


def pictures(request):
    return render(
        request,
        'pictures.html',
        context={},
    )


def diplomas(request):
    return render(
        request,
        'diplomas.html',
        context={},
    )


def exhibitions(request):
    return render(
        request,
        'exhibitions.html',
        context={},
    )


def techniques(request):
    return render(
        request,
        'techniques.html',
        context={},
    )


def presses(request):
    return render(
        request,
        'presses.html',
        context={},
    )


def methodicals(request):
    return render(
        request,
        'methodicals.html',
        context={},
    )


def orders(request):
    return render(
        request,
        'orders.html',
        context={},
    )


def comments(request):
    return render(
        request,
        'comments.html',
        context={},
    )

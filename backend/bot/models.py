from django.db import models
from catalog.models import Picture
from datetime import datetime
from django.utils import timezone


class Order(models.Model):
    full_name = models.CharField(max_length=100, help_text="ФИО")
    country = models.CharField(max_length=100, help_text="Страна")
    city = models.CharField(max_length=100, help_text="Город")
    telephone_number = models.CharField(max_length=25, help_text="Телефонный номер")
    nickname = models.CharField(max_length=200, blank=True, null=True, help_text="Никнейм")

    WAY_OF_COMMUNICATION = (
        ('t', 'Telegram'),
        ('v', 'Viber'),
        ('m', 'Мобильный телефон')
    )
    keep_in_touch = models.CharField(max_length=1, choices=WAY_OF_COMMUNICATION, blank=True, default='t',
                                     help_text="Продолжать общение посредством")

    WAY_TO_RECEIVE = (
        ('n', 'самовывоз из Новой Почты'),
        ('u', 'самовывоз из Укрпочты'),
        ('c', 'курьер Новой Почты'),
        ('m', 'при встрече (только в Одессе)')
    )
    receive = models.CharField(max_length=1, choices=WAY_TO_RECEIVE, blank=True, default='n',
                               help_text="Способ получения")

    post_office = models.CharField(max_length=200, blank=True, null=True, help_text="Почтовое отделение")
    address = models.CharField(max_length=200, blank=True, null=True, help_text="Адрес")

    PAYMENT_METHOD = (
        ('o', 'оплатить заказ при получении'),
        ('p', 'перевод на карту')
    )
    payment = models.CharField(max_length=1, choices=PAYMENT_METHOD, blank=True, default='o',
                               help_text="Способ оплаты")

    total_amount = models.IntegerField(help_text="Общая стоимость")
    comment = models.CharField(max_length=500, blank=True, null=True, help_text="Комментарий")
    picture_with_price_list = models.CharField(max_length=600, help_text="Комментарий")
    datetime = models.DateTimeField(default=timezone.now, blank=True, help_text="Дата оформления")
    is_confirm = models.BooleanField(default=False)

    def __str__(self):
        return self.full_name


class Comment(models.Model):
    full_name = models.CharField(max_length=100, help_text="ФИО")
    email_or_phone = models.CharField(max_length=100, help_text="Электронная почта или номер телефона")
    comment = models.CharField(max_length=600, help_text="Комментарий")
    datetime = models.DateTimeField(default=timezone.now, blank=True, null=True, help_text="Дата публикации")
    picture_id = models.CharField(max_length=100, help_text="Картина")
    is_confirm = models.BooleanField(default=False)

    def __str__(self):
        return self.full_name





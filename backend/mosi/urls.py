from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls import include, url
from bot.bot import order_form, comment_form

if settings.DEBUG:
    import debug_toolbar

    urlpatterns = [
        path('admin/', admin.site.urls),
        path('api/', include('catalog.urls')),
        path('bot/', include('bot.urls')),
        path('', include('admins_app.urls')),
        path('bot/order-form/', order_form, name='order_form'),
        path('bot/comment-form/', comment_form, name='comment_form'),
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ]
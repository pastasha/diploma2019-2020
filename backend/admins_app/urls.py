from django.urls import path
from .views import index, pictures, diplomas, exhibitions, techniques, \
    presses, methodicals, orders, comments

urlpatterns = [
    path('', index, name='index'),
    path('pictures/', pictures, name='pictures'),
    path('diplomas', diplomas, name='diplomas'),
    path('exhibitions', exhibitions, name='exhibitions'),
    path('techniques', techniques, name='techniques'),
    path('presses', presses, name='presses'),
    path('methodicals', methodicals, name='methodicals'),
    path('orders', orders, name='orders'),
    path('comments', comments, name='comments'),
]

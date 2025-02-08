from rest_framework import viewsets

from .models import Order, Comment
from .serializers import order, comment


class OrderWS(viewsets.ModelViewSet):
    serializer_class = order
    queryset = Order.objects.all()


class CommentWS(viewsets.ModelViewSet):
    serializer_class = comment
    queryset = Comment.objects.all()
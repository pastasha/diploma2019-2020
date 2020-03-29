from django import forms

from .models import Order, Comment


class OrderForm(forms.ModelForm):
    class Meta:
        model = Order
        fields = ('order_id', 'full_name', 'country', 'city', 'telephone_number',
                  'nickname', 'keep_in_touch', 'receive', 'post_office', 'address',
                  'payment', 'total_amount', 'comment', 'picture_with_price_list',
                  'datetime')


class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ('picture', 'full_name', 'email_or_phone', 'comment', 'datetime')

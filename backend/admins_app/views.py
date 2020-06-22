from django.http import HttpResponse
from django.contrib.auth.decorators import permission_required
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views import generic
from django.views.generic import CreateView, UpdateView, DeleteView
from django.views.decorators.csrf import csrf_protect

from catalog.models import Picture, Diploma, Exhibition, \
    Methodical, Technique, Press
from bot.models import Order, Comment


def index(request):
    num_pictures = Picture.objects.all().count()
    num_diplomas = Diploma.objects.all().count()
    num_exhibition = Exhibition.objects.all().count()
    num_technique = Technique.objects.all().count()
    num_methodical = Methodical.objects.all().count()
    num_press = Press.objects.all().count()
    num_orders = Order.objects.all().count()
    num_comments = Comment.objects.all().count()

    return render(
        request,
        'index.html',
        context={'num_pictures': num_pictures, 'num_diplomas': num_diplomas,
                 'num_exhibition': num_exhibition, 'num_technique': num_technique,
                 'num_methodical': num_methodical, 'num_press': num_press,
                 'num_orders': num_orders, 'num_comments': num_comments},
    )


# ----------------- PICTURES ----------------- #


class PicturesListView(generic.ListView):
    model = Picture
    context_object_name = 'pictures'
    template_name = 'pictures.html'


class PictureCreate(CreateView):
    model = Picture
    fields = ('Title', 'Preview', 'CreationDate', 'IdTechnique', 'SizeHeight',
              'SizeWidth', 'Materials', 'Description', 'status', 'Price')
    context_object_name = 'picture_form'
    template_name = 'picture_form.html'

    def get_success_url(self):
        return reverse_lazy('pictures')


class PictureUpdate(UpdateView):
    model = Picture
    fields = ('Title', 'Preview', 'CreationDate', 'IdTechnique', 'SizeHeight',
              'SizeWidth', 'Materials', 'Description', 'status', 'Price')
    context_object_name = 'picture_update'
    template_name = 'picture_update.html'

    def get_success_url(self):
        return reverse_lazy('pictures')


class PictureDelete(DeleteView):
    model = Picture
    success_url = reverse_lazy('pictures')
    context_object_name = 'picture_delete'
    template_name = 'picture_delete.html'

    def get_success_url(self):
        return reverse_lazy('pictures')


# ----------------- DIPLOMAS ----------------- #


class DiplomaListView(generic.ListView):
    model = Diploma
    context_object_name = 'diplomas'
    template_name = 'diplomas.html'
    paginate_by = 6


class DiplomaCreate(CreateView):
    model = Diploma
    fields = '__all__'
    context_object_name = 'diploma_form'
    template_name = 'diploma_form.html'

    def get_success_url(self):
        return reverse_lazy('diplomas')


class DiplomaUpdate(UpdateView):
    model = Diploma
    fields = '__all__'
    context_object_name = 'diploma_update'
    template_name = 'diploma_update.html'

    def get_success_url(self):
        return reverse_lazy('diplomas')


class DiplomaDelete(DeleteView):
    model = Diploma
    success_url = reverse_lazy('pictures')
    context_object_name = 'diploma_delete'
    template_name = 'diploma_delete.html'

    def get_success_url(self):
        return reverse_lazy('diplomas')


# ----------------- EXHIBITIONS ----------------- #


class ExhibitionListView(generic.ListView):
    model = Exhibition
    context_object_name = 'exhibitions'
    template_name = 'exhibitions.html'


class ExhibitionCreate(CreateView):
    model = Exhibition
    fields = "__all__"
    context_object_name = 'exhibition_form'
    template_name = 'exhibition_form.html'

    def get_success_url(self):
        return reverse_lazy('exhibitions')


class ExhibitionUpdate(UpdateView):
    model = Exhibition
    fields = "__all__"
    context_object_name = 'exhibition_update'
    template_name = 'exhibition_update.html'

    def get_success_url(self):
        return reverse_lazy('exhibitions')


class ExhibitionDelete(DeleteView):
    model = Exhibition
    success_url = reverse_lazy('exhibitions')
    context_object_name = 'exhibition_delete'
    template_name = 'exhibition_delete.html'

    def get_success_url(self):
        return reverse_lazy('exhibitions')


# ----------------- TECHNIQUES ----------------- #


class TechniqueListView(generic.ListView):
    model = Technique
    context_object_name = 'techniques'
    template_name = 'techniques.html'


class TechniqueCreate(CreateView):
    model = Technique
    fields = "__all__"
    context_object_name = 'technique_form'
    template_name = 'technique_form.html'

    def get_success_url(self):
        return reverse_lazy('techniques')


class TechniqueUpdate(UpdateView):
    model = Technique
    fields = "__all__"
    context_object_name = 'technique_update'
    template_name = 'technique_update.html'

    def get_success_url(self):
        return reverse_lazy('techniques')


class TechniqueDelete(DeleteView):
    model = Technique
    success_url = reverse_lazy('techniques')
    context_object_name = 'technique_delete'
    template_name = 'technique_delete.html'

    def get_success_url(self):
        return reverse_lazy('techniques')


# ----------------- PRESSES ----------------- #


class PressListView(generic.ListView):
    model = Press
    context_object_name = 'presses'
    template_name = 'presses.html'


class PressCreate(CreateView):
    model = Press
    fields = '__all__'
    context_object_name = 'press_form'
    template_name = 'press_form.html'

    def get_success_url(self):
        return reverse_lazy('presses')


class PressUpdate(UpdateView):
    model = Press
    fields = '__all__'
    context_object_name = 'press_update'
    template_name = 'press_update.html'

    def get_success_url(self):
        return reverse_lazy('presses')


class PressDelete(DeleteView):
    model = Press
    success_url = reverse_lazy('pictures')
    context_object_name = 'press_delete'
    template_name = 'press_delete.html'

    def get_success_url(self):
        return reverse_lazy('presses')


# ----------------- METHODICALS ----------------- #


class MethodicalListView(generic.ListView):
    model = Methodical
    context_object_name = 'methodicals'
    template_name = 'methodicals.html'


class MethodicalCreate(CreateView):
    model = Methodical
    fields = '__all__'
    context_object_name = 'methodical_form'
    template_name = 'methodical_form.html'

    def get_success_url(self):
        return reverse_lazy('methodicals')


class MethodicalUpdate(UpdateView):
    model = Methodical
    fields = '__all__'
    context_object_name = 'methodical_update'
    template_name = 'methodical_update.html'

    def get_success_url(self):
        return reverse_lazy('methodicals')


class MethodicalDelete(DeleteView):
    model = Methodical
    success_url = reverse_lazy('methodicals')
    context_object_name = 'methodical_delete'
    template_name = 'methodical_delete.html'

    def get_success_url(self):
        return reverse_lazy('methodicals')


# ----------------- ORDERS ----------------- #

@csrf_protect
def order_processing(request):
    if request.method == 'POST':
        data = {}
        for k, v in request.POST.items():
            data[k[0:-2]] = v

        print(data.keys())
        _order = Order.objects.get(id=data['state[order_i'])

        if data['state[stat'] == "confirm":
            _order.is_confirm = True
            _order.save()
            print("Заказ сохранен.")
        elif data['state[stat'] == "ban":
            _order.delete()
            print("Заказ удален.")

        return HttpResponse('post')
    else:
        print('проблема ті че творишь')
        return HttpResponse('no post')


@permission_required('catalog.can_mark_returned')
def order(request):
    print(request.method)
    if request.method == 'POST':
        full_name = Order.full_name
        country = Order.country
        city = Order.city
        telephone_number = Order.telephone_number
        nickname = Order.nickname
        keep_in_touch = Order.keep_in_touch
        receive = Order.receive
        post_office = Order.post_office
        address = Order.address
        payment = Order.payment
        total_amount = Order.total_amount
        comment = Order.comment
        picture_with_price_list = Order.picture_with_price_list
        datetime = Order.datetime

        return render(
            request,
            'order-detail.html',
            context={'full_name': full_name, 'country': country,
                     'city': city, 'telephone_number': telephone_number,
                     'nickname': nickname, 'keep_in_touch': keep_in_touch,
                     'receive': receive, 'post_office': post_office,
                     'address': address, 'payment': payment,
                     'total_amount': total_amount, 'comment': comment,
                     'picture_with_price_list': picture_with_price_list, 'datetime': datetime},
        )
    else:
        print('проблема ті че творишь')
        return HttpResponse('no post')


class OrderDetailView(generic.DetailView):
    model = Order
    context_object_name = 'order'
    template_name = 'order_detail.html'


class OrdersListView(generic.ListView):
    model = Order
    context_object_name = 'orders'
    template_name = 'orders.html'
    paginate_by = 10


# ----------------- COMMENTS ----------------- #


@permission_required('catalog.can_mark_returned')
def comment(request):
    print(request.method)
    if request.method == 'POST':
        full_name = Comment.full_name
        email_or_phone = Comment.email_or_phone
        comment = Comment.comment
        datetime = Comment.datetime
        picture_id = Comment.picture_id

        return render(
            request,
            'comment-detail.html',
            context={'full_name': full_name, 'email_or_phone': email_or_phone,
                     'comment': comment, 'datetime': datetime,
                     'picture_id': picture_id},
        )
    else:
        print('проблема ті че творишь')
        return HttpResponse('no post')


@csrf_protect
def comment_processing(request):
    if request.method == 'POST':
        data = {}
        for k, v in request.POST.items():
            data[k[0:-2]] = v

        print(data)
        _comment = Comment.objects.get(id=data['state[comment_i'])

        if data['state[stat'] == "confirm":
            _comment.is_confirm = True
            _comment.save()
            print("Комментарий сохранен.")
        elif data['state[stat'] == "ban":
            _comment.delete()
            print("Комментарий удален.")

        return HttpResponse('post')
    else:
        print('проблема ті че творишь')
        return HttpResponse('no post')


class CommentDetailView(generic.DetailView):
    model = Comment
    context_object_name = 'comment'
    template_name = 'comment_detail.html'


class CommentsListView(generic.ListView):
    model = Comment
    context_object_name = 'comments'
    template_name = 'comments.html'
    paginate_by = 10

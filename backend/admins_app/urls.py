from django.urls import path
from django.conf.urls import url
from admins_app import views

urlpatterns = [
    path('', views.index, name='index'),

    path('picture-form/', views.PictureCreate.as_view(), name='picture-form'),
    path('pictures/', views.PicturesListView.as_view(), name='pictures'),
    url(r'^picture/(?P<pk>\d+)/update/$', views.PictureUpdate.as_view(), name='picture-update'),
    url(r'^picture/(?P<pk>\d+)/delete/$', views.PictureDelete.as_view(), name='picture-delete'),

    path('diploma-form/', views.DiplomaCreate.as_view(), name='diploma-form'),
    path('diplomas/', views.DiplomaListView.as_view(), name='diplomas'),
    url(r'diploma/(?P<pk>\d+)/update/$', views.DiplomaUpdate.as_view(), name='diploma-update'),
    url(r'diploma/(?P<pk>\d+)/delete/$', views.DiplomaDelete.as_view(), name='diploma-delete'),

    path('exhibition-form/', views.ExhibitionCreate.as_view(), name='exhibition-form'),
    path('exhibitions/', views.ExhibitionListView.as_view(), name='exhibitions'),
    url(r'^exhibition/(?P<pk>\d+)/update/$', views.ExhibitionUpdate.as_view(), name='exhibition-update'),
    url(r'^exhibition/(?P<pk>\d+)/delete/$', views.ExhibitionDelete.as_view(), name='exhibition-delete'),

    path('technique-form/', views.TechniqueCreate.as_view(), name='technique-form'),
    path('techniques/', views.TechniqueListView.as_view(), name='techniques'),
    url(r'^technique/(?P<pk>\d+)/update/$', views.TechniqueUpdate.as_view(), name='technique-update'),
    url(r'^technique/(?P<pk>\d+)/delete/$', views.TechniqueDelete.as_view(), name='technique-delete'),

    path('press-form/', views.PressCreate.as_view(), name='press-form'),
    path('presses/', views.PressListView.as_view(), name='presses'),
    url(r'press/(?P<pk>\d+)/update/$', views.PressUpdate.as_view(), name='press-update'),
    url(r'press/(?P<pk>\d+)/delete/$', views.PressDelete.as_view(), name='press-delete'),


    path('orders', views.OrdersListView.as_view(), name='orders'),
    url(r'^order/(?P<pk>\d+)$', views.OrderDetailView.as_view(), name='order-detail'),
    path('order-processing/', views.order_processing, name='order_processing'),

    path('comments/', views.CommentsListView.as_view(), name='comments'),
    url(r'^comment/(?P<pk>\d+)$', views.CommentDetailView.as_view(), name='comment-detail'),
    path('comment-processing/', views.comment_processing, name='comment_processing'),
]

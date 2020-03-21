from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls import include, url

if settings.DEBUG:
    import debug_toolbar

    urlpatterns = [
        path('admin/', admin.site.urls),
        path('api/', include('catalog.urls')),
        path('', include('catalog.urls')),
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ]
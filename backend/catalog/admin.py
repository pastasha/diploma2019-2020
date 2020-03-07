from django.contrib import admin
from .models import (
    Picture,
    Diploma,
    Technique,
    Exhibition,
    Methodical,
    Press,
    photoDiploma,
    photoGallery
)

admin.site.register(Picture)
admin.site.register(Diploma)
admin.site.register(Technique)
admin.site.register(Exhibition)
admin.site.register(Methodical)
admin.site.register(Press)
admin.site.register(photoDiploma)
admin.site.register(photoGallery)
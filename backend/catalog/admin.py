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


class GalleryInline(admin.TabularInline):
    model = photoGallery
    extra = 3


class DiplomaInline(admin.TabularInline):
    model = photoDiploma
    extra = 3


class PictureAdmin(admin.ModelAdmin):
    inlines = [GalleryInline, ]


class DiplomaAdmin(admin.ModelAdmin):
    inlines = [DiplomaInline, ]


admin.site.register(Technique)
admin.site.register(Exhibition)
admin.site.register(Methodical)
admin.site.register(Press)
admin.site.register(Picture, PictureAdmin)
admin.site.register(Diploma, DiplomaAdmin)

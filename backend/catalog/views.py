from django.shortcuts import render
from rest_framework import viewsets, status

from .models import Picture, Diploma, Exhibition, Methodical, \
    photoGallery, photoDiploma, Technique

from .serializers import picture, diploma, exhibition, methodical, \
    photo_gallery, photo_diploma, technique


class PictureWS(viewsets.ModelViewSet):
    serializer_class = picture
    queryset = Picture.objects.all()


class photo_galleryWS(viewsets.ModelViewSet):
    serializer_class = photo_gallery
    queryset = photoGallery.objects.all()


class DiplomaWS(viewsets.ModelViewSet):
    serializer_class = diploma
    queryset = Diploma.objects.all()


class photo_diplomaWS(viewsets.ModelViewSet):
    serializer_class = photo_diploma
    queryset = photoDiploma.objects.all()


class ExhibitionWS(viewsets.ModelViewSet):
    serializer_class = exhibition
    queryset = Exhibition.objects.all()


class MethodicalWS(viewsets.ModelViewSet):
    serializer_class = methodical
    queryset = Methodical.objects.all()


class TechniqueWS(viewsets.ModelViewSet):
    serializer_class = technique
    queryset = Technique.objects.all()

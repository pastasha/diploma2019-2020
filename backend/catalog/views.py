from rest_framework import viewsets

from .models import Picture, Diploma, Exhibition, Methodical, \
    photoGallery, photoDiploma, Technique, Press

from .serializers import picture, diploma, exhibition, methodical, \
    photo_gallery, photo_diploma, technique, press


class MethodicalWS(viewsets.ModelViewSet):
    serializer_class = methodical
    queryset = Methodical.objects.all()


class PictureWS(viewsets.ModelViewSet):
    serializer_class = picture
    queryset = Picture.objects.all().order_by('-CreationDate')


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


class PressWS(viewsets.ModelViewSet):
    serializer_class = press
    queryset = Press.objects.all()


class TechniqueWS(viewsets.ModelViewSet):
    serializer_class = technique
    queryset = Technique.objects.all()

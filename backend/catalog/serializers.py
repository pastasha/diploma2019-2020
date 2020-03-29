from rest_framework import serializers
from .models import Picture, Diploma, Exhibition, Methodical, \
    photoGallery, photoDiploma, Technique, Press


class methodical(serializers.ModelSerializer):
    class Meta:
        model = Methodical
        fields = ('Name', 'Preview', 'Author', 'CreationDate', 'Path')


class picture(serializers.ModelSerializer):
    class Meta:
        model = Picture
        fields = ('id', 'Title', 'Preview', 'CreationDate', 'IdTechnique', 'SizeHeight',
                  'SizeWidth', 'Materials', 'Description', 'Hover', 'status', 'Price')


class photo_gallery(serializers.ModelSerializer):
    class Meta:
        model = photoGallery
        fields = ('image', 'picture')


class diploma(serializers.ModelSerializer):
    class Meta:
        model = Diploma
        fields = ('Title', 'Preview', 'ReleaseYear', 'IdTechnique', 'SizeHeight',
                  'SizeWidth', 'StudentsFIO', 'Description')


class photo_diploma(serializers.ModelSerializer):
    class Meta:
        model = photoDiploma
        fields = ('image', 'picture')


class exhibition(serializers.ModelSerializer):
    class Meta:
        model = Exhibition
        fields = ('Name', 'CreationDate', 'Preview', 'Place', 'Address',
                  'Managers', 'Curator', 'Catalog')


class press(serializers.ModelSerializer):
    class Meta:
        model = Press
        fields = ('Name', 'Preview', 'Author', 'CreationDate', 'Path')


class technique(serializers.ModelSerializer):
    class Meta:
        model = Technique
        fields = ('name',)

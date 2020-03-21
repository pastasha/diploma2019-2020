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
        fields = ('Title', 'Preview', 'CreationDate', 'IdTechnique', 'SizeHeight',
                  'SizeWidth', 'Materials', 'Description', 'Hover', 'status')


class photo_gallery(serializers.ModelSerializer):
    class Meta:
        model = photoGallery
        fields = ('image')#, 'Path')


class diploma(serializers.ModelSerializer):
    class Meta:
        model = Diploma
        fields = ('Title', 'Preview', 'ReleaseYear', 'IdTechnique', 'SizeHeight',
                  'SizeWidth', 'StudentsFIO', 'Description')


class photo_diploma(serializers.ModelSerializer):
    class Meta:
        model = photoDiploma
        fields = ('image')#, 'Path')


class exhibition(serializers.ModelSerializer):
    class Meta:
        model = Exhibition
        fields = ('Name', 'CreationDate', 'Preview', 'Place', 'Adress',
                  'Managers', 'Curator', 'Catalog')


class press(serializers.ModelSerializer):
    class Meta:
        model = Press
        fields = ('Name', 'Preview', 'Author', 'CreationDate', 'Path')


class technique(serializers.ModelSerializer):
    class Meta:
        model = Technique
        fields = ('name',)

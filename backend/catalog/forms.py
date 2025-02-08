from django import forms
from .models import Picture, Diploma, Exhibition, \
    Technique, Press, Methodical


class PictureForm(forms.ModelForm):
    class Meta:
        model = Picture
        fields = '__all__'


class DiplomaForm(forms.ModelForm):
    class Meta:
        model = Diploma
        fields = '__all__'


class ExhibitionForm(forms.ModelForm):
    class Meta:
        model = Exhibition
        fields = '__all__'


class TechniqueForm(forms.ModelForm):
    class Meta:
        model = Technique
        fields = '__all__'


class PressForm(forms.ModelForm):
    class Meta:
        model = Press
        fields = '__all__'


class MethodicalForm(forms.ModelForm):
    class Meta:
        model = Methodical
        fields = '__all__'

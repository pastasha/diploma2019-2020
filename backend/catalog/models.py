from django.db import models


# 5
class Technique(models.Model):
    name = models.CharField(max_length=200, help_text="Введите название техники")

    def __str__(self):
        return self.name


# 1
class Picture(models.Model):
    Title = models.CharField(max_length=100, help_text="Название картины")
    Preview = models.ImageField(
        upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/preview')
    CreationDate = models.DateField(blank=True, default="0000-00-00")
    IdTechnique = models.ForeignKey(Technique, related_name='tkp', on_delete=models.CASCADE, null=False)
    SizeHeight = models.FloatField(blank=True, help_text="Вводите высоту изделия в сантиметрах")
    SizeWidth = models.FloatField(blank=True, help_text="Вводите ширину изделия в сантиметрах")
    Materials = models.CharField(max_length=500, help_text="Ткань, кисти, бумага...")
    Description = models.CharField(max_length=1000, help_text="Добавьте описание картины")
    Hover = models.BooleanField()
    SALE_STATUS = (
        ('a', 'Author ownership'),
        ('p', 'Private collection'),
        ('s', 'On sale'),
    )
    status = models.CharField(max_length=1, choices=SALE_STATUS, blank=True, default='s', help_text="Состояние картины")
    Price = models.IntegerField(help_text="Цена")

    def __str__(self):
        return self.Title

    class Meta:
        ordering = ['Title']


# 2
class photoGallery(models.Model):
    image = models.ImageField(
        upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/main-photos',
        max_length=99999)
    picture = models.ForeignKey(Picture, on_delete=models.CASCADE, related_name='images')


# 3
class Diploma(models.Model):
    Title = models.CharField(max_length=100, help_text="Название работы")
    Preview = models.ImageField(
        upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/preview')
    ReleaseYear = models.DateField(blank=True, default="0000-00-00", help_text="Дата сдачи диплома")
    IdTechnique = models.ForeignKey(Technique, related_name='tkd', on_delete=models.CASCADE, null=True)
    SizeHeight = models.FloatField(blank=True, help_text="Вводите высоту изделия в сантиметрах")
    SizeWidth = models.FloatField(blank=True, help_text="Вводите ширину изделия в сантиметрах")
    StudentsFIO = models.CharField(max_length=200, help_text="ФИО студента")
    Description = models.CharField(max_length=1000, help_text="ФИО куратора")
    Video = models.CharField(max_length=300, help_text="Ссылка на видео YouTube")

    def __str__(self):
        print(self.Preview)
        return self.Title


# 4
class photoDiploma(models.Model):
    image = models.ImageField(
        upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/main-photos',
        max_length=9999)
    picture = models.ForeignKey(Diploma, on_delete=models.CASCADE, related_name='images')


# 6
class Exhibition(models.Model):
    Name = models.CharField(max_length=100, help_text="Название выставки")
    CreationDate = models.DateField(null=True, default="0000-00-00", blank=True)
    Preview = models.ImageField(
        upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/preview')
    Place = models.CharField(max_length=200, help_text="Место провождения")
    Address = models.CharField(max_length=200, help_text="Адрес")
    Managers = models.CharField(max_length=400, help_text="ФИО организаторов")
    Curator = models.CharField(max_length=100, help_text="ФИО курвторов")
    Catalog = models.FileField(
        upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/files')

    def __str__(self):
        return self.Name


# 7
class Methodical(models.Model):
    Name = models.CharField(max_length=100, help_text="Название методички")
    Preview = models.ImageField(
        upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/preview')
    Author = models.CharField(max_length=200, help_text="ФИО автора")
    CreationDate = models.DateField(blank=True, default="0000-00-00")
    Path = models.FileField(
        upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/files')

    def __str__(self):
        return self.Name


# 8
class Press(models.Model):
    Name = models.CharField(max_length=100, help_text="Название")
    Preview = models.ImageField(
        upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/preview',
        help_text="Фото на превью")
    Author = models.CharField(max_length=200, help_text="ФИО автора")
    CreationDate = models.DateField(blank=True, default="0000-00-00", help_text="Дата публикации")
    Path = models.FileField(
        upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/files',
        help_text="Файл с каталогом")

    def __str__(self):
        return self.Name
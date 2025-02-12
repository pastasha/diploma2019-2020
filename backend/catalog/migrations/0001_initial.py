# Generated by Django 2.1.5 on 2020-03-23 18:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Diploma',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Title', models.CharField(help_text='Название работы', max_length=100)),
                ('Preview', models.ImageField(upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/preview')),
                ('ReleaseYear', models.DateField(blank=True, default='0000-00-00', help_text='Дата сдачи диплома')),
                ('SizeHeight', models.FloatField(blank=True, help_text='Вводите высоту изделия в сантиметрах')),
                ('SizeWidth', models.FloatField(blank=True, help_text='Вводите ширину изделия в сантиметрах')),
                ('StudentsFIO', models.CharField(help_text='ФИО студента', max_length=200)),
                ('Description', models.CharField(help_text='ФИО куратора', max_length=1000)),
                ('Video', models.CharField(help_text='Ссылка на видео YouTube', max_length=300)),
            ],
        ),
        migrations.CreateModel(
            name='Exhibition',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Name', models.CharField(help_text='Название выставки', max_length=100)),
                ('CreationDate', models.DateField(blank=True, default='0000-00-00', null=True)),
                ('Preview', models.ImageField(upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/preview')),
                ('Place', models.CharField(help_text='Место провождения', max_length=200)),
                ('Address', models.CharField(help_text='Адрес', max_length=200)),
                ('Managers', models.CharField(help_text='ФИО организаторов', max_length=400)),
                ('Curator', models.CharField(help_text='ФИО курвторов', max_length=100)),
                ('Catalog', models.FileField(upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/files')),
            ],
        ),
        migrations.CreateModel(
            name='Methodical',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Name', models.CharField(help_text='Название методички', max_length=100)),
                ('Preview', models.ImageField(upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/preview')),
                ('Author', models.CharField(help_text='ФИО автора', max_length=200)),
                ('CreationDate', models.DateField(blank=True, default='0000-00-00')),
                ('Path', models.FileField(upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/files')),
            ],
        ),
        migrations.CreateModel(
            name='photoDiploma',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(max_length=200, upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/main-photos')),
                ('picture', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='images', to='catalog.Diploma')),
            ],
        ),
        migrations.CreateModel(
            name='photoGallery',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/main-photos')),
            ],
        ),
        migrations.CreateModel(
            name='Picture',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Title', models.CharField(help_text='Название картины', max_length=100)),
                ('Preview', models.ImageField(upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/preview')),
                ('CreationDate', models.DateField(blank=True, default='0000-00-00')),
                ('SizeHeight', models.FloatField(blank=True, help_text='Вводите высоту изделия в сантиметрах')),
                ('SizeWidth', models.FloatField(blank=True, help_text='Вводите ширину изделия в сантиметрах')),
                ('Materials', models.CharField(help_text='Ткань, кисти, бумага...', max_length=500)),
                ('Description', models.CharField(help_text='Добавьте описание картины', max_length=1000)),
                ('Hover', models.BooleanField()),
                ('status', models.CharField(blank=True, choices=[('a', 'Author ownership'), ('p', 'Private collection'), ('s', 'On sale')], default='s', help_text='Состояние картины', max_length=1)),
                ('Price', models.IntegerField(help_text='Цена')),
            ],
        ),
        migrations.CreateModel(
            name='Press',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Name', models.CharField(help_text='Название', max_length=100)),
                ('Preview', models.ImageField(upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/preview')),
                ('Author', models.CharField(help_text='ФИО автора', max_length=200)),
                ('CreationDate', models.DateField(blank=True, default='0000-00-00')),
                ('Path', models.FileField(upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/files')),
            ],
        ),
        migrations.CreateModel(
            name='Technique',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(help_text='Введите название техники', max_length=200)),
            ],
        ),
        migrations.AddField(
            model_name='picture',
            name='IdTechnique',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='tkp', to='catalog.Technique'),
        ),
        migrations.AddField(
            model_name='photogallery',
            name='picture',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='images', to='catalog.Picture'),
        ),
        migrations.AddField(
            model_name='diploma',
            name='IdTechnique',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='tkd', to='catalog.Technique'),
        ),
    ]

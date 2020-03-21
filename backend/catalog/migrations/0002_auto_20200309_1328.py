# Generated by Django 2.1.5 on 2020-03-09 11:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Gallery',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Title', models.CharField(help_text='Название картины', max_length=100)),
                ('Preview', models.ImageField(upload_to='C:/Users/LENOVO/Desktop/main/GitHub/diploma2019-2020/frontend/src/assets/pics/preview')),
                ('CreationDate', models.DateField(blank=True, default='0000-00-00')),
                ('SizeHeight', models.FloatField(blank=True, help_text='Вводите высоту изделия в сантиметрах')),
                ('SizeWidth', models.FloatField(blank=True, help_text='Вводите ширину изделия в сантиметрах')),
                ('Materials', models.CharField(help_text='Ткань, кисти, бумага...', max_length=500)),
                ('Description', models.CharField(help_text='Добавьте описание картины', max_length=1000)),
                ('Hover', models.BooleanField(default=False)),
                ('status', models.CharField(blank=True, choices=[('a', 'Author ownership'), ('p', 'Private collection'), ('s', 'On sale')], default='s', help_text='Состояние картины', max_length=1)),
                ('IdTechnique', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='tkp', to='catalog.Technique')),
            ],
        ),
        migrations.RemoveField(
            model_name='picture',
            name='IdTechnique',
        ),
        migrations.DeleteModel(
            name='Picture',
        ),
    ]

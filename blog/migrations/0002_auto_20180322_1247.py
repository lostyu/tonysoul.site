# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2018-03-22 04:47
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Read',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('description', models.TextField()),
                ('author', models.CharField(max_length=50)),
                ('pub_time', models.DateTimeField()),
                ('thumbnail', models.ImageField(upload_to='read/')),
                ('url', models.URLField()),
            ],
        ),
        migrations.AlterModelOptions(
            name='post',
            options={'ordering': ['-created_time']},
        ),
        migrations.AlterField(
            model_name='post',
            name='created_time',
            field=models.DateTimeField(),
        ),
    ]

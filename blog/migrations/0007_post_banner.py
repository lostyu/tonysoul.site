# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2018-03-29 16:07
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0006_auto_20180329_1551'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='banner',
            field=models.ImageField(default='', upload_to='banner/'),
        ),
    ]

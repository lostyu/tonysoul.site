# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2018-03-28 13:53
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_auto_20180328_1328'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='is_pub',
            field=models.BooleanField(default=True),
        ),
        migrations.AddField(
            model_name='tag',
            name='is_pub',
            field=models.BooleanField(default=True),
        ),
    ]

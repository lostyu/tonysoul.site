# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2018-03-31 17:07
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0009_column'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='reprint',
            field=models.URLField(blank=True),
        ),
        migrations.AlterField(
            model_name='column',
            name='page_subtitle',
            field=models.CharField(blank=True, max_length=150),
        ),
    ]

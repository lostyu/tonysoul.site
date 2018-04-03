# -*- coding: utf-8 -*-
import sys
import importlib
from django.contrib import admin
from .models import Category, Tag, Post, Read, Column

importlib.reload(sys)
# Register your models here.


class ReadAdmin(admin.ModelAdmin):
	list_display = ['title', 'id', 'order', 'group', 'author', 'pub_time']

class TagAdmin(admin.ModelAdmin):
	list_display = ['name', 'id', 'is_pub']

class CategoryAdmin(admin.ModelAdmin):
	list_display = ['name', 'id', 'is_pub']

class PostAdmin(admin.ModelAdmin):
	list_display = ['title', 'id', 'is_pub', 'created_time']

class ColumnAdmin(admin.ModelAdmin):
	list_display = ['name', 'site_title', 'site_keywords', 'site_description', 'page_title', 'page_subtitle', 'banner']

admin.site.register(Read, ReadAdmin)
admin.site.register(Tag, TagAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Post, PostAdmin)
admin.site.register(Column, ColumnAdmin)

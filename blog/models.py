from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Category(models.Model):
	name = models.CharField(max_length=100)
	is_pub = models.BooleanField(default=True)

	def __str__(self):
		return self.name


class Tag(models.Model):
	name = models.CharField(max_length=100)
	is_pub = models.BooleanField(default=True)

	def __str__(self):
		return self.name


class Post(models.Model):
	title = models.CharField(max_length=150)
	keywords = models.CharField(default='',max_length=150)
	description = models.TextField(default='')
	body = models.TextField()
	excerpt = models.CharField(max_length=200,blank=True)
	views = models.PositiveIntegerField(default=0)
	is_pub = models.BooleanField(default=True)
	reprint = models.URLField(blank=True)

	created_time = models.DateTimeField()
	modified_time = models.DateTimeField()
	banner = models.ImageField(upload_to='banner/',default='',blank=True)

	category = models.ForeignKey(Category)
	tag = models.ManyToManyField(Tag,blank=True)
	author = models.ForeignKey(User)

	def __str__(self):
		return self.title

	class Meta:
		ordering = ['-created_time']

class Read(models.Model):
	title = models.CharField(max_length=100)
	description = models.TextField()
	author = models.CharField(max_length=50)
	pub_time = models.DateField()
	thumbnail = models.ImageField(upload_to='read/')
	url = models.URLField()
	order = models.PositiveSmallIntegerField(default=0)
	group = models.CharField(default='new',max_length=100)

	def __str__(self):
		return self.title

class Column(models.Model):
	name = models.CharField(max_length=50)
	banner = models.ImageField(upload_to='banner/',blank=True)
	site_title = models.CharField(max_length=150)
	site_keywords = models.CharField(default='',max_length=150)
	site_description = models.TextField(default='')
	page_title = models.CharField(max_length=150)
	page_subtitle = models.CharField(max_length=150,blank=True)

	def __str__(self):
		return self.name







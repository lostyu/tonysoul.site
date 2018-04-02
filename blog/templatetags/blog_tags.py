# -*- coding:utf-8 -*-
from ..models import Post, Category, Tag, Read
from django import template
from django.db.models.aggregates import Count
import random
import re

register = template.Library()

@register.simple_tag
def get_recent_posts(num=10):
 	return Post.objects.all().filter(is_pub=True)[:num]

@register.simple_tag
def get_recommend(pk,num=5):
	posts = Post.objects.all().filter(is_pub=True).exclude(id=pk)
	_len = len(posts)

	if _len > 5:
		nums = []
		b_on = True

		while b_on:
			_num = random.randint(0,_len-1)
			if len(nums) == num:
				b_on = False
				break

			if _num not in nums:
				nums.append(_num)

		_posts = []
		for i in nums:
			_posts.append(posts[i])

		return _posts
	else:
		return None




@register.simple_tag
def archives():
 	return Post.objects.filter(is_pub=True).dates('created_time', 'month', order='DESC')

@register.simple_tag
def get_categories():
 	return Category.objects.annotate(num_post=Count('post')).filter(num_post__gt=0,is_pub=True)

@register.simple_tag
def get_tags(num=10):
	return Tag.objects.annotate(num_post=Count('post')).filter(num_post__gt=0,is_pub=True)

@register.simple_tag
def get_read():
 	list_len = len(Read.objects.all())

 	if list_len == 0:
 		return None
 	else:
 		b = random.randint(1,list_len)
 		a = b - 1
 		return Read.objects.all()[a:b][0]

@register.filter
def remove_img(value):
	s = r'(!.*?\))'
	m = re.match(s, '![1_UgCnCLR0e3R3v7fnCS9ALA[1].jpeg](https://i.loli.net/2017/12/26/5a426aa723f56.jpeg) 根据 2016年 Stack Overflow 开发者调查 显示，全栈开发工程师是当今最受欢迎的开发者职业。 毫无疑问')
	if m:
		return value.replace(m.group(),'')
	return value
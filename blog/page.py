#!/usr/bin/python
# -*- coding: utf-8 -*-

from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from math import ceil


# paginator 分页器
# page_obj paginator.page()的实例
# display_page 分页的页码显示多少个
def basePage(paginator, page_obj, display_page=11):
	# 当前页码
	page_number = page_obj.number
	# 总页数
	total_number = paginator.num_pages
	# 分页范围[1,2,3,4,5,6,7,8,9]
	page_range = list(paginator.page_range)
	# display_page分页的页码显示几个[1,2,3,4,5]

	# 当前页码前后显示多少页码
	display_offset = int(ceil((display_page-1)/2))
	# 当前页左边的页码
	left = []
	# 当前页右边的页码
	right = []
	# 是否显示第一页,当页码超过显示范围[1...2,3,4,5,6]
	first = False
	# 是否显示最后一页,当页码超过显示范围[3,4,5,6,7...10]
	last = False
	# 左边省略号
	lsymbol = False
	# 右边省略号
	rsymbol = False

	# 如果当前页为1
	if page_number == 1:
		right = page_range[page_number:page_number+display_page-1]
	# 如果当前页为最后一页		
	elif page_number == total_number:
		left = page_range[(total_number-display_page) if (total_number-display_page) > 0 else 0:total_number-1]
	# 既不是第一页，也不是最后一页
	else:
		# 始终保持页码数是display_page个
		# 如果当前页左边的页码数小于 offset
		if page_number - display_offset <= 0:
			left = page_range[0:page_number-1]
			rlen = page_number + display_page - len(left) - 1
			right = page_range[page_number:rlen]
		# 如果当前页右边的页码数小于 offset
		elif total_number - page_number < display_offset:
			right = page_range[page_number:total_number]
			llen = page_number - (display_page - len(right) - 1) - 1
			left = page_range[llen if llen > 0 else 0:page_number-1]
		else:
			left = page_range[page_number - display_offset - 1:page_number-1]
			right = page_range[page_number:page_number+display_offset]

	# 如果当前页码左边的页码数大于display_offset+2个，则显示first
	if page_number - display_offset - 2 >= 0:
		first = True
		lsymbol = True

	if page_number + display_offset + 1 <= total_number:
		last = True
		rsymbol = True

	return {
		'page_obj': page_obj,
		'paginator': paginator,
		'left': left,
		'right': right,
		'first': first,
		'last': last,
		'lsymbol': lsymbol,
		'rsymbol': rsymbol
	}	


# 简单分页
# data_list 数据源
# page 当前页码
# per_page 每页显示条数
def simplePage(data_list, page=1, per_page=5, display_page=11):
	paginator = Paginator(data_list, per_page)
	
	try:
		page_obj = paginator.page(page)
	except PageNotAnInteger:
		page_obj = paginator.page(1)
	except EmptyPage:
		page_obj = paginator.page(paginator.num_pages)

	return basePage(paginator, page_obj, display_page)


# ListView分页
def listViewPage(paginator,page_obj,display_page=11):
	return basePage(paginator, page_obj, display_page)
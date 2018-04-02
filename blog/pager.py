from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

class Pagination(object):
	# 总条数，每页显示条数，当前页，当前url，显示多少页（计算得出）
	def __init__(self, totalCount, pageItem=1, currentPage=1):
		self.totalCount = totalCount
		self.pageItem = pageItem
		self.currentPage = currentPage
		self.totalPage = ceil(totalCount/pageItem)
		self.url = 




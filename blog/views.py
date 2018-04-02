# -*- coding: utf-8 -*-
from django.shortcuts import render, get_object_or_404
from django.views.generic import ListView, DetailView
from django.http import HttpResponse
from django.db.models.aggregates import Count

import json
import markdown
from .page import simplePage, listViewPage
from .models import Post, Category, Tag, Read, Column


site = {
    'site_title': "Tony's Blog",
    'site_keywords': "学习，音乐，游戏，阅读，电影，前端，后端，全栈，成长，分享",
    'site_description': "这是一个分享，学习的平台。"
}

page = {
    'page_title': "",
    'page_subtitle': "",
    'page_banner': ""
}

def unpackColumn(obj_class):
    context = {
        'site_title': obj_class.site_title,
        'site_keywords': obj_class.site_keywords,
        'site_description': obj_class.site_description,
        'page_title': obj_class.page_title,
        'page_subtitle': obj_class.page_subtitle,
        'page_banner': obj_class.banner.url if obj_class.banner else '',
    }
    return context


class IndexView(ListView):
    model = Post
    template_name = 'blog/index.html'
    context_object_name = 'post_list'
    paginate_by = 5

    def get_queryset(self):
        return super(IndexView,self).get_queryset().filter(is_pub=True)

    def get_context_data(self, **kwargs):
        context = super(IndexView,self).get_context_data(**kwargs)
        paginator = context.get('paginator')
        page_obj = context.get('page_obj')
        is_paginated = context.get('is_paginated')



        md = markdown.Markdown(extensions=[
            'markdown.extensions.extra',
            'markdown.extensions.codehilite',
        ])
        post_list = context.get('post_list')

        for post in post_list:
            post.body = md.convert(post.body)

        result = listViewPage(paginator, page_obj, 11)

        context.update(result)

        # 更新全局变量到页面
        obj = Column.objects.get(name='index')

        context.update(unpackColumn(obj))


        return context



def read(request):
    read_list = Read.objects.all()

    book_data = []

    md = markdown.Markdown(extensions=[
            'markdown.extensions.extra',
            'markdown.extensions.codehilite',
        ])

    for read in read_list:
        book_data.append({
            "id": read.id,
            "title": read.title,
            "author": read.author,
            "description": md.convert(read.description),
            "pub_time": str(read.pub_time),
            "thumbnail": str(read.thumbnail.url),
            "url": read.url
        })


    context = {
        'read_list':read_list,
        'book_data':json.dumps(book_data)
    }

    # 更新全局变量到页面
    obj = Column.objects.get(name='read')

    context.update(unpackColumn(obj))

    return render(request, 'blog/read.html', context)


class CategoryView(ListView):
    model = Post
    template_name = 'blog/category.html'
    context_object_name = 'post_list'


    def get_context_data(self,**kwargs):
        context = super(CategoryView,self).get_context_data(**kwargs)
        categoryList = Category.objects.annotate(num_post=Count('post')).filter(num_post__gt=0,is_pub=True)

        context.update({
            'categoryList':categoryList
        })


        # 更新全局变量到页面
        # 更新全局变量到页面
        obj = Column.objects.get(name='category')

        context.update(unpackColumn(obj))

        return context




class CategoryListView(ListView):
    model = Post
    template_name = 'blog/list.html'
    context_object_name = 'post_list'
    paginate_by = 20

    def get_queryset(self):
        cate = get_object_or_404(Category,pk = self.kwargs.get('pk'))
        return super(CategoryListView, self).get_queryset().filter(category=cate)

    def get_context_data(self, **kwargs):
        context = super(CategoryListView,self).get_context_data(**kwargs)
        paginator = context.get('paginator')
        page_obj = context.get('page_obj')
        is_paginated = context.get('is_paginated')

        cate = get_object_or_404(Category,pk=self.kwargs.get('pk'))

        result = listViewPage(paginator, page_obj, 11)

        context.update({
            'category_name':cate.name
        })
        context.update(result)


        # 更新全局变量到页面
        obj = Column.objects.get(name='category')

        obj.site_keywords = cate.name

        context.update(unpackColumn(obj))


        return context


class TagView(ListView):
    model = Post
    template_name = 'blog/tag.html'
    context_object_name = 'post_list'

    def get_context_data(self,**kwargs):
        context = super(TagView,self).get_context_data(**kwargs)
        tagList = Tag.objects.annotate(num_post=Count('post')).filter(num_post__gt=0,is_pub=True)

        context.update({
            'tagList':tagList
        })


        # 更新全局变量到页面
        obj = Column.objects.get(name='tag')

        context.update(unpackColumn(obj))
        return context

class TagListView(ListView):
    model = Post
    template_name = 'blog/list.html'
    context_object_name = 'post_list'
    paginate_by = 20

    def get_queryset(self):
        _tag = get_object_or_404(Tag,pk = self.kwargs.get('pk'))
        return super(TagListView, self).get_queryset().filter(tag=_tag)

    def get_context_data(self, **kwargs):
        context = super(TagListView,self).get_context_data(**kwargs)
        paginator = context.get('paginator')
        page_obj = context.get('page_obj')
        is_paginated = context.get('is_paginated')

        _tag = get_object_or_404(Tag,pk=self.kwargs.get('pk'))

        result = listViewPage(paginator, page_obj, 11)

        context.update({
            'tag_name':_tag.name
        })
        context.update(result)


        # 更新全局变量到页面
        obj = Column.objects.get(name='tag')
        obj.site_keywords = _tag.name

        context.update(unpackColumn(obj))

        return context


def archive(request):
    archiveList = Post.objects.dates('created_time','month',order='DESC')
    postList = Post.objects.all().filter(is_pub=True)

    context = {
        'archiveList': archiveList, 
        'postList': postList
    }

    # 更新全局变量到页面
    obj = Column.objects.get(name='archive')

    context.update(unpackColumn(obj))


    return render(request, 'blog/archive.html', context)

class ArchiveList(ListView):
    model = Post
    template_name = 'blog/list.html'
    context_object_name = 'post_list'
    paginate_by = 20

    def get_queryset(self):
        year = self.kwargs.get('year')
        month = self.kwargs.get('month')
        return super(ArchiveList,self).get_queryset().filter(created_time__year=year,created_time__month=month,is_pub=True)

    def get_context_data(self,**kwargs):
        context = super(ArchiveList,self).get_context_data(**kwargs)
        paginator = context.get('paginator')
        page_obj = context.get('page_obj')
        is_paginated = context.get('is_paginated')

        posts = context.get('post_list')
        datetime = ''

        for p in posts:
            datetime = p.created_time
            break

        print(datetime)
        result = listViewPage(paginator, page_obj, 11)

        context.update({
            'datetime': datetime
        })
        context.update(result)


        # 更新全局变量到页面
        obj = Column.objects.get(name='archive')
        obj.site_keywords = '归档 '+str(datetime.strftime("%Y-%m-%d"))
        context.update(unpackColumn(obj))

        return context



def about(request):
    post = Post.objects.get(title='about')

    md = markdown.Markdown(extensions=[
            'markdown.extensions.extra',
            'markdown.extensions.codehilite',
        ])
    post.body = md.convert(post.body)


    context = {
        'post': post
    }
    

    # 更新全局变量到页面
    obj = Column.objects.get(name='about')
    context.update(unpackColumn(obj))

    return render(request,'blog/about.html', context)

class PostDetailView(DetailView):
    model = Post
    template_name = 'blog/detail.html'
    context_object_name = 'post_detail'

    def get_object(self, queryset=None):
        post = super(PostDetailView,self).get_object(queryset)

        md = markdown.Markdown(extensions=[
            'markdown.extensions.extra',
            'markdown.extensions.codehilite',
        ])

        post.body = md.convert(post.body)
        return post

    def get_context_data(self,**kwargs):
        context = super(PostDetailView,self).get_context_data(**kwargs)
        

        # 更新全局变量到页面
        site1 = site.copy()
        page1 = page.copy()

        post = self.get_object()

        site1['site_title'] = post.title
        site1['site_keywords'] = post.keywords if post.keywords else site1['site_keywords'] 
        site1['site_description'] = post.description if post.description else site1['site_description'] 
        page1['page_title'] = post.title
        page1['page_banner'] = post.banner.url if post.banner else ''

        context.update(site1)
        context.update(page1)

        
        # 获取上一篇下一篇
        posts = list(Post.objects.all().filter(is_pub=True))
        _index = posts.index(post)
        prepage = posts[_index-1] if (_index>0) else None
        nextpage = posts[_index+1] if (_index<len(posts)-1) else None


        context.update({
            'prepage':prepage,
            'nextpage':nextpage
        })

        return context


def page_not_found(request):
    return render(request,'404.html')
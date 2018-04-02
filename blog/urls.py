from django.conf.urls import url
from . import views

app_name = 'blog'
urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^read/$', views.read, name='read'),
    
    

    url(r'^about/$', views.about, name='about'),

    
    url(r'^post/(?P<pk>[0-9]+)/$', views.PostDetailView.as_view(), name='post'),

    url(r'^category/$', views.CategoryView.as_view(), name='category'),
    url(r'^category/(?P<pk>[0-9]+)/$', views.CategoryListView.as_view(), name='categoryList'),

    url(r'^tag/$', views.TagView.as_view(), name='tag'),
    url(r'^tag/(?P<pk>[0-9]+)/$', views.TagListView.as_view(), name='tagList'),

    url(r'^archive/$', views.archive, name='archive'),
    url(r'^archive/(?P<year>[0-9]{4})/(?P<month>[0-9]{1,2})/$', views.ArchiveList.as_view(), name='archiveList'),
]

handler404 = views.page_not_found

"""mydjango URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""


from . import views
from django.conf.urls import url
from django.urls import path
from django.views.static import serve
urlpatterns = [
    path('runoob/', views.runoob),
    path('index/', views.index),
    path('contact/', views.contact),
    path('resume/', views.resume),
    path('model/', views.model),
    path('services/', views.services),
    path('work/', views.work),
    url(r'^model/assets/(?P<path>.*)$', serve, {'document_root': 'F:/jinan university/detection/mydjango/dome/assets'}),
    url(r'^contact/assets/(?P<path>.*)$', serve, {'document_root': 'F:/jinan university/detection/mydjango/dome/assets'}),
    url(r'^resume/assets/(?P<path>.*)$', serve, {'document_root': 'F:/jinan university/detection/mydjango/dome/assets'}),
    url(r'^services/assets/(?P<path>.*)$', serve, {'document_root': 'F:/jinan university/detection/mydjango/dome/assets'}),
    url(r'^work/assets/(?P<path>.*)$', serve, {'document_root': 'F:/jinan university/yan/互联网+/mydjango/dome/assets'}),
    url(r'^runoob/img/(?P<path>.*)$', serve, {'document_root': 'F:/jinan university/detection/mydjango/img'}),
    url(r'^index/assets/(?P<path>.*)$', serve, {'document_root': 'F:/jinan university/detection/mydjango/dome/assets'}),]


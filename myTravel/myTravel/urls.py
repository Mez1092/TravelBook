from django.conf.urls import include, url
from django.contrib import admin
from . import views

urlpatterns = [
    url(r'^TravelBook/', include('TravelBook.urls', namespace="TravelBook")),
    url(r'^$', views.main_page),
    url(r'^admin/', include(admin.site.urls)),
]

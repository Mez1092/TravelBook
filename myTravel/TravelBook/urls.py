from django.conf.urls import url,include
from . import views

urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^index$', views.index, name='index'),
    url(r'^search$', views.search, name='search'),
    url(r'^addlocation$', views.addlocation, name='addlocation'),
    url(r'^addroom$', views.addroom, name='addroom'),
    url(r'^information', views.information, name='information'),
    url(r'^users$', views.users, name='users'),
    url(r'^vote$', views.vote, name='vote'),
    url(r'^autentication$',views.login, name='autentication'),
    url(r'^logout$',views.logout_view,name='logout'),
    url(r'^', include('django.contrib.auth.urls')),
    url(r'^register$', views.register_user, name='registration'),
    url(r'^register_success$', views.register_success, name='registration_success')
]

# Register your models here.
from django.contrib import admin
from .models import *


class LocationAdmin(admin.ModelAdmin):
    fields = ['name', 'address', 'municipality', 'city', 'country', 'cap', 'telephone', 'stars', 'pool', 'WiFi', 'disabled_services', 'resturant', 'car_parking', 'gym', 'bar', 'sports_activities', 'spa_services', 'description', 'site_web', 'pub_date']
    list_display = ('name', 'pub_date')
    list_filter = ['pub_date']
    search_fields = ['name']


class RoomAdmin(admin.ModelAdmin):
    fields = ['id_location', 'number_room', 'price', 'price_holiday', 'n_people', 'conditioner', 'kitchenette', 'smoker_room', 'animals_accept']


class PrenotationAdmin(admin.ModelAdmin):
    fields = ['id_room', 'id_user', 'check_in', 'check_out']


class RoomFavoriteAdmin(admin.ModelAdmin):
    fields = ['room_favorite', 'user_name']


class RoomWaitingListAdmin(admin.ModelAdmin):
    fields = ['room_waiting_list', 'user_waiting_list', 'user_reservetion', 'check_in_waitinglist', 'check_out_waitinglist']


class VoteAdmin(admin.ModelAdmin):
    fields = ['location_vote', 'user_vote', 'vote_value']

admin.site.register(Location, LocationAdmin)
admin.site.register(Room, RoomAdmin)
admin.site.register(Prenotation, PrenotationAdmin)
admin.site.register(RoomFavorite, RoomFavoriteAdmin)
admin.site.register(RoomWaitingList, RoomWaitingListAdmin)
admin.site.register(Vote, VoteAdmin)
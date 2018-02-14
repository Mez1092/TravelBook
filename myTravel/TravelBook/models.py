from django.db import models
from django.contrib.auth.models import User


class Location(models.Model):
    name = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    municipality = models.CharField(max_length=200)
    city = models.CharField(max_length=200)
    country = models.CharField(max_length=200)
    cap = models.IntegerField(default=0)
    telephone = models.CharField(max_length=200)
    stars = models.IntegerField(default=0)
    pool = models.BooleanField(default=False)
    WiFi = models.BooleanField(default=False)
    disabled_services = models.BooleanField(default=False)
    resturant = models.BooleanField(default=False)
    car_parking = models.BooleanField(default=False)
    gym = models.BooleanField(default=False)
    bar = models.BooleanField(default=False)
    sports_activities = models.BooleanField(default=False)
    spa_services = models.BooleanField(default=False)
    description = models.CharField(max_length=1000)
    site_web = models.CharField(max_length=600)
    media_vote = models.FloatField(default=0.0)
    pub_date = models.DateTimeField('date published')

    def __unicode__(self):
        return self.name


class Room(models.Model):
    id_location = models.ForeignKey(Location, related_name="room_set")
    number_room = models.IntegerField(default=0)
    price = models.FloatField(default=0.0)
    price_holiday = models.FloatField(default=0.0)
    n_people = models.IntegerField(default=0)
    conditioner = models.BooleanField(default=False)
    kitchenette = models.BooleanField(default=False)
    smoker_room = models.BooleanField(default=False)
    animals_accept = models.BooleanField(default=False)

    def __unicode__(self):
        return self.id_location.name +" camera num "+ str(self.number_room)


class RoomWaitingList (models.Model):
    room_waiting_list = models.ForeignKey(Room, related_name="room_waitinglist_set")
    user_waiting_list = models.ForeignKey(User, related_name="username_waitinglist_set")
    user_reservetion = models.ForeignKey(User, related_name="username_reservation_set")
    check_in_waitinglist = models.DateTimeField('check_in date')
    check_out_waitinglist = models.DateTimeField('check_out date')

    def __unicode__(self):
        return self.room_waiting_list.id_location.name + "camera num " + str(self.room_waiting_list.number_room)

########### MANCA ################
class RoomFavorite (models.Model):
    room_favorite = models.ForeignKey(Room, related_name="room_favorite_set")
    user_name = models.ForeignKey(User, related_name="username_set")

    def __unicode__(self):
        return self.room_favorite.id_location.name + "camera num "+ str(self.room_favorite.number_room)


class Prenotation(models.Model):
    id_room = models.ForeignKey(Room, related_name="prenotation_set")
    id_user = models.ForeignKey(User, related_name="user_set")
    check_in = models.DateTimeField('check_in date')
    check_out = models.DateTimeField('check_out date')

    def __unicode__(self):
        return self.id_room.id_location.name

############ MANCA ###################
class Vote(models.Model):
    location_vote = models.ForeignKey(Location, related_name="location_vote_set")
    user_vote = models.ForeignKey(User, related_name="username_vote_set")
    vote_value = models.FloatField(default=0.0)

    def __unicode__(self):
        return self.location_vote.name
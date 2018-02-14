# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Location',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('address', models.CharField(max_length=200)),
                ('municipality', models.CharField(max_length=200)),
                ('city', models.CharField(max_length=200)),
                ('country', models.CharField(max_length=200)),
                ('cap', models.IntegerField(default=0)),
                ('telephone', models.CharField(max_length=200)),
                ('stars', models.IntegerField(default=0)),
                ('pool', models.BooleanField(default=False)),
                ('WiFi', models.BooleanField(default=False)),
                ('disabled_services', models.BooleanField(default=False)),
                ('resturant', models.BooleanField(default=False)),
                ('car_parking', models.BooleanField(default=False)),
                ('gym', models.BooleanField(default=False)),
                ('bar', models.BooleanField(default=False)),
                ('sports_activities', models.BooleanField(default=False)),
                ('spa_services', models.BooleanField(default=False)),
                ('description', models.CharField(max_length=1000)),
                ('site_web', models.CharField(max_length=600)),
                ('pub_date', models.DateTimeField(verbose_name=b'date published')),
            ],
        ),
        migrations.CreateModel(
            name='Prenotation',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('check_in', models.DateTimeField(verbose_name=b'check_in date')),
                ('check_out', models.DateTimeField(verbose_name=b'check_out date')),
            ],
        ),
        migrations.CreateModel(
            name='Room',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('number_room', models.IntegerField(default=0)),
                ('price', models.FloatField(default=0.0)),
                ('n_people', models.IntegerField(default=0)),
                ('conditioner', models.BooleanField(default=False)),
                ('kitchenette', models.BooleanField(default=False)),
                ('smoker_room', models.BooleanField(default=False)),
                ('animals_accept', models.BooleanField(default=False)),
                ('id_location', models.ForeignKey(related_name='room_set', to='TravelBook.Location')),
            ],
        ),
        migrations.CreateModel(
            name='RoomFavorite',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('room_favorite', models.ForeignKey(related_name='room_favorite_set', to='TravelBook.Room')),
                ('user_name', models.ForeignKey(related_name='username_set', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='RoomWaitingList',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('check_in_waitinglist', models.DateTimeField(verbose_name=b'check_in date')),
                ('check_out_waitinglist', models.DateTimeField(verbose_name=b'check_out date')),
                ('room_waiting_list', models.ForeignKey(related_name='room_waitinglist_set', to='TravelBook.Room')),
                ('user_reservetion', models.ForeignKey(related_name='username_reservation_set', to=settings.AUTH_USER_MODEL)),
                ('user_waiting_list', models.ForeignKey(related_name='username_waitinglist_set', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='prenotation',
            name='id_room',
            field=models.ForeignKey(related_name='prenotation_set', to='TravelBook.Room'),
        ),
        migrations.AddField(
            model_name='prenotation',
            name='id_user',
            field=models.ForeignKey(related_name='user_set', to=settings.AUTH_USER_MODEL),
        ),
    ]

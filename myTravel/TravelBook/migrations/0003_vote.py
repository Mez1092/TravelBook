# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('TravelBook', '0002_room_price_holiday'),
    ]

    operations = [
        migrations.CreateModel(
            name='Vote',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('vote_value', models.FloatField(default=0.0)),
                ('location_vote', models.ForeignKey(related_name='location_vote_set', to='TravelBook.Location')),
                ('user_vote', models.ForeignKey(related_name='username_vote_set', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]

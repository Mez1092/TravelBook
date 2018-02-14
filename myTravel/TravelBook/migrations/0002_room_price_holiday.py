# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('TravelBook', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='room',
            name='price_holiday',
            field=models.FloatField(default=0.0),
        ),
    ]

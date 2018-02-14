# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('TravelBook', '0003_vote'),
    ]

    operations = [
        migrations.AddField(
            model_name='location',
            name='media_vote',
            field=models.FloatField(default=0.0),
        ),
    ]

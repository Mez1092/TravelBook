from django.test import TestCase
from TravelBook.models import Location,Room,Prenotation
from django.test.utils import setup_test_environment
from django.core.urlresolvers import reverse
from django.test.client import Client
# Create your tests here.
class Tests(TestCase):
    def test_index_view_with_no_locations(self):
        response=self.client.get('/TravelBook/index')
        self.assertEqual(response.status_code,200)
        self.assertContains(response,"No location exist")
        self.assertQuerysetEqual(response.context['location'],[])

    def test_prenotation_with_wrong_check_out(self):
        prenotation=Prenotation.objects.all()
        data_in=[]
        data_out=[]
        for p in Prenotation.objects.all():
            data_in.append(p.check_in)
        for p in prenotation:
            data_out.append(p.check.out)
        i=0
        while i<len(data_in):
            date_verify=data_in[i]-data_out[i]
            if date_verify.days>0:  self.assertTrue(False,"prenotazione con data antecedente")
            i=i+1

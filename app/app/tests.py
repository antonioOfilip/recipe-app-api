from django.test import SimpleTestCase
from rest_framework.test import APIClient

from app import calc

class CalcTests(SimpleTestCase):

    def test_add_numbers(self):
        res = calc.add(5, 6)
        self.assertEqual(res, 11)

    def test_subtract_numbers(self):
        res = calc.diff(11, 5)
        self.assertEqual(res, 6)
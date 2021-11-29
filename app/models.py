from django.db import models
from django.db.models import fields


# Create your models here.
# Gender Choice Field
GENDER_CHOICE =[
    ('m','Male'),
    ('f','Female'),
    ('o','other'),
]

# MODEL USER
class User(models.Model):
    name = models.CharField(max_length=255,default='abc')
    email = models.EmailField(unique=True,blank=False)
    mobile = models.CharField(max_length=10)
    gender = models.CharField(max_length=1,choices=GENDER_CHOICE,default='m')
    password = models.CharField(max_length=255,default=123456)
    recommended = models.CharField(max_length=255,default='Self Join')
    referer_code = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    def normalizeEmail(self):
        return slef.email.lower()   

# MODEL ADMIN
class Admin(models.Model):
    email = models.CharField(unique=True,max_length=20,default=123456)
    password = models.CharField(max_length=20,default=123456)
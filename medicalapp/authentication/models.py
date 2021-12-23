from django.db import models

# Create your models here.

class AdminAccount(models.Model):
    surname = models.CharField(max_length=50)
    firstname = models.CharField(max_length=50)
    othername = models.CharField(max_length=50)
    email_one = models.CharField(max_length=50)
    phone_one = models.CharField(max_length=50)
    countryCode = models.CharField(max_length=50)
    persional_id = models.CharField(max_length=50)
    account_type = models.CharField(max_length=50)
    pwd_auth = models.CharField(max_length=50)
    created_by = models.CharField(max_length=50)
    date_created = models.CharField(max_length=10)
    last_modified = models.CharField(max_length=10)

    class Meta:
        db_table = 'admin_record'


class UserAccount(models.Model):
    surname = models.CharField(max_length=50)
    firstname = models.CharField(max_length=50)
    othername = models.CharField(max_length=50)
    email_one = models.CharField(max_length=50)
    phone_one = models.CharField(max_length=50)
    gender = models.CharField(max_length=50)
    age = models.CharField(max_length=50)
    countryCode = models.CharField(max_length=50)
    persional_id = models.CharField(max_length=50)
    account_type = models.CharField(max_length=50)
    pwd_auth = models.CharField(max_length=50)
    created_by = models.CharField(max_length=50)
    date_created = models.CharField(max_length=10)
    last_modified = models.CharField(max_length=10)

    class Meta:
        db_table = 'user_record'

class UploadItemModel(models.Model):
    category = models.CharField(max_length=100)
    itemName = models.CharField(max_length=100)
    range_one = models.CharField(max_length=50)
    range_two = models.CharField(max_length=50)
    available = models.IntegerField(11)
    created_by = models.CharField(max_length=10)
    user_id = models.CharField(max_length=10)
    user_email = models.CharField(max_length=60)
    date_created = models.CharField(max_length=10)
    last_modified = models.CharField(max_length=10)

    class Meta:
        db_table = 'sale_prices'

class AddService(models.Model):
    service_id = models.CharField(max_length=50)
    list_id = models.CharField(max_length=50)
    price = models.CharField(max_length=50)
    qty = models.CharField(max_length=50)
    amount = models.CharField(max_length=50)
    vat = models.CharField(max_length=50)
    created_by = models.CharField(max_length=10)
    user_id = models.CharField(max_length=10)
    user_email = models.CharField(max_length=60)
    created_by = models.CharField(max_length=50)
    comments = models.CharField(max_length=100)
    date_created = models.CharField(max_length=10)
    last_modified = models.CharField(max_length=10)

    class Meta:
        db_table = 'invoices'

from django.http import JsonResponse
from django.core.files.storage import FileSystemStorage
import pandas as pd
import os, time, json, sys, random, datetime
import numpy as np
from django.db import connection
from django.middleware import csrf
from .models import AdminAccount, UserAccount, AddService


def user_account(request):
    if request.method != 'POST':
        feedback = {
            'status': 'Invalid request',
            'msg': 'Invalid request, please try again',
            'classname': 'alert alert-danger p-1 text-center',
        }
    else:
        success = 0
        failed = 0
        counter = 0
        try:
            surname = request.POST['surname']
            firstname = request.POST['firstname']
            othername = request.POST['othername']
            email_one = request.POST['email']
            phone_one = request.POST['phone']
            gender = request.POST['gender']
            age = request.POST['age']
            countryCode = request.POST['countryCode']
            persionalId = request.POST['persionalId']
            account_type = request.POST['account_type']
            save_record = UserAccount()
            save_record.surname=surname
            save_record.firstname=firstname
            save_record.othername=othername
            save_record.email_one=email_one
            save_record.phone_one=phone_one
            save_record.gender=gender
            save_record.age=age
            save_record.countryCode=countryCode
            save_record.persional_id=persionalId
            save_record.account_type=account_type
            save_record.created_by = request.session['userdata'][0]
            save_record.pwd_auth = surname
            save_record.date_created = datetime.datetime.now()
            save_record.last_modified = datetime.datetime.now()
            save_record.save()
            success += 1
        except Exception as e:
            failed += 1
            print(e)
        if success > 0:
            feedback = {
                'status': 'success',
                'confirmed': 'success',
                'msg': 'Account successfully created',
                'classname': 'alert alert-primary p-1 text-center',
            }
        else:
            feedback = {
                'status': 'Failed',
                'msg': 'Your request was not successful, please try again',
                'classname': 'alert alert-danger p-1 text-center',
            }
    return JsonResponse(feedback, safe=False)

def admin_account(request):
    if request.method != 'POST':
        feedback = {
            'status': 'Invalid request',
            'msg': 'Invalid request, please try again',
            'classname': 'alert alert-danger p-1 text-center',
        }
    else:
        success = 0
        failed = 0
        counter = 0
        try:
            surname = request.POST['surname']
            firstname = request.POST['firstname']
            othername = request.POST['othername']
            email_one = request.POST['email']
            phone_one = request.POST['phone']
            countryCode = request.POST['countryCode']
            persionalId = request.POST['persionalId']
            account_type = request.POST['account_type']
            save_record = AdminAccount()
            save_record.surname=surname
            save_record.firstname=firstname
            save_record.othername=othername
            save_record.email_one=email_one
            save_record.phone_one=phone_one
            save_record.countryCode=countryCode
            save_record.persional_id=persionalId
            save_record.account_type=account_type
            save_record.created_by = request.session['userdata'][0]
            save_record.pwd_auth=surname
            save_record.date_created = datetime.datetime.now()
            save_record.last_modified = datetime.datetime.now()
            save_record.save()
            success += 1
        except Exception as e:
            failed += 1
            print(e)
        if success > 0:
            feedback = {
                'status': 'success',
                'confirmed': 'success',
                'msg': 'Account successfully created',
                'classname': 'alert alert-primary p-1 text-center',
            }
        else:
            feedback = {
                'status': 'Failed',
                'msg': 'Your request was not successful, please try again',
                'classname': 'alert alert-danger p-1 text-center',
            }
    return JsonResponse(feedback, safe=False)


def add_service(request):
    if request.method != 'POST':
        feedback = {
            'status': 'Invalid request',
            'msg': 'Invalid request, please try again',
            'classname': 'alert alert-danger p-1 text-center',
        }
    else:
        success = 0
        failed = 0
        counter = 0
        try:
            with connection.cursor() as cursor:
                cursor.execute("update sale_prices set available=available-1 where id = %s", [request.POST['listid']])

            service_id = request.POST['serviceid']
            listid = request.POST['listid']
            price = request.POST['price']
            qty = request.POST['qty']
            vat = 0
            user_id = 1
            user_email = request.POST['userid']
            save_record = AddService()
            save_record.service_id=service_id
            save_record.list_id=listid
            save_record.price=price
            save_record.qty=qty
            save_record.amount=float(price) * int(qty)
            save_record.vat=vat
            save_record.user_id=user_id
            save_record.user_email=user_email
            save_record.created_by = request.session['userdata'][0]
            save_record.date_created = datetime.datetime.now()
            save_record.last_modified = datetime.datetime.now()
            save_record.save()
            success += 1
        except Exception as e:
            failed += 1
            print(e)
        if success > 0:
            feedback = {
                'status': 'success',
                'confirmed': 'success',
                'msg': 'Service was successful added',
                'classname': 'alert alert-primary p-1 text-center',
            }
        else:
            feedback = {
                'status': 'Failed',
                'msg': 'Your request was not successful, please try again',
                'classname': 'alert alert-danger p-1 text-center',
            }
    return JsonResponse(feedback, safe=False)


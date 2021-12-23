from django.http import HttpResponse, JsonResponse
from django.core.files.storage import FileSystemStorage
import pandas as pd
import json
import datetime, time
from numpy import random
import sys, os
import numpy as np
import matplotlib as plt
from django.db import connection


def get_available(request):
    with connection.cursor() as cursor:
        # print(request.GET['item_id'])
        counter = cursor.execute("select count(id) as counter from invoices where list_id = %s", [request.GET['item_id']])
        row = cursor.fetchall()
        if counter > 0:
            counter = cursor.execute("select id from sale_prices where id = %s AND available = %s", [request.GET['item_id'], row[0][0]])
            # print(row[0][0])
            if counter < 1:
                feedback = {
                    'status': 'success',
                    'confirmed': 'success',
                    'msg': '',
                    'result': '',
                    'classname': 'alert alert-danger p-1 text-center',
                }
            else:
                feedback = {
                    'status': 'success',
                    'confirmed': 'failed',
                    'msg': "Sorry, this item no longer available in the store",
                    'result': '',
                    'classname': 'alert alert-primary p-1 text-center',
                }
        else:
            feedback = {
                'status': 'Failed',
                'msg': 'No record(s) found',
                'classname': 'alert alert-danger p-1 text-center',
            }
        return JsonResponse(feedback, safe=False)



def get_drug_list(request):
    with connection.cursor() as cursor:
        counter = cursor.execute("SELECT id, category, itemName, range_one, range_two, available FROM sale_prices "
                                 "ORDER BY category ASC")
        row = cursor.fetchall()
        if counter > 0:
            feedback = {
                'status': 'success',
                'confirmed': 'success',
                'msg': 'Records are listed below',
                'result': row,
                'classname': 'alert alert-primary p-1 text-center',
            }
        else:
            feedback = {
                'status': 'Failed',
                'msg': 'No record(s) found',
                'classname': 'alert alert-danger p-1 text-center',
            }
        return JsonResponse(feedback, safe=False)


def get_user_data(request):
    username = request.GET['username']
    with connection.cursor() as cursor:
        counter = cursor.execute("SELECT persional_id, surname, firstname, othername, email_one, phone_one, gender, age  FROM "
                                 "user_record WHERE persional_id =%s", [username, ])
        row = cursor.fetchone()
        if counter > 0:
            feedback = {
                'res': True,
                'status': 'success',
                'confirmed': 'success',
                'msg': 'Record found for: {}'.format(username),
                'result': row,
                'serviceid': int(round(time.time() * 1000)),
                'classname': 'alert alert-primary p-1 text-center',
            }
        else:
            feedback = {
                'status': 'failed',
                'msg': 'No record(s) found',
                'classname': 'alert alert-danger p-1 text-center',
            }
        return JsonResponse(feedback, safe=False)


def get_user_data_invoice(request):
    username = request.GET['username']
    with connection.cursor() as cursor:
        counter = cursor.execute("SELECT u.id, u.surname, u.firstname, u.othername, "
                                 "u.email_one, u.phone_one, i.date_created  FROM user_record u INNER JOIN invoices i "
                                 "ON i.user_id=u.id "
                                 " WHERE i.service_id =%s LIMIT 1", [username, ])
        row = cursor.fetchone()
        if counter > 0:
            feedback = {
                'res': True,
                'status': 'success',
                'confirmed': 'success',
                'msg': 'Record found for: {}'.format(username),
                'result': row,
                'classname': 'alert alert-primary p-1 text-center',
            }
        else:
            feedback = {
                'status': 'failed',
                'msg': 'No record(s) found',
                'classname': 'alert alert-danger p-1 text-center',
            }
        return JsonResponse(feedback, safe=False)


def get_invoice(request):
    serviceid = request.GET['serviceid']
    sum = 0
    try:
        with connection.cursor() as cursor:
            counter = cursor.execute("SELECT itemName, qty, price, amount FROM invoices as i"
                                     " INNER JOIN sale_prices as s ON i.list_id=s.id "
                                     "WHERE service_id=%s ORDER BY i.id DESC", [serviceid, ])
            row = cursor.fetchall()
            for i in range(len(row)):
                sum += float(row[i][3])
            if counter > 0:
                feedback = {
                    'status': 'success',
                    'confirmed': 'success',
                    'msg': 'Record(s) found',
                    'result': row,
                    'sum': sum,
                    'classname': 'alert alert-primary p-1 text-center',
                }
            else:
                feedback = {
                    'status': 'Failed',
                    'msg': 'No record(s) found',
                    'classname': 'alert alert-danger p-1 text-center',
                }
    except Exception as e:
        feedback = {
            'status': 'Failed',
            'msg': 'Error processing your request, please try again',
            'classname': 'alert alert-danger p-1 text-center',
        }
        print(e)

    return JsonResponse(feedback, safe=False)


def invoices(request):
    userid = request.session['userdata'][0]
    sum = 0
    try:
        with connection.cursor() as cursor:
            counter = cursor.execute("SELECT u.email_one, service_id, itemName, qty, price, amount, i.date_created "
                                     "FROM invoices as i "
                                     " INNER JOIN sale_prices as s ON i.list_id=s.id "
                                     " INNER JOIN user_record as u ON u.id=i.user_id ORDER BY i.date_created DESC"
                                     )
            row = cursor.fetchall()
            if counter > 0:
                feedback = {
                    'status': 'success',
                    'confirmed': 'success',
                    'msg': 'Record(s) found',
                    'result': row,
                    'classname': 'alert alert-primary p-1 text-center',
                }
            else:
                feedback = {
                    'status': 'Failed',
                    'msg': 'No record(s) found',
                    'classname': 'alert alert-danger p-1 text-center',
                }
    except Exception as e:
        feedback = {
            'status': 'Failed',
            'msg': 'Error processing your request, please try again',
            'classname': 'alert alert-danger p-1 text-center',
        }
        print(e)

    return JsonResponse(feedback, safe=False)


def get_invoice_data(request):
    serviceid = request.GET['serviceid']
    sum = 0
    try:
        with connection.cursor() as cursor:
            counter = cursor.execute("SELECT itemName, qty, price, amount FROM invoices as i"
                                     " INNER JOIN sale_prices as s ON i.list_id=s.id "
                                     "WHERE service_id=%s ORDER BY i.id DESC", [serviceid, ])
            row = cursor.fetchall()
            for i in range(len(row)):
                sum += float(row[i][3])
            if counter > 0:
                feedback = {
                    'status': 'success',
                    'confirmed': 'success',
                    'msg': 'Record(s) found',
                    'result': row,
                    'sum': sum,
                    'classname': 'alert alert-primary p-1 text-center',
                }
            else:
                feedback = {
                    'status': 'Failed',
                    'msg': 'No record(s) found',
                    'classname': 'alert alert-danger p-1 text-center',
                }
    except Exception as e:
        feedback = {
            'status': 'Failed',
            'msg': 'Error processing your request, please try again',
            'classname': 'alert alert-danger p-1 text-center',
        }
        print(e)

    return JsonResponse(feedback, safe=False)


def flagged_list(request):
    with connection.cursor() as cursor:
        counter = cursor.execute("SELECT a.surname, a.firstname, i.price, s.range_one, s.range_two, u.surname, "
                                 "u.firstname, i.date_created "
                                 "FROM sale_prices s INNER JOIN invoices i ON i.list_id=s.id "
                                 "INNER JOIN admin_record a ON a.id=i.user_id "
                                 "INNER JOIN user_record u ON u.id=i.user_id "
                                 "where i.price > s.range_one OR i.price > s.range_two ORDER BY i.date_created DESC ")
        row = cursor.fetchall()
        if counter > 0:
            feedback = {
                'status': 'success',
                'confirmed': 'success',
                'msg': 'Records are listed below',
                'result': row,
                'classname': 'alert alert-primary p-1 text-center',
            }
        else:
            feedback = {
                'status': 'Failed',
                'msg': 'No record(s) found',
                'classname': 'alert alert-danger p-1 text-center',
            }
        return JsonResponse(feedback, safe=False)


def user_record(request):
    if request.method != "GET":
        feedback = {
            'status': 'Failed',
            'msg': 'Invalid request, try again',
            'row': '',
            'redirect': '/site/signin',
            'classname': 'alert alert-danger p-1 text-center',
        }
        return JsonResponse(feedback, safe=False)
    else:
        try:
            with connection.cursor() as cursor:
                counter = cursor.execute(
                    "SELECT id, surname, firstname, email_one, phone_one, gender, age, account_type"
                    " FROM user_record")
                row = cursor.fetchall()
                if counter > 0:
                    feedback = {
                        'status': 'success',
                        'confirmed': 'success',
                        'msg': 'Request successful',
                        'result': row,
                        'classname': 'alert alert-primary p-1 text-center',
                    }
                    return JsonResponse(feedback, safe=False)
                else:
                    feedback = {
                        'status': 'failed',
                        'confirmed': 'no',
                        'msg': 'No record found',
                        'classname': 'alert alert-danger p-1 text-center',
                    }
                    return JsonResponse(feedback, safe=False)
        except Exception as e:
            feedback = {
                'status': 'unidentified',
                'msg': 'Error!, refresh and try again',
                'classname': 'alert alert-danger p-1 text-center'
            }
            return JsonResponse(feedback, safe=False)


def delete_user(request):
    if request.method != "GET":
        # userid = request.GET['userid']
        feedback = {
            'status': 'Failed',
            'msg': 'Invalid request, try again',
            'row': '',
            'redirect': '/site/signin',
            'classname': 'alert alert-danger p-1 text-center',
        }
        return JsonResponse(feedback, safe=False)
    else:
        try:
            with connection.cursor() as cursor:
                counter = cursor.execute("DELETE FROM user_record WHERE id =%s", [request.GET['userid'], ])
                row = cursor.fetchall()
                if counter > 0:
                    feedback = {
                        'status': 'success',
                        'confirmed': 'success',
                        'msg': 'Request successful',
                        'result': row,
                        'classname': 'alert alert-primary p-1 text-center',
                    }
                    return JsonResponse(feedback, safe=False)
                else:
                    feedback = {
                        'status': 'failed',
                        'confirmed': 'no',
                        'msg': 'Cant delete invalid data or try again',
                        'classname': 'alert alert-danger p-1 text-center',
                    }
                    return JsonResponse(feedback, safe=False)
        except Exception as e:
            feedback = {
                'status': 'unidentified',
                'msg': 'Error!, refresh and try again',
                'classname': 'alert alert-danger p-1 text-center'
            }
            return JsonResponse(feedback, safe=False)


def delete_admin(request):
    if request.method != "GET":
        # userid = request.GET['userid']
        feedback = {
            'status': 'Failed',
            'msg': 'Invalid request, try again',
            'row': '',
            'redirect': '/site/signin',
            'classname': 'alert alert-danger p-1 text-center',
        }
        return JsonResponse(feedback, safe=False)
    else:
        try:
            with connection.cursor() as cursor:
                counter = cursor.execute("DELETE FROM admin_record WHERE id =%s", [request.GET['userid'], ])
                row = cursor.fetchall()
                if counter > 0:
                    feedback = {
                        'status': 'success',
                        'confirmed': 'success',
                        'msg': 'Request successful',
                        'result': row,
                        'classname': 'alert alert-primary p-1 text-center',
                    }
                    return JsonResponse(feedback, safe=False)
                else:
                    feedback = {
                        'status': 'failed',
                        'confirmed': 'no',
                        'msg': 'Cant delete invalid data or try again',
                        'classname': 'alert alert-danger p-1 text-center',
                    }
                    return JsonResponse(feedback, safe=False)
        except Exception as e:
            feedback = {
                'status': 'unidentified',
                'msg': 'Error!, refresh and try again',
                'classname': 'alert alert-danger p-1 text-center'
            }
            return JsonResponse(feedback, safe=False)


def admin_record(request):
    if request.method != "GET":
        feedback = {
            'status': 'Failed',
            'msg': 'Invalid request, try again',
            'row': '',
            'redirect': '/site/signin',
            'classname': 'alert alert-danger p-1 text-center',
        }
        return JsonResponse(feedback, safe=False)
    else:
        try:
            with connection.cursor() as cursor:
                counter = cursor.execute("SELECT id, surname, firstname, email_one, phone_one, account_type"
                                         " FROM admin_record")
                row = cursor.fetchall()
                if counter > 0:
                    feedback = {
                        'status': 'success',
                        'confirmed': 'success',
                        'msg': 'Request successful',
                        'result': row,
                        'classname': 'alert alert-primary p-1 text-center',
                    }
                    return JsonResponse(feedback, safe=False)
                else:
                    feedback = {
                        'status': 'user_recordfailed',
                        'confirmed': 'no',
                        'msg': 'No record found',
                        'classname': 'alert alert-danger p-1 text-center',
                    }
                    return JsonResponse(feedback, safe=False)
        except Exception as e:
            feedback = {
                'status': 'unidentified',
                'msg': 'Error!, refresh and try again',
                'classname': 'alert alert-danger p-1 text-center'
            }
            return JsonResponse(feedback, safe=False)

from django.http import JsonResponse
from django.core.files.storage import FileSystemStorage
import pandas as pd
import os, time, json, sys, random, datetime
import numpy as np
from django.db import connection
from django.middleware import csrf


def auth_check_session(request):
    try:
        if 'userdata' in request.session:
            feedback = {
                'status': 'success',
                'confirmed': 'success',
                'msg': 'Active: {}'.format(request.session.get('userdata')),
                'surname': request.session['userdata'][1],
                'firstname': request.session['userdata'][2],
                'email': request.session['userdata'][3],
                'role': request.session['userdata'][5],
                'classname': 'alert alert-primary p-1 text-center',
            }
        else:
            feedback = {
                'status': 'failed',
                'msg': 'Your session has expired',
                'row': '',
                'redirect': '/site/logout',
                'classname': 'alert alert-danger p-1 text-center',
            }
    except:
        feedback = {
            'status': 'unidentified',
            'msg': 'Error connecting, now redirecting...',
            'row': '',
            'redirect': '/site/logout',
            'classname': 'alert alert-danger p-1 text-center',
        }
    return JsonResponse(feedback, safe=False)


def logout_session(request):
    if 'userdata' in request.session:
        try:
            del request.session['userdata']
            feedback = {
                'status': 'success',
                'confirmed': 'success',
                'msg': 'Logging you out, redirecting...',
                'row': '',
                'redirect': '/site/signin',
                'classname': 'alert alert-danger p-1 text-center',
            }
        except:
            feedback = {
                'status': 'unidentified',
                'msg': 'Error connecting, now redirecting...',
                'row': '',
                'redirect': '/site/signin',
                'classname': 'alert alert-danger p-1 text-center'
            }
    else:
        feedback = {
            'status': 'inactive',
            'msg': 'Your session has expired, now redirecting...',
            'row': '',
            'redirect': '/site/signin',
            'classname': 'alert alert-danger p-1 text-center',
        }
    return JsonResponse(feedback, safe=False)


def token_nizer(request):
    try:
        tokenizer = csrf.get_token(request)
        request.META['CSRF_COOKIE'] = tokenizer
        request.META['CSRF_COOKIE_USED'] = True
        feedback = {
            'status': 'success',
            'confirmed': 'success',
            'msg': '',
            'key': '{}'.format(tokenizer),
            'classname': 'alert alert-dange  r p-1 text-center',
        }
    except:
        feedback = {
            'status': 'unidentified',
            'msg': 'Error connecting, now redirecting...',
            'row': '',
            'redirect': '/site/signin',
            'classname': 'alert alert-danger p-1 text-center'
        }
    return JsonResponse(feedback, safe=False)


def authenticate(request):
    if request.method != "POST":
        feedback = {
            'status': 'Failed',
            'msg': 'Invalid request, try again',
            'row': '',
            'redirect': '/site/signin',
            'classname': 'alert alert-danger p-1 text-center',
        }
        return JsonResponse(feedback, safe=False)
    else:
        userid = request.POST['userid']
        pwd = request.POST['pwd']
        try:
            with connection.cursor() as cursor:
                counter = cursor.execute("SELECT id, surname, firstname, email_one, phone_one, account_type"
                                         " FROM admin_record WHERE email_one=%s AND pwd_auth=%s", [userid, pwd])
                row = cursor.fetchone()
                if counter > 0:
                    feedback = {
                        'status': 'success',
                        'confirmed': 'success',
                        'msg': 'Authentication successful, redirecting..',
                        'row': row,
                        'redirect': '/oath/dashboard',
                        'classname': 'alert alert-primary p-1 text-center',
                    }
                    request.session['userdata'] = row
                    return JsonResponse(feedback, safe=False)
                else:
                    feedback = {
                        'status': 'failed',
                        'confirmed': 'no',
                        'msg': 'Invalid login credentials',
                        'row': '',
                        'redirect': '/sign/signin',
                        'classname': 'alert alert-danger p-1 text-center',
                    }
                    return JsonResponse(feedback, safe=False)
        except Exception as e:
            feedback = {
                'status': 'unidentified',
                'msg': 'Error!, refresh and try again',
                'row': '',
                'redirect': '/site/signin',
                'classname': 'alert alert-danger p-1 text-center'
            }
            return JsonResponse(feedback, safe=False)
        cursor.close()

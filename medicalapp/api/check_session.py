from django.http import JsonResponse
import os, time, json, sys, serial, random, datetime
import numpy as np


def session_on_request():
    try:
        if 'userdata' in request.session:
            print('ok')
        else:
            feedback = {
                'status': 'unidentified',
                'msg': 'Error connecting, now redirecting...',
                'row': '',
                'redirect': '/site/logout',
                'classname': 'alert alert-danger p-1 text-center',
            }
            return JsonResponse(feedback, safe=False)
    except:
        feedback = {
            'status': 'unidentified',
            'msg': 'Error connecting, now redirecting...',
            'row': '',
            'redirect': '/site/logout',
            'classname': 'alert alert-danger p-1 text-center',
        }
        return JsonResponse(feedback, safe=False)


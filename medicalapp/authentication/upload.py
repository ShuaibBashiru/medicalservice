from django.http import HttpResponse, JsonResponse
import os
from django.core.files.storage import FileSystemStorage
import pandas as pd
import datetime, json
from .models import UploadItemModel
from django.db import connection


def drug_list(request):
    if request.method == 'POST':
        form = request.FILES['file']
        try:
            os.unlink('frontend/src/assets/uploaded/medicalpriccelist.csv')
        except:
            print('ok')
        fs = FileSystemStorage(location='frontend/src/assets/uploaded')
        fs.save(form.name, form)
        res = drug_list_func(request)
    return JsonResponse(res)


def drug_list_func(request):
    url = "frontend/src/assets/uploaded/medicalpriccelist.csv"
    data = pd.read_csv(url)
    success = 0
    failed = 0
    counter=0
    # print(request.session['userdata'][0])
    for f in data.itertuples():
        counter+=1
        save_record = UploadItemModel()
        save_record.username = 'user_{}'.format(counter)
        save_record.category = f.category
        save_record.itemName = f.itemName
        save_record.range_one = f.range_one
        save_record.range_two = f.range_two
        save_record.available = f.available
        save_record.created_by = request.session['userdata'][0]
        save_record.user_id = request.session['userdata'][0]
        save_record.user_email = request.session['userdata'][3]
        save_record.date_created = datetime.datetime.now()
        save_record.last_modified = datetime.datetime.now()
        save_record.save()
        success += 1
    else:
        failed += 1
    if success > 0:
        feedback = {
            'status': 'success',
            'msg': 'Your info was uploaded successfully',
            'classname': 'alert alert-primary p-1 text-center',
        }
    else:
        feedback = {
            'status': 'Failed',
            'msg': 'Your data was not uploaded successfully',
            'classname': 'alert alert-danger p-1 text-center',
        }
    return feedback

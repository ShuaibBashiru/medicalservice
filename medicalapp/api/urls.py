from django.urls import path
from . import gets


urlpatterns = [
    path('get_drug_list/', gets.get_drug_list, name="get_drug_list"),
    path('get_user_data/', gets.get_user_data, name="get_user_data"),
    path('getuserdata_invoice/', gets.get_user_data_invoice, name="get_user_data_invoice"),
    path('getinvoice/', gets.get_invoice, name="get_invoice"),
    path('get_available/', gets.get_available, name="get_available"),
    path('invoices/', gets.invoices, name="invoices"),
    path('getinvoicedata/', gets.get_invoice_data, name="get_invoice_data"),
    path('flaggedlist/', gets.flagged_list, name="flagged_lists"),
    path('user_record/', gets.user_record, name="user_record"),
    path('delete_user/', gets.delete_user, name="delete_user"),
    path('delete_admin/', gets.delete_admin, name="delete_admin"),
    path('admin_record/', gets.admin_record, name="admin_record"),
]

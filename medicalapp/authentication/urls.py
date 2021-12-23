from django.urls import path
from . import views, auth, forms, upload


urlpatterns = [
    path('', views.index, name="home"),
    path('sign_in/', auth.authenticate, name="sign_to_portal"),
    path('adminaccount/', forms.admin_account, name="admin_account"),
    path('useraccount/', forms.user_account, name="user_account"),
    path('upload_drug_list/', upload.drug_list, name="drug_list"),
    path('addservice/', forms.add_service, name="add_service"),
    path('tokenize/', auth.token_nizer, name="tokenize_csrf"),
    path('auth_check/', auth.auth_check_session, name="check_session"),
    path('logout/', auth.logout_session, name="auth_logout_session"),
]

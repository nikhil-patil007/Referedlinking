from django.contrib import admin
from django.urls import path,include
from . import views

urlpatterns = [
    # User Site
    path('',views.Login,name='Login'),
    path('login_User/',views.loginuser,name='loginuser'),
    path('register_Page/',views.register,name='register'),
    path('register_User/',views.adduser,name='adduser'),
    path('index/',views.Home,name='home'),
    path('logout_User/',views.Logout,name='Logout'),
    
    # Admin Site
    path('admin1/',views.A_Login,name='loginpage'),
    path('admin1_Login/',views.loginadmin,name='loginadmin'),
    path("admin1_home/",views.home1, name="home1"),
    path('admin1_Logout/',views.ALogout,name='ALogout'),

    # Use Of primary Key
    path('register_Page/<str:code>/',views.register_ref,name='registerref'),
    path('deleteuser/<int:pk>/admin1',views.deleteuser,name='deleteuser'),
]

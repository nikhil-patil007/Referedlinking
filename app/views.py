from django.http import request,Http404
from django.shortcuts import render,redirect,get_object_or_404
from .models import *
from django.contrib.auth.hashers import make_password,check_password
from django.contrib import messages

print('----------------------------------------------Refferal Link Project---------------------------------------------\n')

# Create your views here.

#  Login Page
def Login(request):
    if 'uid' in request.session: 
        print(f'------------------------------------------------------------->You Have Call Login Page of {request.session["uname"]}')
        return redirect('home')
    else:
        print(f'------------------------------------------------------------->You Have Call Login Page')
        return render(request,'app/Login.html')
# Login User
def loginuser(request):
    em = request.POST['email'].casefold()
    password = request.POST['password']
    usr = User.objects.filter(email=em)
    if len(usr) > 0 :
        pass1 = check_password(password,usr[0].password)
        if pass1:
            print(f'------------------------------------------------------------->1. Condition First For Login :-',pass1)
            request.session['uid']=usr[0].id
            request.session['uname']=usr[0].name
            return redirect('home')
        elif usr[0].password == password:
            print(f'------------------------------------------------------------->1. Condition second For Login :-',usr[0].password == password)
            request.session['uid']=usr[0].id
            request.session['uname']=usr[0].name
            return redirect('home')
        else:
            # msg = 'Password Is Wrong'
            # print(f'------------------------------------------------------------->1. Both Condition Check For Login')
            # return render(request,'app/Login.html',{'err':msg})
            messages.warning(request, 'Password Is Wrong')
            return redirect('Login')
            
    else:
        print(f'------------------------------------------------------------->2. Both Condition Check For Login Unknown User')
        msg = 'Unknow User Register Here'
        return render(request,'app/register.html',{'err':msg})

# Register User
def register(request):
    print(f'------------------------------------------------------------->You Have Call Register Page')
    return render(request,'app/register.html')

# Register User Via Refferal Link
def register_ref(request,code):
    try:
        if 'uid' in request.session:
            getcode = User.objects.get(referer_code=code)
            print(f'------------------------------------------------------------->{getcode} Have Call Refferal Register Page')
            return render(request,'app/register.html',{'getcode':getcode})
        else:
            print(f'------------------------------------------------------------->Page Is Not Found')
            raise Http404()
    except:
        print(f'------------------------------------------------------------->Page Is Not Found')
        raise Http404()

# All User Register Method
def adduser(request):
    try:
        import random
        import string

        N = 15
        code = ''.join(random.choices(string.ascii_letters + string.digits, k = N))

        if request.method  == "POST":
            nm = request.POST['name']
            em = request.POST['email'].casefold()
            ph = request.POST['phone']
            gr = request.POST['gender']
            rf = request.POST['ref']
            password = request.POST['Password']
            uss = User.objects.filter(email=em)
            if len(uss) > 0 :
                msg = 'Already Have An User Account'
                print(f'-------------------------------------------------------------> Condition First For Register :-',msg)
                return render(request,'app/register.html',{'err':msg})
            else:
                usr = User.objects.create(
                    name = nm,
                    email = em,
                    mobile = ph,
                    gender = gr,
                    recommended = rf,
                    password = password,
                    referer_code = code,
                )
                usr.password = make_password(usr.password)
                usr.save()
                print(f'-------------------------------------------------For Register 1------------------------------->Register All Data',usr)
                return redirect("Login")
    except:
        if request.method  == "POST":
            nm = request.POST['name']
            em = request.POST['email'].casefold()
            ph = request.POST['phone']
            password = request.POST['Password']
            uss = User.objects.filter(email=em)
            if len(uss) > 0 :
                msg = 'Already Have An User Account'
                print(f'-------------------------------------------------------------> Condition Excepected For Register :-',msg)
                return render(request,'app/register.html',{'err':msg})
            else:
                usr = User.objects.create(
                    name = nm,
                    email = em,
                    mobile = ph,
                    password = password,
                    referer_code = code,
                )
                usr.password = make_password(usr.password)
                usr.save()
                print(f'-------------------------------------------------For Register 2------------------------------->Register Some Data',usr)
                return redirect("Login")

# User Home Page
def Home(request):
    try:
        if 'uid' in request.session:
            getusr = User.objects.get(id=request.session['uid'])
            usr = User.objects.filter(recommended=getusr)
            print(f'------------------------------------------------------------->You Have Call of {getusr} And He Reffer {usr}')
            return render(request,'app/home.html',{'usr':usr,'getusr':getusr})
        else:
            msg = 'Login First'
            print(f'------------------------------------------------------------->You Have Can Login First')
            return render(request,'app/Login.html',{'err':msg})
    except:
        msg = 'Login First'
        print(f'------------------------------------------------------------->You Have Can Login First')
        return render(request,'app/Login.html',{'err':msg})

# User Logout
def Logout(request):
    try:
        del request.session['uid']
        del request.session['uname']
        print(f'------------------------------------------------------------->{request.session["uname"]} Has Session Stoped')
        return redirect('Login')
    except:
        msg = 'Login First'
        print(f'------------------------------------------------------------->You Have Can Login First')
        return render(request,'app/Login.html',{'err':msg})

# Admin Login Page 
def A_Login(request):
    if 'id' in request.session:
        print(f'------------------------------------------------------------->{request.session["id"]} Has Session Start')
        return redirect('home1')
    else:
        print(f'------------------------------------------------------------->Admin Login Page')
        return render(request,'app/admin_login.html')

# Admin Login
def loginadmin(request):
    em = request.POST['email']
    pwd = request.POST['password']

    usr = Admin.objects.filter(email=em)
    if len(usr) > 0 :
        if usr[0].password == pwd:
            request.session['id']=usr[0].id
            print(f'------------------------------------------------------------->{request.session["id"]} Has Session Start')
            return redirect('home1')
        else:
            msg = 'Password Is Wrong'
            print(f'------------------------------------------------------------->Admin Condition is :- {msg}')
            return render(request,'app/admin_login.html',{'err':msg})
    else:
        msg = 'Unknow User'
        print(f'------------------------------------------------------------->Admin Condition is :- {msg}')
        return render(request,'app/admin_login.html',{'err':msg})

# Admin Home Page
def home1(request):
    if 'id' in request.session:
        grtt = User.objects.all()
        pd = grtt.count()
        print(f'------------------------------------------------------------->Admin Home Page')
        return render(request,'app/admin_home.html',{'pd':pd,'grtt':grtt})
    else:
        msg = 'Login First'
        print(f'------------------------------------------------------------->Admin Condition is :- {msg}')
        return render(request,'app/admin_login.html',{'err':msg})

# Admin Logout
def ALogout(request):
    try:
        del request.session['id']
        print(f'------------------------------------------------------------->Admin Session Is Stoped')
        return redirect('loginpage')
    except:
        msg = 'Login First'
        print(f'------------------------------------------------------------->Admin Condition is :- {msg}')
        return render(request,'app/Login.html',{'err':msg})

# Delete User Via Admin
def deleteuser(request,pk):
    try:
        usr = User.objects.get(id=pk)
        usr.delete()
        print(f'------------------------------------------------------------->Admin Delete To :- {usr}')
        return redirect('home1')
    except:
        print(f'------------------------------------------------------------->Admin Home Page')
        return redirect('home1')

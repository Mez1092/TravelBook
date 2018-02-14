from __future__ import division
from django.shortcuts import render_to_response
from .models import Location, Room, Prenotation, RoomFavorite, RoomWaitingList, Vote
from django.conf import settings
from datetime import datetime
from django.http import HttpResponseRedirect
from django.template import RequestContext, loader
from django.shortcuts import get_object_or_404, render
from django.contrib.auth import logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import permission_required
from .forms import *


def home(request):
    location = Location.objects.all()
    room = Room.objects.all()
    prenotation = Prenotation.objects.all()
    votes = Vote.objects.all()

    if 'SubmitAddReservation' in request.POST:
        new_idPrenotation = int(request.POST['id'])
        new_userPrenotation = request.user.id
        date_arrive = request.POST['data_arrive']
        date_leave = request.POST['data_leave']

        for u in User.objects.all():
            if u.id == new_userPrenotation:
                c = get_object_or_404(User, pk=u.id)

        for r in room:
            if r.pk == new_idPrenotation:
                obj,created = Prenotation.objects.get_or_create(id_room=get_object_or_404(Room, pk=r.pk), id_user=c, check_in=date_arrive, check_out=date_leave)

        return render(request, 'TravelBook/home.html', {'location': location, 'room': room, 'prenotation': prenotation})

    elif 'SubmitAddLocation' in request.POST:
        loc = request.POST['loc']
        adr = request.POST['adr']
        mun = request.POST['mun']
        cit = request.POST['cit']
        country = request.POST['country']
        cap = request.POST['cap']
        tel = request.POST['tel']
        stars = request.POST['stars']
        desc = request.POST['desc']
        web = request.POST['web']
        pool = 'pool' in request.POST.keys()
        wifi = 'wifi' in request.POST.keys()
        disabled = 'disabled' in request.POST.keys()
        resturant = 'resturant' in request.POST.keys()
        carparcking = 'carparcking' in request.POST.keys()
        gym = 'gym' in request.POST.keys()
        bar = 'bar' in request.POST.keys()
        sports = 'sports' in request.POST.keys()
        spa = 'spa' in request.POST.keys()

        Location.objects.create(name=loc, address=adr, municipality=mun, city=cit, country=country, cap=cap, telephone=tel, stars=stars, pool=pool, WiFi=wifi, disabled_services=disabled, resturant=resturant, car_parking=carparcking, gym=gym, bar=bar, sports_activities=sports, spa_services=spa, description=desc, site_web=web, pub_date=datetime.now())
        return render(request, 'TravelBook/home.html', {'location': location, 'room': room, 'prenotation': prenotation})

    elif 'SubmitAddRoom' in request.POST:
        loc = request.POST['loc']
        n_room = request.POST['n_room']
        price = request.POST['price']
        n_people = request.POST['n_people']
        conditioner = 'conditioner' in request.POST.keys()
        kitchenette = 'kitchenette' in request.POST.keys()
        smoker_room = 'smoker_room' in request.POST.keys()
        animals_accept = 'animals_accept' in request.POST.keys()

        for l in Location.objects.all():
                if l.name == loc:
                    c = get_object_or_404(Location, pk=l.id)
        Room.objects.create(id_location=c, number_room=n_room, price=price, n_people=n_people, conditioner=conditioner, kitchenette=kitchenette, smoker_room=smoker_room, animals_accept=animals_accept)
        return render(request, 'TravelBook/home.html', {'location': location, 'room': room, 'prenotation': prenotation})

    elif 'SubmitDeleteWaitingList' in request.POST:
        WaitingListDelete = int(request.POST['WaitingListId'])
        RoomWaitingList.objects.filter(id=WaitingListDelete).delete()

        return render(request, 'TravelBook/home.html', {'location': location, 'room': room, 'prenotation': prenotation})

    elif 'SubmitDeleteFavorite' in request.POST:
        FavoriteDelete = int(request.POST['FavoriteId'])
        RoomFavorite.objects.filter(id=FavoriteDelete).delete()

        return render(request, 'TravelBook/home.html', {'location': location, 'room': room, 'prenotation': prenotation})

    elif 'SubmitDeleteReservation' in request.POST:
        PrenotationDelete = int(request.POST['ReservationId'])
        Prenotation.objects.filter(id=PrenotationDelete).delete()

        for j in Prenotation.objects.all():
            if j.id_room.id == PrenotationDelete:
                for i in RoomWaitingList.objects.all():
                    if i.room_waiting_list.id == j.id_room.id:
                        subject = 'TravelBook staff'
                        message = 'Hi user, we inform you that can book the room that you have placed on the waiting list'
                        from_email = settings.EMAIL_HOST_USER
                        #send_mail(subject, message, from_email, ['marcop.paolini@gmail.com'], fail_silently=False)

        return render(request, 'TravelBook/home.html', {'location': location, 'room': room, 'prenotation': prenotation})

    elif 'SubmitVote' in request.POST:
        location = Location.objects.all()
        rat = int(request.POST['stars'])
        id_loc = int(request.POST['LocationID'])

        for i in Location.objects.all():
                if i.id == id_loc:
                    c = get_object_or_404(Location, pk=i.id)

        obj,created = Vote.objects.get_or_create(location_vote=c, user_vote=request.user, vote_value=rat)
        vote_tot = 0.0

        for i in location:
            idx = 0.0
            for j in Vote.objects.all():
                if i.id == j.location_vote.id:
                    vote_tot = vote_tot + j.vote_value
                    idx = idx + 1.0
            if idx == 0.0:
                idx = 1.0
            i.media_vote = float(vote_tot / idx)

            vote_tot = 0

        votes = Vote.objects.filter(user_vote=request.user)

        return render(request, 'TravelBook/home.html', {'location': location, 'room': room, 'prenotation': prenotation, 'votes': votes})

    else:
        return render(request, 'TravelBook/home.html', {'location': location, 'room': room, 'prenotation': prenotation, 'votes': votes})


def vote(request):
    votes = Vote.objects.all()
    vote_tot = 0.0
    location = Location.objects.all()

    for i in location:
        idx = 0.0
        for j in Vote.objects.all():
            if i.id == j.location_vote.id:
                vote_tot = vote_tot + j.vote_value
                idx = idx + 1.0
            if idx == 0.0:
                idx = 1.0
        i.media_vote = vote_tot / idx
        vote_tot = 0

    votes = Vote.objects.filter(user_vote=request.user)

    return render(request, 'TravelBook/vote.html', {'location': location, 'votes': votes})


def index(request):
    location = Location.objects.all()
    return render(request, 'TravelBook/index.html', {'location': location})


def users(request):
    room = Room.objects.all()
    prenotation = Prenotation.objects.all()
    rf= RoomFavorite.objects.all()
    wl= RoomWaitingList.objects.all()
    c = User
    current_user = request.user
    votes = Vote.objects.all()

    if request.method == 'POST':
        if 'Favorite' in request.POST:
            newRoomFavorite = int(request.POST['RoomFavorite'])
            newUserFavorite = int(request.POST['UserFavorite'])

            for u in User.objects.all():
                if u.id == newUserFavorite:
                    c = get_object_or_404(User, pk=u.id)

            for r in room:
                if r.pk == newRoomFavorite:
                    obj,created = RoomFavorite.objects.get_or_create(room_favorite=get_object_or_404(Room, pk=r.pk), user_name=c)

            prenotation = Prenotation.objects.filter(id_user=current_user)
            rf = RoomFavorite.objects.filter(user_name=current_user)
            wl = RoomWaitingList.objects.filter(user_waiting_list=current_user)
            return render(request, 'TravelBook/users.html', {'RoomFavorite': rf, 'prenotation': prenotation, 'RoomWaitingList':wl})

        elif 'WaitingList' in request.POST:
            newRoomWaitingList = int(request.POST['RoomBooked'])
            newUserWaitingList = int(request.POST['UserBooked'])
            date_arrive = request.POST['data_arrive']
            date_leave = request.POST['data_leave']

            for u in User.objects.all():
                if u.id == newUserWaitingList:
                    c = get_object_or_404(User, pk=u.id)

            for u in User.objects.all():
                if u.id == current_user.id:
                    d = get_object_or_404(User, pk=u.id)

            for r in room:
                if r.pk == newRoomWaitingList:
                    obj,created = RoomWaitingList.objects.get_or_create(room_waiting_list=get_object_or_404(Room, pk=r.pk), user_waiting_list=d, user_reservetion=c, check_in_waitinglist=date_arrive, check_out_waitinglist=date_leave )

            prenotation = Prenotation.objects.filter(id_user=current_user)
            rf = RoomFavorite.objects.filter(user_name=current_user)
            wl = RoomWaitingList.objects.filter(user_waiting_list=current_user)

            return render(request, 'TravelBook/users.html', {'RoomFavorite': rf, 'prenotation': prenotation, 'RoomWaitingList':wl})

    else:
        prenotation = Prenotation.objects.filter(id_user=current_user)
        rf = RoomFavorite.objects.filter(user_name=current_user)
        wl = RoomWaitingList.objects.filter(user_waiting_list=current_user)
        return render(request, 'TravelBook/users.html', {'RoomFavorite': rf, 'prenotation': prenotation, 'RoomWaitingList':wl, 'votes': votes})


def information(request):
    return render(request, 'TravelBook/information.html')


def search(request):
    room = Room.objects.all()
    room_all = Room.objects.all()
    location = Location.objects.all()
    prenotation_all = Prenotation.objects.all()
    prenotation = Prenotation.objects.all()
    data = []
    temp = []
    p = [p.id_room.id for p in prenotation]

    if request.method == 'POST':
        loc = request.POST['loc']
        date_arrive = request.POST['check_in']
        date_leave = request.POST['check_out']
        print("checkin: ", date_arrive)
        print("checkout: ", date_leave)
        number_people = request.POST['quantity']
        pool = 'pool' in request.POST.keys()
        wifi = 'wifi' in request.POST.keys()
        disabled = 'disabled' in request.POST.keys()
        resturant = 'resturant' in request.POST.keys()
        carparcking = 'carparcking' in request.POST.keys()
        gym = 'gym' in request.POST.keys()
        bar = 'bar' in request.POST.keys()
        sports = 'sports' in request.POST.keys()
        spa = 'spa' in request.POST.keys()

        conditioner = 'conditioner' in request.POST.keys()
        kitchenette = 'kitchenette' in request.POST.keys()
        smoker_room = 'smoker_room' in request.POST.keys()
        animals_accept = 'animals_accept' in request.POST.keys()

        date_format = "%Y-%m-%d"
        date_arr = datetime.strptime(date_arrive, date_format)
        date_lev = datetime.strptime(date_leave, date_format)
        delta = date_lev - date_arr
        data.append(date_arrive)
        data.append(date_leave)
        data.append(delta.days)

        condition_name = Room.objects.filter(id_location__in=Location.objects.filter(name__contains=loc).all())
        a = [a.id_room.pk for a in prenotation]
        condition1 = Room.objects.filter(id_location__in=Location.objects.filter(name__contains=loc).all())
        condition1 = condition1.exclude(pk__in=a)
        condition2 = Room.objects.filter(prenotation_set__check_in__gte=date_arrive).all()
        condition3 = Room.objects.filter(prenotation_set__check_out__lte=date_leave).all()
        condition23 = condition2 & condition3

        condition_num_people = Room.objects.filter(n_people__gte=number_people).all()

        locs = Location.objects.all()
        if pool:
            locs = locs.filter(pool=True)
        if wifi:
            locs = locs.filter(WiFi=True)
        if disabled:
            locs = locs.filter(disabled_services=True)
        if resturant:
            locs = locs.filter(resturant=True)
        if carparcking:
            locs = locs.filter(car_parking=True)
        if gym:
            locs = locs.filter(gym=True)
        if bar:
            locs = locs.filter(bar=True)
        if sports:
            locs = locs.filter(sports_activities=True)
        if spa:
            locs = locs.filter(spa_services=True)

        condition_loc_features = Room.objects.filter(id_location__in=locs.all())

        condition_room_features = Room.objects.all()

        if conditioner:
            condition_room_features = condition_room_features.filter(conditioner=True)

        if kitchenette:
            condition_room_features = condition_room_features.filter(kitchenette=True)

        if smoker_room:
            condition_room_features = condition_room_features.filter(smoker_room=True)

        if animals_accept:
            condition_room_features = condition_room_features.filter(animals_accept=True)

        if 'price' in request.POST:
            condition_intersect_all = (condition_name & condition_num_people & condition_loc_features & condition_room_features).order_by('price')

        elif 'name' in request.POST:
            condition_intersect_all = (condition_name & condition_num_people & condition_loc_features & condition_room_features).order_by('id_location')

        elif 'num' in request.POST:
            condition_intersect_all = (condition_name & condition_num_people & condition_loc_features & condition_room_features).order_by('n_people')

        room_all = []
        for j in condition_intersect_all:
                room_all.append(j)

        for i in room_all:
                i.price_holiday = i.price * delta.days

        if loc != "":
            location = Location.objects.filter(name=loc)
        else:
            location = location.order_by('media_vote')

        print("sono nell'if")
        print("Data: ", data)
        print("checkin: ", date_arrive)
        print("checkout: ", date_leave)
        print("Location: ", location)
        print("Prenotation All: ", prenotation_all)
        print("Room Intersect: ", room_all)
        print("Prenotation: ", p)




        return render(request, 'TravelBook/search.html', {'data': data, 'location': location, 'prenotation_all': prenotation_all, 'room_intersect': room_all, 'prenotation': p})
    else:
        print("sono nell'else")
        return render(request, 'TravelBook/search.html', {'data': data, 'location': location, 'prenotation_all': prenotation_all, 'room_intersect': room_all, 'prenotation': p})


@permission_required('TravelBook.add_room')
def addlocation(request):
    location = Location.objects.all()
    room = Room.objects.all()
    return render(request, 'TravelBook/addlocation.html', {'location': location, 'room': room})


@permission_required('TravelBook.add_room')
def addroom(request):
    location = Location.objects.all()
    room = Room.objects.all()
    return render(request, 'TravelBook/addroom.html', {'location': location, 'room': room})


@login_required
def login(request):
    return HttpResponseRedirect('/TravelBook/')


def logout_view(request):
    logout(request)
    return HttpResponseRedirect('/TravelBook/')


def register_user(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            user = User.objects.create_user(
            username =form.cleaned_data['username'],
            password =form.cleaned_data['password1'],
            email =form.cleaned_data['email']
            )
            return HttpResponseRedirect('/TravelBook/register_success')
    else:
        form = RegistrationForm(request.POST)
    #variables = RequestContext(request, {'form': form})
    #return render_to_response('registration/register.html',variables,)
    return render(request,'registration/register.html',{'form':form})



def register_success(request):
    return render_to_response('registration/register_success.html')

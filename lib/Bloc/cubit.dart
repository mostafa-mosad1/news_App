
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Bloc/states.dart';
import 'package:untitled1/SharedPreferences/ShareReference.dart';

import '../dio/dio.dart';
import '../pages/business.dart';
import '../pages/science.dart';
import '../pages/settings.dart';
import '../pages/sports.dart';

class NewsCubit extends Cubit<NewsStates>{
 NewsCubit():super(initialState());

 // علشان اعرف استعداء في اي مكان
 static NewsCubit get(context) => BlocProvider.of(context);

 List<Widget> pages =[business(),science(),sports(),settings()];

 int currentIndex = 0;

 List<BottomNavigationBarItem> items = [
   BottomNavigationBarItem(icon: Icon(Icons.business),label: 'business'),
   BottomNavigationBarItem(icon: Icon(Icons.science),label: 'science'),
   BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'sports'),
   BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'settings'),
 ];

 void changeItem(int index) {
   currentIndex = index;
   if(index==1){  scienceData(); }
   if(index==2){  sportData(); }
   emit(changeNavigator());
 }
 // // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=09f844f59dce4fe4b334a4ad7024224e


 List<dynamic> business0=[];

 void businessData () {
   emit(initialBusiness());
   DioHelper.getDate(url: "v2/top-headlines", querys: {
     "country": "eg",
     "category": "business",
     "apiKey": "09f844f59dce4fe4b334a4ad7024224e"
   }).then((value) {
     business0 = value.data["articles"];
     print(business0[0]["title"]);


     emit(getBusiness());

   }).catchError((error) {
     print(error.toString());
     emit(errorBusiness(error.toString()));
   });
  }


 List sport0 = [];

 void sportData() {
   emit(initialsport());
   DioHelper.getDate(url: "v2/top-headlines", querys: {
     "country": "eg",
     "category": "sport",
     "apiKey": "09f844f59dce4fe4b334a4ad7024224e"
   }).then((value) {
     sport0 = value.data["articles"];
     print(value.data["articles"]);
     print(sport0);
     emit(getsport());
   }).catchError((error) {
     print(error.toString());
     emit(errorsport(error.toString()));
   });
 }


   List science0=[];

   void scienceData () {
     emit(initialscience());
     DioHelper.getDate(url: "v2/top-headlines", querys: {
       "country": "us",
       "category": "science",
       "apiKey": "09f844f59dce4fe4b334a4ad7024224e"
     }).then((value) {
       science0 = value.data["articles"];
       emit(getscience());
       print(science0);
     }).catchError((error) {
       print(error.toString());
       emit(errorscience(error.toString()));
     });
   }

 // // https://newsapi.org/v2/everything?q=bmw&apiKey=09f844f59dce4fe4b334a4ad7024224e


 List<dynamic> search = [];

 void getSearch(String value)
 {
   emit(NewsGetSearchLoadingState());

   DioHelper.getDate(
     url: 'v2/everything',
     querys:
     {
       'q':'$value',
       'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
     },
   ).then((value)
   {
     //print(value.data['articles'][0]['title']);
     search = value.data['articles'];
     print(search[0]['title']);

     emit(NewsGetSearchSuccessState());
   }).catchError((error){
     print(error.toString());
     emit(NewsGetSearchErrorState(error.toString()));
   });
 }


   bool mode = true;

   LightMode() {
     mode = !mode;
     CachHelper.saveData(key: "isDark", value: mode);
     print(mode);
     emit(lightMode1());
   }
 }

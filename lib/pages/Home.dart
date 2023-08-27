import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/pages/search.dart';

import '../Bloc/cubit.dart';
import '../Bloc/states.dart';
import '../dio/dio.dart';


class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var cubit =NewsCubit.get(context);
   var kind;



   return BlocProvider(
       create: (BuildContext context) => NewsCubit()..businessData()..sportData()..scienceData(),
       child: BlocConsumer<NewsCubit, NewsStates>(
       listener: (context, state) {},
    builder: (context, state) {
    return  Scaffold(
    appBar: AppBar(
    leading: cubit.mode == true ?IconButton(onPressed: (){cubit.LightMode();}, icon: Icon(Icons.dark_mode_outlined)):IconButton(onPressed: (){cubit.LightMode();}, icon:Icon(Icons.light_mode_outlined)),
    title: Text("News_App"),centerTitle: true,
    actions: [
    IconButton(onPressed: (){
     Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => search()));
    }, icon: Icon(Icons.search))
    ]),
    body: cubit.pages[cubit.currentIndex],

    floatingActionButton: FloatingActionButton(
    onPressed: (){

    } ,child:Icon(Icons.abc) ,
    ),

    bottomNavigationBar: BottomNavigationBar(
    currentIndex: cubit.currentIndex ,
    onTap: (index){
    cubit.changeItem(index);
    print("currentIndex = ${cubit.currentIndex}");
    print("index = ${index}");
    },
    items: cubit.items,
    ),
    ); }));

            }
}





import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled1/SharedPreferences/ShareReference.dart';
import 'package:untitled1/pages/Home.dart';

import 'Bloc/cubit.dart';
import 'Bloc/observer.dart';
import 'Bloc/states.dart';
import 'dio/dio.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  CachHelper.initial();

  bool? isDark= CachHelper.getData(key: "isDark");
  print(isDark);

  runApp( MyApp(isDark!));
}

class MyApp extends StatelessWidget {

  MyApp(this.isDark);
final bool isDark;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()..businessData()..sportData()..scienceData(),
        child: BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return  MaterialApp(

                  home: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Home()),
                  themeMode: isDark ?ThemeMode.light:ThemeMode.dark,
                  theme: ThemeData(
                      textTheme:TextTheme(
                          bodyMedium: TextStyle(color: Colors.black,fontSize: 25,)
                      ),

                      appBarTheme: AppBarTheme(
                          titleTextStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                          iconTheme:IconThemeData(size: 35,color: Colors.white),
                          elevation: 30,toolbarHeight: 50,
                          shape: OutlineInputBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20)))),
                      bottomNavigationBarTheme: BottomNavigationBarThemeData(
                          type: BottomNavigationBarType.fixed,selectedItemColor: Colors.orangeAccent,
                          elevation: 30,unselectedItemColor: Colors.green
                      )
                  ),

                  darkTheme: ThemeData(
                    scaffoldBackgroundColor: HexColor("333739"),

                    textTheme:TextTheme(
                        bodyMedium: TextStyle(color: Colors.white,fontSize: 25,)
                    ),
                    appBarTheme: AppBarTheme(
                        systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarColor: Colors.black12,
                            statusBarIconBrightness: Brightness.light
                        ),
                        titleTextStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                        iconTheme:IconThemeData(size: 35,color: Colors.white),
                        backgroundColor: Colors.black,
                        elevation: 30,toolbarHeight: 50,
                        shape: OutlineInputBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)))
                    ),

                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: HexColor("333739"),
                      selectedItemColor: Colors.orangeAccent,
                      unselectedItemColor: Colors.white,
                      elevation: 30,
                    ),

                  )


              );}));
  }
}

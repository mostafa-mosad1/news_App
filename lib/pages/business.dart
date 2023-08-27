import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/cubit.dart';
import '../Bloc/states.dart';
import '../compant.dart';
import '../dio/dio.dart';

class business extends StatelessWidget {
  business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = NewsCubit.get(context).business0;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
        itemBuilder: (context,index)=> cardNews(
          colorCard: Colors.amberAccent,
          widthContainer: double.infinity,
            heightContainer: 200,

            article:list[index]),
        separatorBuilder: (context,index)=>SizedBox(width: 100,height: 20,),
        itemCount: list.length);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Bloc/states.dart';

import '../Bloc/cubit.dart';
import '../compant.dart';

class sports extends StatelessWidget {
  const sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = NewsCubit.get(context).sport0;
    return BlocConsumer<NewsCubit,NewsStates>(builder: (context, state) {
      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=> cardNews(
              colorCard: Colors.amberAccent,
              widthContainer: double.infinity,
              heightContainer: 200,

              article:list[index]),
          separatorBuilder: (context,index)=>SizedBox(width: 100,height: 20,),
          itemCount: list.length);
    }, listener: (context, state) {
    },);
  }
}

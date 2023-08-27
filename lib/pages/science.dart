import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Bloc/cubit.dart';
import '../compant.dart';

class science extends StatelessWidget {
  const science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = NewsCubit.get(context).science0;
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index)=> Padding(
          padding:  EdgeInsets.only(left:10,right: 10,top: 130),
          child: Center(
            child: Stack(clipBehavior: Clip.none,
              children: [
                Container(width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2),boxShadow: [BoxShadow(
                      color:Colors.red
                          .withOpacity(0.3),
                      offset:Offset(10,10),blurRadius: 20,spreadRadius: 10 )]),
                  child: Card(elevation: 12,color:Colors.blueGrey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:10
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8,),
                          Text("${list[index]["title"]}",style: TextStyle(fontSize: 20, ),maxLines: 3,),
                          Directionality(textDirection:TextDirection.ltr,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10,),
                                Center(child: Text("${list[index]["author"]}",style: TextStyle(fontSize: 18))),
                                SizedBox(height: 10,),
                                Text(list[index]["publishedAt"],style: TextStyle(fontSize: 18),),
                              ],
                            ),
                          ),


                        ],),
                    ),),
                ),
                Positioned(
                   bottom: 172,
                    child: list[index]["urlToImage"] ==null?Icon(Icons.image_not_supported_outlined,size: 150,):Center(child: Image.network(list[index]["urlToImage"],width: 400,height: 150,))
                )
              ],),
          ),
        ),
        separatorBuilder: (context,index)=>SizedBox(width: 100,height: 35,),
        itemCount: list.length);
  }
}

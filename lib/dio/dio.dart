// // https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
// // ==
// // https://newsapi.org/v2/top-headlines?country=eg&category=sport&apiKey=09f844f59dce4fe4b334a4ad7024224e
// // ==
// // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=09f844f59dce4fe4b334a4ad7024224e

// // https://newsapi.org/v2/everything?q=bmw&apiKey=09f844f59dce4fe4b334a4ad7024224e

// // base url =>https://newsapi.org/
// //method =>v2/top-headlines
// //query =>country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

import 'package:dio/dio.dart';

class DioHelper{

  static late Dio dio;

 static init(){
 dio = Dio(BaseOptions(baseUrl:"https://newsapi.org/",receiveDataWhenStatusError: true ));
 }


 static Future<Response> getDate ({
   required String url,
  required Map<String,dynamic> querys,
}) async {
return await dio.get(url,queryParameters: querys,  );
 }

 static Future<Response> search ({
    required String url,
   required Map<String,dynamic> data,
   query
}) async {
   return await dio.post(url,data: data,queryParameters: query);
 }
}



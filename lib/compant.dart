import 'package:flutter/material.dart';


Widget DefultTextForm ({
  controller,
  onChange,
  bool validatorPostion =false,
  Textvalidator,
  prefixIcon,
  labelText,
  hintText,
  suffixIcon,
  bool lock = false,
  ontap,
  double circular=0,
  keyboardType=TextInputType.emailAddress,
  floatingLabelAlignment=FloatingLabelAlignment.start,

})

=>TextFormField(
  onChanged: onChange,
  keyboardType: keyboardType,
  controller: controller ,
  validator: (value){if(value!.isEmpty){
    if(validatorPostion==true){
      return '${Textvalidator}';
    }else{
      return null;
    }
  }},
  onTap: ontap,
  obscureText: lock,
  decoration: InputDecoration(
     floatingLabelAlignment: floatingLabelAlignment,
      labelText: labelText,
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(circular),
          borderSide: BorderSide(color: Colors.redAccent))),
);

Widget Button({
  colorContainer=Colors.blue,
  splashColor,
  textColor=Colors.white70,
  text,
  onPressed,
  double circular=10,
  double widthContainer=220,
  double fontSize=30,


}) => Center(
  child:Container(

    width: widthContainer,

    decoration: BoxDecoration(color: colorContainer,

        borderRadius: BorderRadius.circular(circular)),

    child: MaterialButton(onPressed:onPressed ,

      splashColor:splashColor,textColor: textColor,

      child:Text(text,style: TextStyle(fontSize: fontSize),),),

  ),
);



Widget card({
  double widthContainer =200,
  double heightContainer =160,
  boxShadow=Colors.red,
  colorCard = Colors.white,
  double horizontalPadding=10,
  title="title", price="200", url="url",
  bool favorite=false,


})=>Center(
  child: Stack(clipBehavior: Clip.none,
    children: [
      Container(width: widthContainer,height: heightContainer,
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2),boxShadow: [BoxShadow(
            color: boxShadow.withOpacity(0.3),
            offset:Offset(10,10),blurRadius: 20,spreadRadius: 10 )]),
        child: Card(elevation: 12,color:colorCard,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(fontSize: 20, ),maxLines: 2, ),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price,style: TextStyle(fontSize: 25),),
                    IconButton(onPressed: (){},
                        icon: (favorite==false)?Icon(Icons.favorite_border,color: Colors.red,size: 45):Icon(Icons.favorite,color: Colors.red,size: 45,),),
                  ],),
                SizedBox(height: 10,),
              ],),
          ),),
      ),
      Positioned(right: 5,bottom: 125,
          child: Text(url))
    ],),
);



Widget cardNews({
  double widthContainer =200,
  double heightContainer =160,
  boxShadow=Colors.red,
  colorCard = Colors.white,
  double horizontalPadding=10,
  title="title", price="200", url="url",
 double? imgWidth,double? imgHight,
  article


}) => Padding(
  padding:  EdgeInsets.only(left:10,right: 10,top: 130),
  child:   Center(
    child: Stack(clipBehavior: Clip.none,
      children: [
        Container(width: widthContainer,
          height: heightContainer,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2),boxShadow: [BoxShadow(
              color:boxShadow
                  .withOpacity(0.3),
              offset:Offset(10,10),blurRadius: 20,spreadRadius: 10 )]),
          child: Card(elevation: 12,color:colorCard,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:horizontalPadding
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 SizedBox(height: 8,),
                  Text("${article["title"].toString()}",style: TextStyle(fontSize: 20, ),maxLines: 3,),
                  Directionality(textDirection:TextDirection.ltr,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Center(child: Text("${article["author"].toString()}",style: TextStyle(fontSize: 18))),
                        SizedBox(height: 10,),
                        Text(article["publishedAt"].toString(),style: TextStyle(fontSize: 18),),
                      ],
                    ),
                  ),


                ],),
            ),),
        ),
        Positioned(right: 110,bottom: 172,
            child: article["urlToImage"] == null?Icon(Icons.image_not_supported_outlined,size: 150,):Image.network(article["urlToImage"],width: imgWidth,height: imgHight,))
      ],),
  ),
);


//const LOGIN = 'login';
//
// const REGISTER = 'register';
//
// const HOME = 'home';
//
// const GET_CATEGORIES = 'categories';
//
// const FAVORITES = 'favorites';
//
// const PROFILE = 'profile';
//
// const UPDATE_PROFILE = 'update-profile';
//
// const SEARCH = 'products/search';
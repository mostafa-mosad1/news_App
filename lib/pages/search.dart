import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Bloc/cubit.dart';
import 'package:untitled1/Bloc/states.dart';

import '../compant.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
TextEditingController  search =TextEditingController();
  @override
  Widget build(BuildContext context) {
    var list =NewsCubit.get(context).search;

    return  BlocConsumer<NewsCubit,NewsStates>(
      builder: (context, state) => SafeArea(child: Scaffold(
        appBar: AppBar(
          title: Text("search"),
          centerTitle: true,
        ),
        body:Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
          Padding(
                padding: const EdgeInsets.all(20.0),
                child: DefultTextForm(
                  controller: search,
                  keyboardType : TextInputType.text,
                  onChange: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },

                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => cardNews(
                      colorCard: Colors.amberAccent,
                      widthContainer: double.infinity,
                      heightContainer: 200,
                      imgWidth: 200,imgHight: 100,

                      article: list[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 30,),
                  itemCount: list.length),
            )

            // Button(text: "search",
            //     onPressed: (){
            //   // NewsCubit.get(context).search(search: search.toString());
            //   print(search.text);
            //     })
          ],)
    )),
      listener: (context, state) {},);
  }
}


//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled1/compant.dart';
//
// import '../Bloc/cubit.dart';
// import '../Bloc/states.dart';
//
// class SearchScreen extends StatelessWidget
// {
//   var searchController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return BlocConsumer<NewsCubit, NewsStates>(
//       listener: (context, state) {},
//       builder: (context, state)
//       {
//         var list = NewsCubit.get(context).search;
//
//         return Scaffold(
//           appBar: AppBar(),
//           body: Column(
//             children:
//             [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: DefultTextForm(
//                   controller: searchController,
//                   keyboardType : TextInputType.text,
//                   onChange: (value)
//                   {
//                     NewsCubit.get(context).getSearch(value);
//                   },
//
//                   hintText: 'Search',
//                   prefixIcon: Icon(Icons.search),
//                 ),
//               ),
//               Expanded(child: articleBuilder(list, context)),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
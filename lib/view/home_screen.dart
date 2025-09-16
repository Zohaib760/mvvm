import 'package:flutter/material.dart';
import 'package:mvvm/Data/Model/movies_model.dart';
import 'package:mvvm/Data/response/statuses.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/general_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override

  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchMoviesListApi();

    super.initState();

  }
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();



  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              userPreferences.removeUser().then((value) {
                Navigator.pushNamed(context, RoutesNames.login);
              });
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
        automaticallyImplyLeading: false,
        title: Text("Home Screen", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context)=> homeViewViewModel,
       child: Consumer<HomeViewViewModel>(builder: (context, value, child){
          switch(value.moviesList.status){
           case Status.LOADING :
             return Center(child: CircularProgressIndicator());
           case Status.ERROR:
             return Center(child: Text(value.moviesList.message.toString()));
           case Status.COMPLETED:
             return ListView.builder(
               itemCount:  value.moviesList.Data!.movies!.length,
                 itemBuilder: (context, index){
                   return  Card(
                     child: ListTile(
                       title:  Text(value.moviesList.Data!.movies![index].title.toString()),
                       subtitle: Text(value.moviesList.Data!.movies![index].year.toString()),
                       leading: Image.network(
                         height: 40,
                           width: 40,
                           fit: BoxFit.cover,
                           value.moviesList.Data!.movies![index].posterurl.toString(),
                         errorBuilder: (context, error, stack){
                             return Icon(Icons.error, color: Colors.red,);
                         },
                       ),
                       trailing: Row(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           // Text(Utils.averageRating(value.moviesList.Data!.movies![index].ratings!).toStringAsFixed(1)),
                           Icon(Icons.star, color: Colors.yellow,),
                         ]
                       ),
                     )
                   );
                 });
            default:
              return Container();
         }
       }),
      )
    );
  }
}

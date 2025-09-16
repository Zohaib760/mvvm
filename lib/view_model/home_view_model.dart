
import 'package:flutter/cupertino.dart';
import 'package:mvvm/repositories/home_repository.dart';
import 'package:provider/provider.dart';

import '../Data/Model/movies_model.dart';
import '../Data/response/api_response.dart';
class HomeViewViewModel with ChangeNotifier{

  final _myRepo = HomeRepository();

  ApiResponse<MoviesLIstModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesLIstModel> response){
    moviesList = response ;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi()async{
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMoviesList().then((value){
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
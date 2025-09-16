
import 'package:flutter/material.dart';
import 'package:mvvm/Data/network/BaseApiServices.dart';
import 'package:mvvm/Data/network/NetworkApiService.dart';
import 'package:mvvm/Data/response/api_response.dart';
import 'package:provider/provider.dart';
import '../Data/Model/movies_model.dart';
import '../res/app_url.dart';

class HomeRepository {

  BaseApiServices _apiServices = NetworkApiService();



  Future<MoviesLIstModel> fetchMoviesList() async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppURls.MoviesListURL); 
      return response= MoviesLIstModel.fromJson(response);

    }catch(e){
      throw e;
    }
  }
}
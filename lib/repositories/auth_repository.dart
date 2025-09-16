

import 'package:flutter/cupertino.dart';
import 'package:mvvm/Data/network/BaseApiServices.dart';
import 'package:mvvm/Data/network/NetworkApiService.dart';
import 'package:mvvm/res/app_url.dart';
import 'package:mvvm/utils/routes/routes_names.dart';

class AuthRepository{

  BaseApiServices _apiServices = NetworkApiService();
//LOG in API  
  Future<dynamic> loginApi(dynamic data, BuildContext context) async{
    try{
       dynamic response = await _apiServices.getPostApiResponse(AppURls.loginURl, data);
       return response;


    }catch(e){
      throw e;
    }
  }
// Register Api
  Future<dynamic> registerApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppURls.registerURl, data);
      return response;
    }catch(e){
      throw e;
    }
  }

}
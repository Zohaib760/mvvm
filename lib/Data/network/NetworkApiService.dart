
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm/Data/app_exceptions.dart';
import 'package:mvvm/Data/network/BaseApiServices.dart';

class NetworkApiService extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async{

   dynamic responseJson;

    try{
      final response =  await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnRespone(response);
    }on SocketException{
      throw FetchDataExeption("No internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {

    dynamic responseJson;

    try{
      Response  response =  await http.post(
          headers: {
            "x-api-key": "reqres-free-v1"
          },
        Uri.parse(url),
        body: data
      ).timeout(Duration(seconds: 10));
      responseJson = returnRespone(response);
    }on SocketException{
      throw FetchDataExeption("No internet Connection");
    }
    return responseJson;
  }

  dynamic returnRespone(http.Response response){

    switch (response.statusCode){
      case 200:
         dynamic responseJson = jsonDecode(response.body);
         return responseJson;
      case 400:
           throw BadRequestExeption(response.body.toString());
    case 404:
    throw UnauthorizedExeption(response.body.toString());
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
         default:
           throw FetchDataExeption("Error occured while communicating with server "+"with status code"+response.statusCode.toString());
    }

  }
  
}
import 'package:flutter/cupertino.dart';
import 'package:mvvm/Data/Model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{

  Future <bool>saveUser(UserModel user)async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
   return true;
  }

  Future<UserModel> getUser()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return UserModel(token: token.toString());
  }

  Future<bool>removeUser()async{
     SharedPreferences sp = await SharedPreferences.getInstance();
     return sp.clear();
  }
}


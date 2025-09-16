
import 'package:flutter/cupertino.dart';
import 'package:mvvm/repositories/auth_repository.dart';
import 'package:mvvm/utils/general_utils.dart';
import 'package:mvvm/utils/routes/routes_names.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  bool signUpLoading = false;
  setsignUpLoading(bool value){
    signUpLoading = value;
    notifyListeners();
  }

  Future<void> logInApi(dynamic data , BuildContext context) async{
    setLoading(true);
   _myRepo.loginApi(data, context).then((value){
     setLoading(false);
     Navigator.pushNamed(context, RoutesNames.home);
     return Utils.flasBarErrorMessage("Log In Completed", context);

    print(value.toString());
   }).onError((error, stackTrace){
     setLoading(false);
     return Utils.flasBarErrorMessage(error.toString(), context);
    print(error.toString());
   });
  }

  Future<void> SignUpApi(dynamic data , BuildContext context) async{
    setsignUpLoading(true);
    _myRepo.registerApi(data).then((value){
      setsignUpLoading(false);
      return Utils.flasBarErrorMessage("Sign up successfully", context);
      print(value.toString());
    }).onError((error, stackTrace){
      setsignUpLoading(false);
      return Utils.flasBarErrorMessage(error.toString(), context);
      print(error.toString());
    });
  }
}
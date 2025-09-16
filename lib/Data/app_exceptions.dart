
class AppExceptions implements Exception{

  final _message;
  final _prefix;
  AppExceptions( this._message, this._prefix);

  String toString(){
    return '$_prefix$_message';
  }
}

class FetchDataExeption extends AppExceptions{

  FetchDataExeption([String? message]) : super (message, "Error During Communication");
}

class BadRequestExeption extends AppExceptions{

  BadRequestExeption([String? message]) : super (message, "Invalid Request");
}

class UnauthorizedExeption extends AppExceptions{

  UnauthorizedExeption([String? message]) : super (message, "Unauthorized Request");
}

class InvalidInputExeption extends AppExceptions{

  InvalidInputExeption([String? message]) : super (message, "Invalid Input");
}
 class NewUserCretedExeption extends AppExceptions{
     NewUserCretedExeption([String? message]): super (message, "User Created");
 }
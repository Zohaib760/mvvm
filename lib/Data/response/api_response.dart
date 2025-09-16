
import 'package:mvvm/Data/response/statuses.dart';

class  ApiResponse<T>{

  Status? status;
  T? Data;
  String ? message;

  ApiResponse(this.status, this.Data, this.message);

    ApiResponse.loading(): status = Status.LOADING;

   ApiResponse.completed(this.Data): status = Status.COMPLETED;

  ApiResponse.error(this.message): status = Status.ERROR;

  @override
  String toString(){
    return "Status : $status \n Message: $message \n Data : $Data";
  }
}


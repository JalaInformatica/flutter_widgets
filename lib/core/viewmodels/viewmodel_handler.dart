import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_widgets/core/models/response/response_model.dart';
import 'package:flutter_widgets/core/models/response/response_code.dart';
import 'package:logger/logger.dart';

class ViewModelHandler {
  static void appTry<T>({
    required Function() execute,
    Function()? onError,
  }) {
    try {
      execute();
    } catch (e) {
      if(onError!=null) onError();
      showErrorToast(e.toString());
    } 
  }


  static Future<T> appTryAsync<T>({
  required Future<T> Function() execute,
  T? defaultValue,
  Function()? onError,
}) async {
  try {
    return await execute();
  } catch (e, st) {
    if (onError != null) {
      try {
        onError();
      } catch (_) {}
    }
    showErrorToast(e.toString());
    return defaultValue as T;
  }
}




  static Future<void> showErrorToast(String e) async {
    return await SmartDialog.showToast(e, displayTime: Duration(seconds: 2));
  }

  static void tryCatchAsync({
    required Function() run,
    required Function(Object, StackTrace) onError
  }) async {
    try {
      await run();
    }
    catch(e, st) {
      onError(e, st);
      Logger().e(e.toString());
    }
  }

  static void handleResponseCode<T>(ResponseModel<T> data, {required Function(T) onSuccess, required Function(String) onError}){
    switch(data.resultCode){
      case ResponseCode.success:
        if(data.data!=null){
          onSuccess(data.data!);
        }
        else {
          onError(data.resultMessage); 
        }
      break;
      case ResponseCode.error:
        onError(data.resultMessage);
      break;
      case ResponseCode.exception:
        throw Exception(data.resultMessage);
    }
  } 

  static void handlePaginatedResponseCode<T>(ResponseModelPaginated<T> data, {required Function(List<T>) onSuccess, required Function(String) onError}){
    switch(data.resultCode){
      case ResponseCode.success:
        onSuccess(data.data);
      break;
      case ResponseCode.error:
        onError(data.resultMessage);
      break;
      case ResponseCode.exception:
        throw Exception(data.resultMessage);
    }
  } 

}

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

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
    Function()? onError
    }) async {
    try {
      return await execute();
    } catch (e) {
      if(onError!=null) onError();
      showErrorToast(e.toString());
      return Future.error(e);
    } 
  }

  static Future<T> showErrorToast(String e) async {
    return await SmartDialog.showToast(e, displayTime: Duration(seconds: 2));
  } 

}

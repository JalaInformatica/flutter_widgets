import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void appTry<T>({
  required Function() execute,
  Function()? onError,
}) {
  try {
    execute();
  } catch (e) {
    if(onError!=null) onError();
    SmartDialog.showToast(e.toString(), displayTime: Duration(seconds: 2));
  } 
}


Future<T> appTryAsync<T>({
  required Future<T> Function() execute,
  Function()? onError
  }) async {
  try {
    return await execute();
  } catch (e) {
    if(onError!=null) onError();
    SmartDialog.showToast(e.toString(), displayTime: Duration(seconds: 2));
    return Future.error(e);
  } 
}

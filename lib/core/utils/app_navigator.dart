import 'package:flutter/material.dart';

class AppNavigator {
  static Future<dynamic> navigatePush(BuildContext context, Widget destination){
    return Navigator.of(context).push(MaterialPageRoute(builder: (context)=>destination));
  }

  static Future<dynamic> navigatePushReplace(BuildContext context, Widget destination){
    return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>destination));
  }

  static void navigateBack(BuildContext context){
    Navigator.of(context).pop();
  }

  static Future<dynamic> navigatePushRemove(BuildContext context, Widget destination){
    return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>destination), (route)=>false);
  }
}

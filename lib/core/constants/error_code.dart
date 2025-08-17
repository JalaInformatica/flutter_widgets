import 'dart:io';

import 'package:flutter_widgets/core/constants/device_code.dart';

enum Error {database, serverKey, mapping, clientkey}

class ErrorCode {
  String _databaseError = "DE";
  String _serverKeyError = "SE";
  String _clientKeyError = "CE";
  String _mappingError = "ME";

  String getError(Error error){
    DateTime now = DateTime.now();
    String deviceType = Platform.isAndroid ? DeviceCode.android : Platform.isIOS ? DeviceCode.ios : DeviceCode.other;
    
    switch(error){
      case Error.database:
      return "${_databaseError}${deviceType}${now}";
      case Error.serverKey:
      return "${_databaseError}${deviceType}${now}";
      case Error.mapping:
      return "${_databaseError}${deviceType}${now}";
      case Error.clientkey:
      return "${_databaseError}${deviceType}${now}";
    }
  }
}
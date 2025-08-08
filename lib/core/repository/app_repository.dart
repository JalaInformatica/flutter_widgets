import 'dart:convert';
import 'package:flutter_widgets/core/models/response/response_model.dart';
import 'package:flutter_widgets/core/models/response/response_code.dart';

class AppRepository {
  ResponseModel<List<T>> getResponseListData<T>(String response, {required List<T> Function(List<dynamic>) formatter}) {
    var result = jsonDecode(response)["rs"] ?? {};

    try {
      if (result['RESULT_CODE'].toString().contains(ResponseCode.success)) {
        List<T> data;

        List<String> rawData = result['DATA'] ?? [];
        data = formatter(rawData);

        return ResponseModel(
          data: data,
          resultCode: result['RESULT_CODE'] ?? ResponseCode.success,
          resultDesc: result['RESULT_DESC'] ?? '',
          resultMessage: result['MESSAGE'] ?? '',
        );
      } else {
        return ResponseModel(
          data: [],
          resultCode: result['RESULT_CODE'] ?? ResponseCode.error,
          resultDesc: result['RESULT_DESC'] ?? 'GAGAL',
          resultMessage: result['MESSAGE'] ?? '',
        );
      }
    } catch (e) {
      return ResponseModel(
        data: [],
        resultCode: result['RESULT_CODE'] ?? ResponseCode.error,
        resultDesc: result['RESULT_DESC'] ?? 'GAGAL',
        resultMessage: e.toString(),
      );
    }
  }

  ResponseModel<T> getResponseSingleData<T>(String response, {required T Function(dynamic) formatter}) {
    var result = jsonDecode(response)["rs"] ?? {};

    try {
      if (result['RESULT_CODE'].toString().contains(ResponseCode.success)) {
        final rawData = result['DATA'] ?? [];

        T data = formatter(rawData.first);

        return ResponseModel(
          data: data,
          resultCode: result['RESULT_CODE'] ?? ResponseCode.success,
          resultDesc: result['RESULT_DESC'] ?? '',
          resultMessage: result['MESSAGE'] ?? '',
        );
      } else {
        return ResponseModel(
          data: null,
          resultCode: result['RESULT_CODE'] ?? ResponseCode.error,
          resultDesc: result['RESULT_DESC'] ?? 'GAGAL',
          resultMessage: result['MESSAGE'] ?? '',
        );
      }
    } catch (e) {
      return ResponseModel(
        data: null,
        resultCode: result['RESULT_CODE'] ?? ResponseCode.error,
        resultDesc: result['RESULT_DESC'] ?? 'GAGAL',
        resultMessage: e.toString(),
      );
    }
  }

  List<ResponseModel<T>> getResponseWriteListData<T>(String response, {required T Function(dynamic) formatter}) {
    var result = jsonDecode(response)["rs"] ?? {};
    try {
      List rawdata = [];
      if (result is List) {
        rawdata = result;
      } else if (result.containsKey('DATA') && result['DATA'] is List) {
        rawdata = result['DATA'];
      }
      List<ResponseModel<T>> sendData = [];
      for (var item in rawdata) {
        sendData.add(
          ResponseModel(
            data: formatter(item), 
            resultCode: item['RESULT_CODE'] ?? ResponseCode.success, 
            resultDesc: item['RESULT_DESC'] ?? "", 
            resultMessage: item['MESSAGE'] ?? ""
          )
        );
      }
      return sendData;
    } catch (e){
      return [
        ResponseModel(
          data: null, 
          resultCode: result['RESULT_CODE'] ?? ResponseCode.error, 
          resultDesc: result['RESULT_DESC'] ?? 'GAGAL', 
          resultMessage: result['MESSAGE'] ?? e
        )
      ];
    }
  }

  ResponseModel<T> getResponseWriteSingleData<T>(String response, {required T Function(dynamic) formatter}) {
    var result = jsonDecode(response)["rs"] ?? {};
    try {
      List rawdata = [];
      if (result is List) {
        rawdata = result;
      } else if (result.containsKey('DATA') && result['DATA'] is List) {
        rawdata = result['DATA'];
      }
      var item = rawdata.first;
      return ResponseModel(
        data: formatter(item), 
        resultCode: item['RESULT_CODE'] ?? ResponseCode.success, 
        resultDesc: item['RESULT_DESC'] ?? "", 
        resultMessage: item['MESSAGE'] ?? ""
      );
    } catch (e) {
      return ResponseModel(
        data: null, 
        resultCode: result['RESULT_CODE'] ?? ResponseCode.error, 
        resultDesc: result['RESULT_DESC'] ?? 'GAGAL', 
        resultMessage: result['MESSAGE'] ?? e
      );
    }
  }
}

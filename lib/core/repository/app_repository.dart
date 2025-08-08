import 'dart:convert';
import 'package:flutter_widgets/core/models/response/response_model.dart';

class AppRepository<T> {
  ResponseModel<List<T>> getResponseListData(String response, {required List<T> Function(String) formatter}) {
    var result = jsonDecode(response)["rs"] ?? {};

    try {
      if (result['RESULT_CODE'].toString().contains("01")) {
        List<T> data;

        if (result['DATA'] != null) {
          data = formatter(result['DATA']);
        } else {
          data = []; 
        }

        return ResponseModel(
          data: data,
          resultCode: result['RESULT_CODE'] ?? '',
          resultDesc: result['RESULT_DESC'] ?? '',
          resultMessage: result['MESSAGE'] ?? '',
        );
      } else {
        return ResponseModel(
          data: [],
          resultCode: result['RESULT_CODE'] ?? '00',
          resultDesc: result['RESULT_DESC'] ?? 'GAGAL',
          resultMessage: result['MESSAGE'] ?? '',
        );
      }
    } catch (e) {
      return ResponseModel(
        data: [],
        resultCode: result['RESULT_CODE'] ?? '00',
        resultDesc: result['RESULT_DESC'] ?? 'GAGAL',
        resultMessage: e.toString(),
      );
    }
  }


  List<ResponseModel<T>> getResponseListSingleData(String response, {required T Function(String) formatter}) {
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
            resultCode: item['RESULT_CODE'] ?? "", 
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
          resultCode: result['RESULT_CODE'] ?? '00', 
          resultDesc: result['RESULT_DESC'] ?? 'GAGAL', 
          resultMessage: result['MESSAGE'] ?? e
        )
      ];
    }
  }

  ResponseModel<T> getResponseSingleData(String response, {required T Function(String) formatter}) {
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
        resultCode: item['RESULT_CODE'] ?? "", 
        resultDesc: item['RESULT_DESC'] ?? "", 
        resultMessage: item['MESSAGE'] ?? ""
      );
    } catch (e) {
      return ResponseModel(
        data: null, 
        resultCode: result['RESULT_CODE'] ?? '00', 
        resultDesc: result['RESULT_DESC'] ?? 'GAGAL', 
        resultMessage: result['MESSAGE'] ?? e
      );
    }
  }
}

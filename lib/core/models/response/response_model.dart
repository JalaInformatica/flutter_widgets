import 'package:flutter_widgets/core/models/response/response_code.dart';

class ResponseModel<T> {
    final T? data;
    final String resultCode;
    final String resultDesc;
    final String resultMessage;

    const ResponseModel({
        required this.data,
        required this.resultCode,
        required this.resultDesc,
        required this.resultMessage
    });

    factory ResponseModel.success({
      required T data,
      String resultMessage = ""
      }) {
      return ResponseModel(
        data: data,
        resultCode: ResponseCode.success,
        resultDesc: ResponseCode.successMsg,
        resultMessage: resultMessage,
      );
    }

  factory ResponseModel.error({
    required T? data,
    String resultMessage = ""
    }) {
    return ResponseModel(
      data: data,
      resultCode: ResponseCode.error,
      resultDesc: ResponseCode.errorMsg,
      resultMessage: resultMessage
    );
  }

  factory ResponseModel.exception({
    String resultMessage = ""
    }) {
    return ResponseModel(
      data: null,
      resultCode: ResponseCode.exception,
      resultDesc: ResponseCode.exceptionMsg,
      resultMessage: resultMessage,
    );
  }
}
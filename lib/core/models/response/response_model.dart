import 'package:flutter_widgets/core/models/response/response_code.dart';

class ResponseModelPaginated<T> {
  final List<T> data;
  final num totalPage;
  final num totalRecord;
  final String resultCode;
  final String resultDesc;
  final String resultMessage;

  const ResponseModelPaginated({
    this.totalPage = 0,
    this.totalRecord = 0,
    required this.data,
    required this.resultCode,
    required this.resultDesc,
    required this.resultMessage,
  });

  factory ResponseModelPaginated.success({
    required List<T> data,
    int pageNo = 1,
    int pageRow = 10,
    String resultMessage = "",
  }) {
    return ResponseModelPaginated(
      data: data,
      totalPage: pageNo,
      totalRecord: pageRow,
      resultCode: ResponseCode.success,
      resultDesc: ResponseCode.successMsg,
      resultMessage: resultMessage,
    );
  }

  factory ResponseModelPaginated.error({
    List<T> data = const [],
    String resultMessage = "",
  }) {
    return ResponseModelPaginated(
      data: data,
      resultCode: ResponseCode.error,
      resultDesc: ResponseCode.errorMsg,
      resultMessage: resultMessage,
    );
  }

  factory ResponseModelPaginated.exception({
    String resultMessage = "",
  }) {
    return ResponseModelPaginated(
      data: const [],
      resultCode: ResponseCode.exception,
      resultDesc: ResponseCode.exceptionMsg,
      resultMessage: resultMessage,
    );
  }
}

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
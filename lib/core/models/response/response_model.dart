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
}
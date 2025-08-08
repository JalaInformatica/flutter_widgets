class TrxModel {
  String noTrx;
  String resultCode;
  String resultDesc;
  String resultMessage;

  TrxModel({
    this.noTrx = "",
    this.resultCode = "",
    this.resultDesc = "",
    this.resultMessage = "",
  });

  TrxModel.fromJson(Map<String, dynamic> json)
      : noTrx = json['NO_TRX'] ?? "",
        resultCode = json['RESULT_CODE'] ?? "",
        resultDesc = json['RESULT_DESC'] ?? "",
        resultMessage = json['RESULT_MESSAGE'] ?? "";
}

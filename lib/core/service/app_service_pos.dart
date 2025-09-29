import 'dart:io';
import 'dart:convert';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

import '../utils/identifier_manager_pos.dart';

class AppServicesPos {
  Logger logger = Logger();

  Future<String> getBaseUrl() async {
    var baseUrl = IdentifierManagerPos.getServerEndPoint();
    return baseUrl;
  }

  Future<String> getrq(Map<String, dynamic> object) async {
    final userInfo = await fetchUserSessionInfo();
    return jsonEncode({
      "rq": {
        "IP": userInfo.$1,
        "USER_ID": userInfo.$2,
        "SESSION_LOGIN_ID": userInfo.$3,
        "COMPANY_ID": userInfo.$4,
        ...object
      }
    });
  }

  Future<http.Response> post(String url, { required Object body }) async {
    try {
      var baseUrl = await getBaseUrl();
      Map<String, String>? headers = await requestHeaders();  
      logger.i("url: $url body: $body");
      var response = await http.Client().post(Uri.parse(baseUrl + url), headers: headers, body: body);
      logger.i(response.body);
      return response;
    } on SocketException {
      throw Exception("Masalah Jaringan");
    } catch(e) {
      rethrow;
    } 
  }

  Future<http.Response> postFormData(String url,
      {Map<String, String>? headers,
      Map<String, String>? fields,
      List<File>? files}) async {
    // Logger logger = Logger();
    var baseUrl = await getBaseUrl();
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl! + url));

    if (headers != null) {
      request.headers.addAll(headers);
    }

    if (fields != null) {
      request.fields.addAll(fields);
    }

    if (files != null) {
      for (var file in files) {
        request.files
            .add(await http.MultipartFile.fromPath('FILE_UPLOAD[]', file.path));
      }
    }

    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);

    // logger.i(response.body);

    return response;
  }

  (String, String) fetchClientInfo() {
    String datads = IdentifierManagerPos.getDataDs();
    String username = IdentifierManagerPos.getClientKey();
    return (datads, username);
  }

  Future<Map<String, String>> requestHeaders() async {
    (String, String) clientInfo = fetchClientInfo();
    String datads = clientInfo.$1;
    String username = clientInfo.$2;

    await dotenv.load(fileName: 'env/.env_dev');
    String password = dotenv.env['BASIC_AUTH'].toString();

    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    String serverKey = IdentifierManagerPos.getServerKey();

    Map<String, String> header = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      "Accept": "application/json",
      'SERVER_KEY': serverKey,
      'DATA_DS': datads,
    };

    return header;
  }

  Future<(String ip, String userId, String sessionId, String companyId)> fetchUserSessionInfo() async {
    String ip = "";
    String userId = "";
    String sessionId = "";
    String companyId = "";

    ip = IdentifierManagerPos.getIp();
    if (ip.isEmpty) {
      try {
        var ipAddress = IpAddress();
        ip = await ipAddress.getIpAddress();
        IdentifierManagerPos.setIp(ip: ip);
      } on IpAddressException catch (exception) {
        print(exception.message);
      }
    }
    userId = IdentifierManagerPos.getUserId();
    sessionId = IdentifierManagerPos.getSessionLoginId();
    companyId = IdentifierManagerPos.getCompanyId();
    return (ip, userId, sessionId, companyId);
  }

  List<dynamic> responseToDataList({required String body}) {
    List data = jsonDecode(body)['rs']['DATA'] ?? [];
    return data;
  }

  Future<http.Response> getServerInfoRq(String url) async {
    try {
      var response = await http.Client().get(Uri.parse(url));
      logger.i(url);
      logger.i(response.body);
      return response;
    } on SocketException {
      throw Exception("Masalah Jaringan");
    } catch (e){
      rethrow;
    }
  }

  Future<http.Response> getClientKeyRq() async {
    try {
      String serverKey = IdentifierManagerPos.getServerKey();
      String baseUrl = IdentifierManagerPos.getServerEndPoint();
      String client = IdentifierManagerPos.getClienId();
      var url = '$baseUrl/SYSMAN/client';
      var header = {'SERVER_KEY': serverKey};
      var body = jsonEncode({
        'Content-Type': 'application/json',
        "rqClientGetKey": {"CLIENT_ID": client}
      });
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: body,
      );
      logger.i("${response.request} ${jsonEncode(body)} ${header}");
      logger.i(response.body);
      return response;
    } on SocketException {
      throw Exception("Masalah Jaringan");
    } catch (e){
      rethrow;
    }
  }
}

import 'dart:convert';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ResponseHandler {
  static String handleError(http.Response response) {
    switch (response.statusCode) {
      case 400:
        return "Bad Request";
      case 401:
        return "Unauthorized";
      case 403:
        return "Invalid credentials";
      case 404:
        return "Not Found";
      case 408:
        return "Connection Timeout";
      case 500:
        return "Internal Server Error";
      default:
        return "Error occurred while communicating with server";
    }
  }

  static Future<String> handle(http.Response response) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if(jsonDecode(response.body).containsKey("SECURITY_STATUS")){
        // ServerServices().getClientKey();
        throw Exception("Terjadi kesalahan, coba beberapa saat lagi");
      }
      return response.body;
    } else {
      throw Exception(handleError(response));
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mojacknong_android/data/app_exceptions.dart';
import 'package:mojacknong_android/data/network/base_api_services.dart';

class ApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    var jsonData;
    try {
      var response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonData = jsonResponse(response);
    } on SocketException {
      throw InternetException("인터넷 연결 없음");
    } on RequestTimeOut {
      throw RequestTimeOut("요청 타임아웃");
    }
    return jsonData;
  }

  dynamic jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
    }
  }
}

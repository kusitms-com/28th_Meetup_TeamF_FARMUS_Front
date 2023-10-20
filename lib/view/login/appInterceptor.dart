import 'package:dio/dio.dart';

class AppInterceptor extends InterceptorsWrapper {
  var dio = Dio();
  static String baseUrl =
      "http://ec2-43-202-6-54.ap-northeast-2.compute.amazonaws.com";

  AppInterceptor() {
    dio.options = BaseOptions(
      contentType: 'application/json',
      baseUrl: baseUrl,
    );
  }
}

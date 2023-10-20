import 'package:dio/dio.dart';

class AppInterceptor extends InterceptorsWrapper {
  Dio dio;

  AppInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    print("Request");
    handler.next(options);
  }

  @override
  void onError(err, ErrorInterceptorHandler handler) async {
    print("Error");
    if (err.response?.statusCode == 401) {
      String newAccessToken = await refreshToken();
      err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      handler.next(err);
      return;
    }
    throw err;
  }

  Future<String> refreshToken() async {
    return "";
  }
}

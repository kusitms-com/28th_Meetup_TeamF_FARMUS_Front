import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppInterceptor extends InterceptorsWrapper {
  Dio dio;
  final storage = FlutterSecureStorage();

  AppInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    handler.next(options);
  }

  @override
  void onError(err, ErrorInterceptorHandler handler) async {
    print("Error");
    if (err.response?.statusCode == 401) {
      print("401");
      String newAccessToken = await refreshToken();
      err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      handler.next(err);
      return;
    } else {
      print(err.message);
    }
    throw err;
  }

  Future<String> refreshToken() async {
    dio.interceptors.add(AppInterceptor(dio));
    try {
      final newToken = await storage.read(key: 'jwt');
      print("토큰 $newToken");

      Response response = await dio.get(
        "http://ec2-13-125-15-222.ap-northeast-2.compute.amazonaws.com/api/user/reissue-token",
        options: Options(
          headers: {'Authorization': 'Bearer $newToken'},
        ),
      );
      print(response.data);
      print("성공");
    } on DioError catch (e) {
      print(e.message);
      print("실패");
    }
    return "response";
  }
}

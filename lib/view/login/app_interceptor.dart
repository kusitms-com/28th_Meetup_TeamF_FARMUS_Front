import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

class AppInterceptor extends InterceptorsWrapper {
  Dio dio;

  AppInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Content-Type'] = 'application/json';
    final refreshToken = await storage.read(key: 'refreshToken');
    getRefreshToken(refreshToken);
    handler.next(options);
  }

  @override
  void onError(err, ErrorInterceptorHandler handler) async {
    print("Error");
    if (err.response?.statusCode == 401) {
      print("401");
      String newAccessToken = await getRefreshToken("");
      err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      handler.next(err);
      return;
    } else {
      print(err.message);
    }
    throw err;
  }

  Future<String> getRefreshToken(token) async {
    dio.interceptors.add(AppInterceptor(dio));
    try {
      final newToken = await storage.read(key: 'jwt');
      print("토큰 $newToken");

      Response response = await dio.get(
        "http://ec2-13-125-15-222.ap-northeast-2.compute.amazonaws.com/api/user/reissue-token",
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      print(response.data);
      print("성공성공성공성공");
    } on DioError catch (e) {
      print(e.message);
      print("실패");
    }
    return "response";
  }
}

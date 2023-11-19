import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class HomeScreenApiService {
  Future<List<String>> getDataFromApi() async {
    try {
      // Example data
      List<String> missions = [
        '상훈이',
        '2',
        '상추에 물 주고 사진 찍기',
      ];

      return missions;
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data from API');
    }
  }
}

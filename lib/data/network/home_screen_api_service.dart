import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class HomeScreenApiService {
  Future<List<String>> getDataFromApi() async {
    try {
      // Example data
      List<String> missions = [
        '이은섭',
        '2',
        '상추 심고 물 주기',
        // Add other missions
      ];

      return missions;
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data from API');
    }
  }
}

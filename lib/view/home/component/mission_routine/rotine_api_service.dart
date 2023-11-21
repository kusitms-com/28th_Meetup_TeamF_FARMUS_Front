import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class HomeScreenApiService {
  Future<List<Map<String, dynamic>>> getRoutine() async {
    try {
      List<Map<String, dynamic>> routines = [
        {
          "veggieNickname": "익명의 바질",
          "color": "#FFE3ED",
          "routineList": [
            {
              "routineId": 2,
              "routineName": "물 쏟기",
              "period": 3,
              "isDone": false
            },
            {"routineId": 3, "routineName": "물 쏟기", "period": 5, "isDone": true}
          ]
        },
      ];

      return routines;
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data from API');
    }
  }
}

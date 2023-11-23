import 'package:dio/dio.dart';
import 'package:mojacknong_android/data/network/base_api_services.dart';
import 'package:mojacknong_android/model/mission_mine.dart';
import 'package:mojacknong_android/model/routine_check_dto.dart';
import 'package:mojacknong_android/model/routine_month_dto.dart';

class RoutineApiServices {
  Future<List<MissionMine>> getMissions() async {
    try {
      Response response = await ApiClient().dio.get("/api/veggie/mission");
      if (response.statusCode == 200) {
        print(response.data["data"]);
        List<dynamic> dataList = response.data['data'];
        print(dataList);
        List<MissionMine> missionList =
            dataList.map((data) => MissionMine.fromJson(data)).toList();

        print(missionList);

        return missionList;
      } else {
        // 오류 발생 시 빈 리스트 반환
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  Future<List<List<RoutineMonthDto>>> getMonthRoutines(String date) async {
    try {
      Response response = await ApiClient().dio.get(
        "/api/veggie/routine",
        queryParameters: {
          "date": date,
        },
      );

      if (response.statusCode == 200) {
        print(response.data["data"]);
        List<dynamic> dataList = response.data['data'];
        print(dataList);
        List<List<RoutineMonthDto>> monthRoutineList = [];
        dataList.forEach((dynamic element) {
          List<dynamic> routineList = element as List<dynamic>;

          List<RoutineMonthDto> routineMonthDtoList = routineList
              .map((dynamic data) => RoutineMonthDto.fromJson(data))
              .toList();

          monthRoutineList.add(routineMonthDtoList);
        });

        print(monthRoutineList);

        return monthRoutineList;
      } else {
        // 오류 발생 시 빈 리스트 반환
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  Future<RoutineCreateDto> createRoutine(
      int veggieId, String content, String date) async {
    try {
      Map<String, dynamic> requestBody = {
        'veggieId': veggieId,
        'content': content,
        'date': date,
      };

      Response response =
          await ApiClient().dio.post("/api/veggie/routine", data: requestBody);

      if (response.statusCode == 200) {
        print(response.data["data"]);
        RoutineCreateDto routineCreateDto =
            RoutineCreateDto.fromJson(response.data["data"]);

        return routineCreateDto;
      } else {
        // 오류 발생 시 빈 리스트 반환
        return RoutineCreateDto(routineId: 0);
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  Future<RoutineCheckDto> checkRoutine(int routineId) async {
    try {
      Map<String, dynamic> requestBody = {
        'routineId': routineId,
      };

      Response response = await ApiClient()
          .dio
          .patch("/api/veggie/routine/check", data: requestBody);

      if (response.statusCode == 200) {
        print(response.data["data"]);
        RoutineCheckDto routineCheckDto =
            RoutineCheckDto.fromJson(response.data["data"]);

        return routineCheckDto;
      } else {
        // 오류 발생 시 빈 리스트 반환
        return RoutineCheckDto(routineId: 0, isDone: false);
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  Future<RoutineCreateDto> updateRoutine(int routineId, int period) async {
    try {
      Map<String, dynamic> requestBody = {
        'routineId': routineId,
        'period': period,
      };

      Response response =
          await ApiClient().dio.patch("/api/veggie/routine", data: requestBody);

      if (response.statusCode == 200) {
        print(response.data["data"]);
        RoutineCreateDto routineCreateDto =
            RoutineCreateDto.fromJson(response.data["data"]);

        return routineCreateDto;
      } else {
        // 오류 발생 시 빈 리스트 반환
        return RoutineCreateDto(routineId: 0);
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }
}

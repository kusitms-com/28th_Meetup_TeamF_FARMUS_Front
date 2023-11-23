import 'package:mojacknong_android/data/network/routine_api_services.dart';
import 'package:mojacknong_android/model/mission_mine.dart';
import 'package:mojacknong_android/model/routine_check_dto.dart';
import 'package:mojacknong_android/model/routine_month_dto.dart';

class RoutineRepository {
  static Future<List<MissionMine>> getMissions() async {
    try {
      List<MissionMine> response = await RoutineApiServices().getMissions();
      print("레포 ${response.runtimeType}");

      return response;
    } catch (e) {
      print("레포 에러 $e");
      throw "레포 에러 $e";
    }
  }

  static Future<List<List<RoutineMonthDto>>> getMonthRoutines(
      String date) async {
    try {
      List<List<RoutineMonthDto>> response =
          await RoutineApiServices().getMonthRoutines(date);
      print("레포 ${response.runtimeType}");

      return response;
    } catch (e) {
      print("레포 에러 $e");
      throw "레포 에러 $e";
    }
  }

  static Future<RoutineCreateDto> createRoutine(
      int veggieId, String content, String date) async {
    try {
      RoutineCreateDto response =
          await RoutineApiServices().createRoutine(veggieId, content, date);
      print("레포 ${response.runtimeType}");

      return response;
    } catch (e) {
      print("레포 에러 $e");
      throw "레포 에러 $e";
    }
  }

  static Future<RoutineCheckDto> checkRoutine(int routineId) async {
    try {
      RoutineCheckDto response =
          await RoutineApiServices().checkRoutine(routineId);
      print("레포 ${response.runtimeType}");

      return response;
    } catch (e) {
      print("레포 에러 $e");
      throw "레포 에러 $e";
    }
  }

  static Future<RoutineCreateDto> updateRoutine(
      int routineId, int period) async {
    try {
      RoutineCreateDto response =
          await RoutineApiServices().updateRoutine(routineId, period);
      print("레포 ${response.runtimeType}");

      return response;
    } catch (e) {
      print("레포 에러 $e");
      throw "레포 에러 $e";
    }
  }
}

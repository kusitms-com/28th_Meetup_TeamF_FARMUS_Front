import 'package:get/get.dart';
import 'package:mojacknong_android/model/mission_mine.dart';
import 'package:mojacknong_android/model/routine_check_dto.dart';
import 'package:mojacknong_android/model/routine_month_dto.dart';
import 'package:mojacknong_android/repository/routine_repository.dart';

class MissionRoutineController extends GetxController {
  var myMissionState = <MissionMine>[].obs;
  RxList<RoutineMonthDto> dayEvents = <RoutineMonthDto>[].obs;

  void getDayEvents(List<RoutineMonthDto> events) {
    dayEvents.value = events;
    print(dayEvents.value);
  }

  void getMissions() async {
    try {
      List<MissionMine> myMissions = await RoutineRepository.getMissions();
      myMissionState.value = myMissions;
    } catch (e) {
      print("나의 미션 조회 중 오류: $e");
    }
  }

  Future<RoutineCreateDto> createRoutine(
      int veggieId, String content, String date) async {
    try {
      RoutineCreateDto routineCreateDto =
          await RoutineRepository.createRoutine(veggieId, content, date);
      print("=========RoutineCreate===========");
      print(routineCreateDto.routineId);
      return routineCreateDto;
    } catch (e) {
      print("루틴 생성 중 오류: $e");
    }
    return RoutineCreateDto(routineId: 0);
  }

  void checkRoutine(int routineId) async {
    try {
      RoutineCheckDto routineCheckDto =
          await RoutineRepository.checkRoutine(routineId);
      print("=========RoutineCheck===========");
      print(routineCheckDto.routineId);
      print(routineCheckDto.isDone);
    } catch (e) {
      print("루틴 체크 중 오류: $e");
    }
  }

  void updateRoutine(int routineId, int period) async {
    print("updateRoutine: $routineId, $period");
    try {
      RoutineCreateDto routineCreateDto =
          await RoutineRepository.updateRoutine(routineId, period);
      print("=========RoutineUpdate===========");
      print(routineCreateDto.routineId);
    } catch (e) {
      print("루틴 수정 중 오류: $e");
    }
  }
}

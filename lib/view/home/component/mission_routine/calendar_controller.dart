import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mojacknong_android/model/routine_month_dto.dart';
import 'package:mojacknong_android/repository/routine_repository.dart';

class CalendarController extends GetxController {
  var eventsMap = <DateTime, List<RoutineMonthDto>>{}.obs;
  var events = <List<RoutineMonthDto>>[].obs;
  var dayEvents = <RoutineMonthDto>[].obs;
  var currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;

  void updateCurrentDate(DateTime date) {
    currentDate.value = DateFormat("yyyy-MM-dd").format(date);
  }

  Future<List<RoutineMonthDto>> updateEvents(String date, DateTime yymm) async {
    try {
      List<List<RoutineMonthDto>> monthRoutines =
          await RoutineRepository.getMonthRoutines(date);
      events.value = monthRoutines;

      eventsMap.value = {};
      for (int i = 0; i < events.length; i++) {
        print(events[i]);
        print(DateTime.utc(yymm.year, yymm.month, i + 1));
        eventsMap[DateTime.utc(yymm.year, yymm.month, i + 1)] = events[i];
      }

      print("calandarController");
      print(eventsMap[DateTime.utc(yymm.year, yymm.month, yymm.day)]);

      dayEvents.value = eventsMap[yymm] ?? [];
      return dayEvents;
    } catch (e) {
      print("캘린더 조회 중 오류: $e");
    }
    return []; // Add a return statement here
  }
}

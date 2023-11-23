import 'package:get/get.dart';
import 'package:mojacknong_android/model/routine_month_dto.dart';

class RoutineListController extends GetxController {
  RxList<RoutineDayDto> dayEvents = <RoutineDayDto>[].obs;

  void setDayEvents(List<RoutineDayDto> events) {
    dayEvents.value = events;
  }
}

import 'package:get/get.dart';
import 'package:mojacknong_android/model/routine_month_dto.dart';

class RoutineDayController extends GetxController {
  RxList<RoutineDayDto> routineList = <RoutineDayDto>[].obs;

  void setDayEvents(List<RoutineDayDto> events) {
    routineList.assignAll(events);
  }
}

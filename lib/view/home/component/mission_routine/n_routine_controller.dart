import 'package:get/get.dart';
import 'package:mojacknong_android/model/routine_month_dto.dart';

class NRoutineController extends GetxController {
  var routines = <RoutineMonthDto>[].obs;

  void updateRoutines(List<RoutineMonthDto> events) {
    print("updateRoutine: $events");
    routines.assignAll(events);
  }
}

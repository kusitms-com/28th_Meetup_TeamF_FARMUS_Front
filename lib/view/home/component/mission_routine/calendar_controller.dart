import 'package:get/get.dart';

class CalendarController extends GetxController {
  var events = <DateTime, List<dynamic>>{}.obs;

  void updateEvents(Map<DateTime, List<dynamic>> newEvents) {
    events.value = newEvents;
  }
}

import 'package:get/get.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/display_text_widget.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/routine_data.dart';

class RoutineListController extends GetxController {
  // final TextEditingController controller = TextEditingController();
  var displayTexts = <DisplayTextWidget>[].obs;
  var isCombinedWidgetVisible = true.obs;

  RxBool isCheck = RxBool(false);

  String enteredText = '';

  Rx<Routine?> routine = Rx<Routine?>(null);
  void updateRoutine(Routine newRoutine) {
    routine.value = newRoutine;
  }

  void toggleCombinedWidgetVisibility() {
    isCombinedWidgetVisible.value = !isCombinedWidgetVisible.value;
  }

  void toggleSelectCheck() {
    isCheck.value = !isCheck.value;
    if (isCheck.value) {
      if (routine.value == null) {
        print("루틴이 설정되지 않았습니다.");
      } else {
        print("현재 루틴: ${routine.value?.routineName}");
      }
    }
    print("체크됨 $isCheck.value");
  }

  void addDisplayText(DisplayTextWidget displayTextWidget) {
    displayTexts.add(displayTextWidget);
    update();
  }
}

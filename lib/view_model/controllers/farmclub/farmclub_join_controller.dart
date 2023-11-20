import 'package:get/get.dart';

class FarmclubJoinController extends GetxController {
  RxBool isCheck = RxBool(false);
  RxBool isFormValid = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    ever(isCheck, (_) {
      checkFormVaildity();
    });
  }

  void toggleSelectCheck() {
    isCheck.value = !isCheck.value;
  }

  void checkFormVaildity() {
    isFormValid.value = isCheck.value;
  }
}

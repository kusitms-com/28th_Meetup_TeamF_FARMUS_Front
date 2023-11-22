import 'package:get/get.dart';
import 'package:mojacknong_android/model/crop/crop_info_step.dart';
import 'package:mojacknong_android/model/crop/whole_hint.dart';
import 'package:mojacknong_android/repository/crop_repository.dart';

class CropInfoStepController extends GetxController {
  RxList<List<CropInfoStep>> cropInfoStep = <List<CropInfoStep>>[].obs;
  RxList<CropInfoStep> cropInfoStepClear = <CropInfoStep>[].obs;
  RxList<CropInfoStep> cropInfoStepCurrent = <CropInfoStep>[].obs;
  RxList<CropInfoStep> cropInfoStepTodo = <CropInfoStep>[].obs;

  RxString veggieInfoId = "".obs;
  RxInt stepNum = 0.obs;


  Future<List<List<CropInfoStep>>> getCropInfoStep() async {
    try {
      List<List<CropInfoStep>> responseData =
      await CropRepository.getCropInfoStep(
          veggieInfoId.value, stepNum.value);

      cropInfoStep.clear();
      cropInfoStepClear.clear();
      cropInfoStepCurrent.clear();
      cropInfoStepTodo.clear();
      cropInfoStep.addAll(responseData);
      cropInfoStepClear.addAll(responseData[0]);
      cropInfoStepCurrent.addAll(responseData[1]);
      cropInfoStepTodo.addAll(responseData[2]);

      stepNum.value = cropInfoStepClear.length;


      print(stepNum.value);

      return responseData;
    } catch (error) {
      print('팜클럽 데이터를 가져오는 중 오류 발생: $error');
      throw error;
    }
  }
}
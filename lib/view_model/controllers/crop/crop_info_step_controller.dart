import 'package:get/get.dart';
import 'package:mojacknong_android/model/crop/crop_info_step.dart';
import 'package:mojacknong_android/model/crop/whole_hint.dart';
import 'package:mojacknong_android/repository/crop_repository.dart';

class CropInfoStepController extends GetxController {
  RxList<List<CropInfoStep>> cropInfoStep = <List<CropInfoStep>>[].obs;
  RxList<CropInfoStep> cropInfoStepClear = <CropInfoStep>[].obs;
  RxList<CropInfoStep> cropInfoStepCurrent = <CropInfoStep>[].obs;
  RxList<CropInfoStep> cropInfoStepTodo = <CropInfoStep>[].obs;

  RxList<List<WholeHint>> wholeHint = <List<WholeHint>>[].obs;


  RxString veggieInfoid = "".obs;
  RxInt stepNum = 0.obs;

  Future<List<List<CropInfoStep>>> getCropInfoStep() async {
    try {
      List<List<CropInfoStep>> responseData =
          await CropRepository.getCropInfoStep(
              veggieInfoid.value, stepNum.value);

      // RxList 갱신
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
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }

  Future<List<WholeHint>> getCropWholeHint() async {
    print(veggieInfoid);
    try {
      List<WholeHint> responseData =
          await CropRepository.getCropWholeHint(
        veggieInfoid.value,
      );

      // RxList 갱신
      cropInfoStep.clear();
      cropInfoStepClear.clear();
      cropInfoStepCurrent.clear();
      cropInfoStepTodo.clear();

      stepNum.value = cropInfoStepClear.length;

      print(stepNum.value);

      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }
}

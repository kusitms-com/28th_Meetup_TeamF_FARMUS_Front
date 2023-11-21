import 'package:get/get.dart';
import 'package:mojacknong_android/model/crop/crop_info_step.dart';
import 'package:mojacknong_android/repository/crop_repository.dart';

class CropInfoStepController extends GetxController {
  RxList<CropInfoStep> cropInfoStep = <CropInfoStep>[].obs;
  RxString veggieInfoid = "".obs;
  RxInt stepNum = 0.obs;

  Future<List<CropInfoStep>> getCropInfoStep() async {
    try {
      List<CropInfoStep> responseData = await CropRepository.getCropInfoStep(
        veggieInfoid.value, stepNum.value
      );

      // RxList 갱신
      cropInfoStep.clear();
      cropInfoStep.addAll(responseData);

      return responseData;
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub data: $error');
      throw error;
    }
  }
}

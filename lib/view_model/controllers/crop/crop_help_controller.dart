import 'package:get/get.dart';
import 'package:mojacknong_android/model/crop/crop_info_step.dart';
import 'package:mojacknong_android/model/crop/whole_hint.dart';
import 'package:mojacknong_android/repository/crop_repository.dart';

class CropHelpController extends GetxController {

  RxList<WholeHint> cropWholeHints = <WholeHint>[].obs;

  RxString veggieInfoId = "".obs;
  RxInt stepNum = 0.obs;

  void setCropWholeHints(List<WholeHint> hints) {
    cropWholeHints.clear();
    cropWholeHints.addAll(hints);
  }

  Future<List<WholeHint>> getCropWholeHint() async {
    print(veggieInfoId);
    try {
      List<WholeHint> responseData =
      await CropRepository.getCropWholeHint(
        veggieInfoId.value,
      );

      cropWholeHints.clear();
      cropWholeHints.addAll(responseData);

      stepNum.value = cropWholeHints.length;

      print(stepNum.value);

      return responseData;
    } catch (error) {
      print('팜클럽 데이터를 가져오는 중 오류 발생: $error');
      throw error;
    }
  }
}
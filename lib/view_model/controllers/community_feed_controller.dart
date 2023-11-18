import 'package:get/get.dart';
import 'package:mojacknong_android/model/community_posting.dart';
import 'package:mojacknong_android/repository/community_repository.dart';

class CommunityFeedController extends GetxController {
  var profileImage = "".obs;
  var nickname = "".obs;
  var postTime = "".obs;
  var comment = "".obs;
  var postCategory = "".obs;
  var title = "".obs;
  var content = "".obs;
  var image = "".obs;

  var selectedCategories = <String>[].obs;

  var communityPostings = <CommunityPosting>[].obs;

  void setData({
    String profileImage = "",
    String nickname = "",
    String postTime = "",
    String comment = "",
    String postCategory = "",
    String title = "",
    String content = "",
    String image = "",
  }) {
    this.profileImage.value = profileImage;
    this.nickname.value = nickname;
    this.postTime.value = postTime;
    this.comment.value = comment;
    this.postCategory.value = postCategory;
    this.title.value = title;
    this.content.value = content;
    this.image.value = image;
  }

  // 카테고리 선택 메서드
  void selectCategory(String category) {
    if (selectedCategories.contains(category)) {
      // 이미 선택된 경우 해제
      selectedCategories.remove(category);
    } else {
      // 선택되지 않은 경우 추가
      selectedCategories.add(category);
    }
  }

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
    update();
  }

  Future<void> getWholePosting() async {
    try {
      List<CommunityPosting> postings =
          await CommunityRepository.getWholePosting();
      communityPostings.assignAll(postings);
    } catch (error) {
      print('Error fetching community postings: $error');
    }
  }
}

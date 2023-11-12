import 'package:get/get.dart';

class CommunityFeedController extends GetxController {
  var profileImage = "".obs;
  var nickname = "".obs;
  var postTime = "".obs;
  var comment = "".obs;
  var postCategory = "".obs;
  var title = "".obs;
  var content = "".obs;
  var image = "".obs;

  var selectedCategory = "".obs;

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
    selectedCategory.value = category;
  }
}

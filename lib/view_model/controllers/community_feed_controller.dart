import 'package:get/get.dart';

class CommunityFeedController extends GetxController {
  var profileImage = "".obs;
  var nickname = "".obs;
  var postTime = "".obs;
  var comment = "".obs;
  var postCategory = "".obs;
  var content = "".obs;
  var image = "".obs;

  void setData({
    String profileImage = "",
    String nickname = "",
    String postTime = "",
    String comment = "",
    String postCategory = "",
    String content = "",
    String image = "",
  }) {
    this.profileImage.value = profileImage;
    this.nickname.value = nickname;
    this.postTime.value = postTime;
    this.comment.value = comment;
    this.postCategory.value = postCategory;
    this.content.value = content;
    this.image.value = image;
  }
}

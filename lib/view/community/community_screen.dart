import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/model/community_posting.dart';
import 'package:mojacknong_android/view/community/component/button_next_my_post.dart';
import 'package:mojacknong_android/view/community/component/community_category.dart';
import 'package:mojacknong_android/view/community/component/community_feed.dart';
import 'package:mojacknong_android/view/community/component/floating_button_post.dart';
import 'package:mojacknong_android/view_model/controllers/community_feed_controller.dart';

class CommunityScreen extends StatefulWidget {
  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final CommunityFeedController _communityController =
      Get.put(CommunityFeedController());

  List<String> category = <String>["도와주세요", "자랑할래요", "정보나눠요"];
  @override
  void initState() {
    super.initState();
    _loadCommunityData();
  }

  Future<void> _loadCommunityData() async {
    await _communityController.getWholePosting();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              ...category.map(
                (item) {
                  return CommunityCategory(
                      feedController: _communityController, category: item);
                },
              ).toList(),
              const Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ButtonNextMyPost(),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: _communityController.communityPostings.length,
                itemBuilder: (context, index) {
                  CommunityPosting posting =
                      _communityController.communityPostings[index];
                  return CommunityFeed(
                    postingId: posting.postingId,
                    userId: posting.userId,
                    profileImage: posting.userImageUrl,
                    nickname: posting.nickName,
                    postTime: posting.createdAt,
                    comment: posting.commentCount.toString(),
                    postCategory: posting.tag,
                    title: posting.title,
                    content: posting.contents,
                    image: posting.postingImage.isNotEmpty
                        ? posting.postingImage[0]
                        : "",
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: const FloatingButtonPost(),
    );
  }
}

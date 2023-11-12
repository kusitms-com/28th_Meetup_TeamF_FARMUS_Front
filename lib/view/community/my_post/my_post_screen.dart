import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/model/community_posting.dart';
import 'package:mojacknong_android/repository/community_repository.dart';

class MyPostScreen extends StatefulWidget {
  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  @override
  void initState() {
    super.initState();
    getMyPosting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "내 글",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  Future<void> getMyPosting() async {
    List<CommunityPosting> postings = await CommunityRepository.getMyPosting();
  }
}

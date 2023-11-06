import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';

class MyPageList extends StatelessWidget {
  const MyPageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const Center(
        child: Text("나의 글"),
      ),
    );
  }
}

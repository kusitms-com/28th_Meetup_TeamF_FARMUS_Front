import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';

class MyPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text("나의 글"),
      ),
    );
  }
}

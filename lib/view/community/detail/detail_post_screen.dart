import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';

class DetailPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Text("글 상세"),
    );
  }
}

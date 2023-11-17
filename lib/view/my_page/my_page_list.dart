import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';

class MyPageList extends StatelessWidget {
  final String? data;

  const MyPageList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "채소 히스토리",
      ),
      body: Center(
        child: Text('New page with data: $data'),
      ),
    );
  }
}

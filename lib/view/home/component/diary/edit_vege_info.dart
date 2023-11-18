import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';

class EditVegeInfo extends StatefulWidget {
  const EditVegeInfo({Key? key}) : super(key: key);

  @override
  State<EditVegeInfo> createState() => _EditVegeInfoState();
}

class _EditVegeInfoState extends State<EditVegeInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(),
    );
  }
}

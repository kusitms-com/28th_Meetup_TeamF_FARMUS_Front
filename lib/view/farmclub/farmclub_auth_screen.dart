import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';

class FarmclubAuthScreen extends StatefulWidget {
  const FarmclubAuthScreen({super.key});

  @override
  State<FarmclubAuthScreen> createState() => _FarmclubAuthScreenState();
}

class _FarmclubAuthScreenState extends State<FarmclubAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "미션 인증",
      ),
    );
  }
}

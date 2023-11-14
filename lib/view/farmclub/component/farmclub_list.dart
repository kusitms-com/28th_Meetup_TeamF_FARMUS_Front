import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub.dart';

class FarmclubList extends StatefulWidget {
  @override
  State<FarmclubList> createState() => _FarmclubListState();
}

class _FarmclubListState extends State<FarmclubList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Farmclub(),
        ],
      ),
    );
  }
}

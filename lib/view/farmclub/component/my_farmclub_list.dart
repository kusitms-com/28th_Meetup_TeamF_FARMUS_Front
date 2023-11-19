import 'package:flutter/material.dart';
import 'package:mojacknong_android/model/farmclub_mine.dart';
import 'package:mojacknong_android/view/farmclub/component/my_farmclub.dart';

class MyFarmclubList extends StatefulWidget {
  final List<FarmclubMine> farmclubData;

  MyFarmclubList({
    Key? key,
    required this.farmclubData,
  }) : super(key: key);

  @override
  State<MyFarmclubList> createState() => _MyFarmclubListState();
}

class _MyFarmclubListState extends State<MyFarmclubList> {
  @override
  void initState() {
    super.initState();
    print(widget.farmclubData);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [],
      ),
    );
  }
}

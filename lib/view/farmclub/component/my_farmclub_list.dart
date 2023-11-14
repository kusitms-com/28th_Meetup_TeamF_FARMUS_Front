import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/farmclub/component/my_farmclub.dart';

class MyFarmclubList extends StatefulWidget {
  @override
  State<MyFarmclubList> createState() => _MyFarmclubListState();
}

class _MyFarmclubListState extends State<MyFarmclubList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyFarmclub(
              isLast: false,
              myFarmclubImage: "assets/image/image_lettuce.png",
            ),
            MyFarmclub(
              isLast: false,
              myFarmclubImage: "assets/image/image_welsh_onion.png",
            ),
            MyFarmclub(
              isLast: false,
              myFarmclubImage: "assets/image/image_tomato.png",
            ),
            MyFarmclub(isLast: true),
          ],
        ),
      ),
    );
  }
}

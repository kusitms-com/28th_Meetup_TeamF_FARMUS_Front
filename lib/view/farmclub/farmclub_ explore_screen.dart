import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/button_to_search.dart';

class FarmclubExploreScreen extends StatelessWidget {
  const FarmclubExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        actions: [
          Row(
            children: [
              ButtonToSearch(),
              SizedBox(
                width: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}

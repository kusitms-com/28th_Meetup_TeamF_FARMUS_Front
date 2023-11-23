import 'package:flutter/material.dart';
import 'package:mojacknong_android/data/network/home_screen_api_service.dart';
import 'package:mojacknong_android/view/home/component/home_farmclub.dart';

import '../../../common/farmus_theme_data.dart';

class HomeContent extends StatefulWidget {
  final int? challengeId;
  final String? veggieNickname;
  final int? stepNum;
  final String? stepName;
  final String? color;
  final String? detailId;
  const HomeContent({
    Key? key,
    required this.challengeId,
    required this.veggieNickname,
    required this.stepNum,
    required this.stepName,
    required this.color,
    required this.detailId
  }) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool isDataLoaded = true; //api 연동됐다고 가정

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: HomeScreenApiService().getDataFromApi(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.green),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error loading data: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (snapshot.hasData) {
          List<String> apiData = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isDataLoaded)
                HomeFarmClub(
                  veggieNickname: widget.veggieNickname,
                  stepName: widget.stepName,
                  stepNum: widget.stepNum,
                  color: widget.color,
                  detailId: widget.detailId,
                  onTap: () {},
                ),
              const SizedBox(height: 10),
              if (!isDataLoaded)
                const Center(
                  child: Text(
                    '',
                    textAlign: TextAlign.center,
                    style:  FarmusThemeData.darkStyle13,
                  ),
                ),
            ],
          );
        } else {
          return const Center(child: Text('No data'));
        }
      },
    );
  }
}

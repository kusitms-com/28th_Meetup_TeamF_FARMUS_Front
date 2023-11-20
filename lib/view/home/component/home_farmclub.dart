import 'package:flutter/material.dart';
import 'package:mojacknong_android/data/network/home_screen_api_service.dart';
import 'package:mojacknong_android/view/home/detail/home_club_list_item.dart';

class HomeFarmClub extends StatefulWidget {
  final String? veggieNickname;
  final int? stepNum;
  final String? stepName;
  final VoidCallback onTap;

  const HomeFarmClub({
    Key? key,
    required this.veggieNickname,
    required this.stepName,
    required this.stepNum,
    required this.onTap,
  }) : super(key: key);

  @override
  State<HomeFarmClub> createState() => _HomeFarmClubState();
}

class _HomeFarmClubState extends State<HomeFarmClub> {
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

          return Align(
            alignment: Alignment.centerLeft,
            child: FarmClubListItem(
              veggieNickname: widget.veggieNickname,
              routineId: widget.stepNum,
              routineName: widget.stepName,
              onTap: widget.onTap,
            ),
          );
        } else {
          return const Center(child: Text('No data'));
        }
      },
    );
  }
}

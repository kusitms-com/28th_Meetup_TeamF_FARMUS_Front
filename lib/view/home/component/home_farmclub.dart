import 'package:flutter/material.dart';
import 'package:mojacknong_android/data/network/home_screen_api_service.dart';
import 'package:mojacknong_android/view/home/detail/home_club_list_item.dart';

class HomeFarmClub extends StatefulWidget {
  final Future<String> nameFuture;
  final Future<String> numFuture;
  final Future<String> missionFuture;
  final VoidCallback onTap;

  const HomeFarmClub({
    Key? key,
    required this.nameFuture,
    required this.missionFuture,
    required this.numFuture,
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
              veggieNickname: apiData[0],
              routineId: apiData[1],
              routineName: apiData[2],
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

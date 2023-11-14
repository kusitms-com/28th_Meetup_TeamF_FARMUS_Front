import 'package:flutter/material.dart';
import 'package:mojacknong_android/data/network/home_screen_api_service.dart';
import 'package:mojacknong_android/view/home/component/home_farmclub.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool isDataLoaded = true;

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
                  nameFuture: Future.value(apiData[0]),
                  missionFuture: Future.value(apiData[2]),
                  numFuture: Future.value(apiData[1]),
                  onTap: () {},
                ),
              const SizedBox(height: 10),
              if (!isDataLoaded)
                const Center(
                  child: Text(
                    '아직 루틴을 등록하지 않았어요\n루틴을 등록해 내 채소를 건강하게 관리하세요!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, fontFamily: 'Pretendard'),
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

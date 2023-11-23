// import 'package:mojacknong_android/view/home/get/home_farm_mission.dart';

import 'dart:async';

import '../data/network/diary_api_service.dart';
import '../data/network/home_screen_api_service.dart';
import '../data/network/vege_api_service.dart';
import '../model/all_vege_infor_list.dart';
import '../model/current_mission_list.dart';
import '../model/my_vege_diary_list.dart';
import '../model/my_vege_list.dart';
import '../model/my_vege_routine_list.dart';

class HomeScreenRepository {
  // static Future<List<FarmClubMission>> getNameFromApi() async {
  //   List<FarmClubMission> response =
  //       await HomeScreenRepository.getNameFromApi();
  //   return response;
  // }
  //
  // static Future<List<FarmClubMission>> getNumFromApi() async {
  //   List<FarmClubMission> response = await HomeScreenRepository.getNumFromApi();
  //   return response;
  // }
  //
  // static Future<List<FarmClubMission>> getMissionFromApi() async {
  //   List<FarmClubMission> response =
  //       await HomeScreenRepository.getNameFromApi();
  //   return response;
  // }

  static Future<MyVegeList?> getMyVegeListApi() async {
    final response = await HomeScreenApiService.getMyVegeList();
    print(response?.motivation);

    return response;
  }

  static Future<CurrentMissionList?> getCurrentMissionListApi() async {
    final response = await HomeScreenApiService.getCurrentMissionList();

    return response;
  }

  static Future<MyVegeRoutineList?> getMyVegeRoutineListApi() async {
    final response = await HomeScreenApiService.getMyVegeRoutineList();

    return response;
  }

  static Future<MyVegeDiaryList?> getMyVegeDiaryListApi(int vegeId) async {
    final response = await DiaryApiService.getMyVegeDiaryList(vegeId);

    return response;
  }

  static Future<AllVegeInforList?> getAllVegeInforListApi() async {
    final response = await VegeApiService.getAllVegeInforList();

    return response;
  }

  static Future<List<dynamic>> getHomePageData() async {
    final List<FutureOr<dynamic>> futures = [
      getMyVegeListApi(),
      getCurrentMissionListApi(),
      getMyVegeRoutineListApi()
    ];

    return Future.wait(futures.cast<Future<dynamic>>());
  }
}

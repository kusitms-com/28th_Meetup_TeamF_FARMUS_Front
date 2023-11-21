import 'dart:io';

import 'package:mojacknong_android/data/network/farmclub_api_service.dart';
import 'package:mojacknong_android/model/farmclub_detail.dart';
import 'package:mojacknong_android/model/farmclub_diary.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';
import 'package:mojacknong_android/model/farmclub_mine.dart';
import 'package:mojacknong_android/model/farmclub_mine_detail.dart';
import 'package:mojacknong_android/model/farmclub_mission.dart';
import 'package:mojacknong_android/model/farmclub_my_mission.dart';
import 'package:mojacknong_android/model/veggie_registration.dart';

import '../model/farmclub_mission_response.dart';

class FarmclubRepository {
  // 나의 팜클럽 조회
  static Future<List<FarmclubMine>> getFarmclub() async {
    try {
      List<FarmclubMine> response = await FarmclubApiService().getFarmclub();
      print("레포 ${response.runtimeType}");

      return response;
    } catch (e) {
      print("레포 에러 $e");
      throw "레포 에러 $e";
    }
  }

  // 팜클럽 목록 조회
  static Future<List<FarmclubInfoModel>> postFarmclub(
    List<String> difficulties,
    String status,
    String keyword,
  ) async {
    try {
      List<FarmclubInfoModel> response =
          await FarmclubApiService().postFarmclubSearch(
        difficulties: difficulties,
        status: status,
        keyword: keyword,
      );

      return response;
    } catch (e) {
      print("Error in postFarmclub: $e");
      throw "Error in postFarmclub: $e";
    }
  }

  // 팜클럽 정보 조회
  static Future<FarmclubDetail?> getFarmclubDetail(String id) async {
    try {
      print("challengeId  $id");

      FarmclubDetail? response =
          await FarmclubApiService().getFarmclubDetail(id);

      return response;
    } catch (e) {
      print("에러! getFarmclubDetail: $e");
      throw "에러! getFarmclubDetail: $e";
    }
  }

  // 내 팜클럽 정보 조회
  static Future<FarmclubMineDetail?> getFarmclubMineDetail(String id) async {
    try {
      print("challengeId  $id");

      FarmclubMineDetail? response =
          await FarmclubApiService().getFarmclubMineDetail(id);

      return response;
    } catch (e) {
      print("에러! getFarmclubDetail: $e");
      throw "에러! getFarmclubDetail: $e";
    }
  }

  // 팜클럽 가입 전 채소 조회
  static Future<List<VeggieRegistration>> getVeggieRegistration() async {
    try {
      List<VeggieRegistration> response =
          await FarmclubApiService().getVeggieRegistraion();

      return response;
    } catch (e) {
      throw "레포 에러 $e";
    }
  }

  // 팜클럽 가입
  static Future<int> postRegister(String challengeId, String veggieId) async {
    try {
      int response = await FarmclubApiService()
          .postRegister(challengeId: challengeId, veggieId: veggieId);
      print("레포 ${response}");

      return response;
    } catch (e) {
      print("레포 에러 $e");
      throw "레포 에러 $e";
    }
  }

  static Future<FarmclubMissionResponse> postFarmclubMission(
      int registrationId, String content, File image) async {
    try {
      FarmclubMissionResponse response = await FarmclubApiService()
          .postFarmclubMission(
              registrationId: registrationId, content: content, image: image);

      print("레포 ${response}");

      return response;
    } catch (e) {
      throw "레포 에러 $e";
    }
  }

  // 추천 팜클럽 조회
  static Future<List<FarmclubInfoModel>> getFarmclubRecommend() async {
    try {
      List<FarmclubInfoModel> response =
          await FarmclubApiService().getFarmclubRecommendation();

      return response;
    } catch (e) {
      throw "레포 에러 $e";
    }
  }

  // 미션 목록 조회
  static Future<List<FarmclubMission>> getFarmclubMission(
    int challengeId,
    int stepNum,
  ) async {
    try {
      List<FarmclubMission> response =
          await FarmclubApiService().getFarmclubMission(
        challengeId,
        stepNum,
      );

      return response;
    } catch (e) {
      throw "레포 에러 $e";
    }
  }

  // 일기 목록 조회
  static Future<List<FarmclubDiary>> getFarmclubDiary(
    int challengeId,
  ) async {
    try {
      List<FarmclubDiary> response =
          await FarmclubApiService().getFarmclubDiary(
        challengeId,
      );

      return response;
    } catch (e) {
      throw "레포 에러 $e";
    }
  }

  // 내 미션 인증 글 조회
  static Future<List<FarmclubMyMission>> getFarmclubMyMission(
    int challengeId,
  ) async {
    try {
      List<FarmclubMyMission> response =
          await FarmclubApiService().getFarmclubMyMssion(
        challengeId,
      );

      return response;
    } catch (e) {
      throw "레포 에러 $e";
    }
  }

  // 새로운 팜클럽 개설
  static Future<int> postNewFarmclub(
    String myVeggieId,
    String veggieInfoId,
    String challengeName,
    String maxUser,
    String description,
  ) async {
    try {
      int response = await FarmclubApiService().postFarmclub(
        myVeggieId: myVeggieId,
        veggieInfoId: veggieInfoId,
        challengeName: challengeName,
        maxUser: maxUser,
        description: description,
      );

      return response;
    } catch (e) {
      throw "레포 에러 $e";
    }
  }
}

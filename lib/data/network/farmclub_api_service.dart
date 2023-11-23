import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mojacknong_android/data/network/base_api_services.dart';
import 'package:mojacknong_android/model/farmclub_complete.dart';
import 'package:mojacknong_android/model/farmclub_detail.dart';
import 'package:mojacknong_android/model/farmclub_diary.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';
import 'package:mojacknong_android/model/farmclub_mine.dart';
import 'package:mojacknong_android/model/farmclub_mine_detail.dart';
import 'package:mojacknong_android/model/farmclub_mission.dart';
import 'package:mojacknong_android/model/farmclub_my_mission.dart';
import 'package:mojacknong_android/model/veggie_registration.dart';

import '../../model/farmclub_mission_response.dart';

class FarmclubApiService {
  // 나의 팜클럽 조회
  Future<List<FarmclubMine>> getFarmclub() async {
    try {
      Response response = await ApiClient().dio.get("/api/farmclub");

      if (response.statusCode == 200) {
        print(response.data["data"]);
        List<dynamic> dataList = response.data['data'];
        List<FarmclubMine> farmclubmineList =
        dataList.map((data) => FarmclubMine.fromJson(data)).toList();

        print(farmclubmineList);

        return farmclubmineList;
      } else {
        // 오류 발생 시 빈 리스트 반환
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  // 팜클럽 목록 조회
  Future<List<FarmclubInfoModel>> postFarmclubSearch({
    required List<String> difficulties,
    required String status,
    required String keyword,
  }) async {
    try {
      Map<String, dynamic> requestBody = {
        'difficulties': difficulties,
        'status': status,
        'keyword': keyword,
      };

      Response response = await ApiClient().dio.post(
        "/api/farmclub/search",
        data: requestBody,
      );

      if (response.statusCode == 200) {
        print(response.data['data']);

        // response.data['data']가 List 형태인지 확인
        if (response.data['data'] is List) {
          // List가 비어있으면 빈 리스트 반환
          if (response.data['data'].isEmpty) {
            return [];
          }

          // List의 각 요소를 FarmclubInfoModel로 변환하여 리스트에 추가
          List<dynamic> dataList = response.data['data'];
          List<FarmclubInfoModel> farmclubList =
          dataList.map((data) => FarmclubInfoModel.fromJson(data)).toList();
          print(farmclubList.runtimeType);

          return farmclubList;
        } else {
          // List가 아니면 빈 리스트 반환
          return [];
        }
      } else {
        // 오류 발생 시 빈 리스트 반환
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  // 가입한 팜클럽 정보 조회
  Future<FarmclubMineDetail> getFarmclubMineDetail(String challengeId) async {
    try {
      print("challengeId  $challengeId");
      // API 호출
      Response response = await ApiClient().dio.get(
        "/api/farmclub/$challengeId",
      );

      // 응답 상태 코드 확인
      if (response.statusCode == 200) {
        // 성공적으로 응답받은 경우
        print(response.data['data']);
        return FarmclubMineDetail.fromJson(response.data['data']);
      } else {
        // 응답이 실패한 경우
        throw "${response.statusCode}";
      }
    } on DioException catch (e) {
      // DioError 예외 처리
      print(e.message);
      throw "${e.message}";
    }
  }

  // 가입하지 않은 팜클럽 정보 조회
  Future<FarmclubDetail> getFarmclubDetail(int challengeId) async {
    try {
      print("challengeId  $challengeId");
      // API 호출
      Response response = await ApiClient().dio.get(
        "/api/farmclub/$challengeId",
      );

      // 응답 상태 코드 확인
      if (response.statusCode == 200) {
        // 성공적으로 응답받은 경우
        print(response.data['data']);
        return FarmclubDetail.fromJson(response.data['data']);
      } else {
        // 응답이 실패한 경우
        throw "${response.statusCode}";
      }
    } on DioException catch (e) {
      // DioError 예외 처리
      print(e.message);
      throw "${e.message}";
    }
  }

  // 팜클럽 참여 전 채소 조회
  Future<List<VeggieRegistration>> getVeggieRegistraion(
      String veggieInfoId) async {
    try {
      Response response = await ApiClient().dio.get(
        "/api/veggie/registration/$veggieInfoId",
      );

      if (response.statusCode == 200) {
        print(response.data["data"]);
        List<dynamic> dataList = response.data['data'];

        List<VeggieRegistration> veggieRegistraion =
        dataList.map((data) => VeggieRegistration.fromJson(data)).toList();

        print(veggieRegistraion);

        return veggieRegistraion;
      } else {
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  // 팜클럽 참여
  Future<int> postRegister({
    required String challengeId,
    required String veggieId,
  }) async {
    try {
      Map<String, dynamic> requestBody = {
        "challengeId": challengeId,
        "veggieId": veggieId,
      };

      Response response = await ApiClient().dio.post(
        "/api/farmclub/register",
        data: requestBody,
      );

      // 응답 상태 코드 확인
      if (response.statusCode == 200) {
        // 성공적으로 응답받은 경우
        print(response.data['data']);
        return response.data['registrationId'];
      } else {
        // 응답이 실패한 경우
        throw "${response.statusCode}";
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  Future<FarmclubMissionResponse> postFarmclubMission({
    required int registrationId,
    required String content,
    required File image,
  }) async {
    try {
      // 요청 바디 데이터 생성
      FormData formData = FormData.fromMap({
        "registrationId": registrationId.toString(),
        "content": content,
        "image":
        await MultipartFile.fromFile(image.path, filename: "image.png"),
      });

      Response response = await ApiClient().dio.post(
        "/api/farmclub/mission",
        data: formData,
      );

      // 응답 상태 코드 확인
      if (response.statusCode == 200) {
        // 성공적으로 응답받은 경우
        print(response.data['data']);
        return FarmclubMissionResponse.fromJson(response.data);
      } else {
        // 응답이 실패한 경우
        throw "${response.statusCode}";
      }
    } on DioError catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  // 추천 조회
  Future<List<FarmclubInfoModel>> getFarmclubRecommendation() async {
    try {
      Response response =
      await ApiClient().dio.get("/api/farmclub/recommendation");

      if (response.statusCode == 200) {
        print(response.data["data"]);
        List<dynamic> dataList = response.data['data'];
        List<FarmclubInfoModel> farmclubRecommend =
        dataList.map((data) => FarmclubInfoModel.fromJson(data)).toList();

        print(farmclubRecommend);

        return farmclubRecommend;
      } else {
        // 오류 발생 시 빈 리스트 반환
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

// 미션 목록 조회
  Future<List<FarmclubMission>> getFarmclubMission(
      int challengeId,
      int stepNum,
      ) async {
    print(challengeId);
    print(stepNum);
    try {
      Response response = await ApiClient().dio.get(
        "/api/farmclub/mission/",
        queryParameters: {"challengeId": challengeId, 'stepNum': stepNum},
      );

      if (response.statusCode == 200) {
        print(response.data["data"]);
        List<dynamic> dataList = response.data['data'];
        List<FarmclubMission> farmclubMission =
        dataList.map((data) => FarmclubMission.fromJson(data)).toList();

        print(farmclubMission);

        return farmclubMission;
      } else {
        // 오류 발생 시 빈 리스트 반환
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  // 일기 목록 조회
  Future<List<FarmclubDiary>> getFarmclubDiary(
      int challengeId,
      ) async {
    print("일기 챌린지 요청 $challengeId");
    try {
      Response response = await ApiClient().dio.get(
        "/api/farmclub/diary/$challengeId",
      );

      if (response.statusCode == 200) {
        print(response.data["data"]);
        List<dynamic> dataList = response.data['data'];

        List<FarmclubDiary> farmclubDiary =
        dataList.map((data) => FarmclubDiary.fromJson(data)).toList();

        print(farmclubDiary);

        return farmclubDiary;
      } else {
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  // 내 미션 인증 글 조회
  Future<List<FarmclubMyMission>> getFarmclubMyMssion(
      int challengeId,
      ) async {
    try {
      Response response = await ApiClient().dio.get(
        "/api/farmclub/mission/$challengeId",
      );

      if (response.statusCode == 200) {
        print(response.data["data"]);
        List<dynamic> dataList = response.data['data'];

        List<FarmclubMyMission> farmclubMyMission =
        dataList.map((data) => FarmclubMyMission.fromJson(data)).toList();

        print(farmclubMyMission);

        return farmclubMyMission;
      } else {
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  // 팜클럽 개설
  Future<int> postFarmclub({
    required String myVeggieId,
    required String veggieInfoId,
    required String challengeName,
    required String maxUser,
    required String description,
  }) async {
    try {
      Map<String, dynamic> requestBody = {
        'myVeggieId': myVeggieId,
        'veggieInfoId': veggieInfoId,
        'challengeName': challengeName,
        'maxUser': maxUser,
        'description': description,
      };

      Response response = await ApiClient().dio.post(
        "/api/farmclub",
        data: requestBody,
      );

      if (response.statusCode == 200) {
        print(response.data['data']);
        return response.data['data']["challengeId"];
      } else {
        // 오류 발생 시 빈 리스트 반환
        throw "error";
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  // 팜클럽 종료
  Future<int> deleteFarmclub({
    required String challengeId,
    required bool isContinue,
  }) async {
    try {
      Map<String, dynamic> requestBody = {
        "challengeId": challengeId,
        "isContinue": isContinue,
      };

      Response response = await ApiClient().dio.delete(
        "/api/farmclub",
        data: requestBody,
      );

      // 응답 상태 코드 확인
      if (response.statusCode == 200) {
        // 성공적으로 응답받은 경우
        print(response.data['data']);
        return response.data['data'];
      } else {
        // 응답이 실패한 경우
        throw "${response.statusCode}";
      }
    } on DioException catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

  // 홈파밍 종료
  Future<FarmclubComplete> deleteFarmclubComplete({
    required String registrationId,
  }) async {
    try {
      Map<String, dynamic> requestBody = {
        "registrationId": registrationId,
      };

      Response response = await ApiClient().dio.delete(
        "/api/farmclub/complete",
        data: requestBody,
      );

      // 응답 상태 코드 확인
      if (response.statusCode == 200) {
        // 성공적으로 응답받은 경우
        print(response.data['data']);
        return FarmclubComplete.fromJson(response.data);
      } else {
        // 응답이 실패한 경우
        throw "${response.statusCode}";
      }
    } on DioError catch (e) {
      print(e.message);
      throw "${e.message}";
    }
  }

// 홈파밍 종료
}

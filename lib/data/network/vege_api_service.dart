import 'package:dio/dio.dart';

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../model/all_vege_infor_list.dart';
import '../../model/current_mission_list.dart';
import '../../model/my_vege_list.dart';
import '../../model/my_vege_routine_list.dart';
import 'base_api_services.dart';


const storage = FlutterSecureStorage();

class VegeApiService {
  Future<Map<String, dynamic>> fetchData() async {
    Dio dio = Dio();
    var url = '';

    try {
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data; // Dio automatically parses JSON data
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }


  static FutureOr<AllVegeInforList?> getAllVegeInforList() async {
    try {

      Response response = await ApiClient().dio.get('/api/crop');

      if (response.data["data"] != null) {

        final allVegeInforData = AllVegeInforList.fromJson(response.data["data"]);

        print(allVegeInforData);

        return allVegeInforData;
      }

    } on DioException catch (e) {
      print(e.message);
      print("전체 채소 조회 실패");

    }
    return null;
  }


  static FutureOr<void> enrollVege(
      String selectedDateData,
      String selectedVeggieIdData,
      String selectedVeggieColorImageUrlData,
      String nicknameValueData,
      String vegeNameData
      ) async {
    try {

      Map<String, dynamic> requestBody = {
        'nickname': nicknameValueData,
        'veggieInfoId': selectedVeggieIdData,
        'veggieImage': selectedVeggieColorImageUrlData,
        'birth': selectedDateData,
        "veggieName":vegeNameData
      };

      Response response = await ApiClient().dio.post('/api/veggie',data: requestBody);

      if(response.statusCode == 200){
        print("채소 등록 완료");
        return;
      }

    } on DioException catch (e) {
      print(e.message);
      print("채소 등록 실패");

    }
    return null;
  }







}


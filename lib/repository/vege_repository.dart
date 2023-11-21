

import '../data/network/vege_api_service.dart';

class VegeRepository {

  static Future<void> enrollVegeApi(
      String selectedDateData,
      String selectedVeggieIdData,
      String selectedVeggieColorImageUrlData,
      String nicknameValueData,
      String vegeNameData
      ) async {

      final response = await VegeApiService.enrollVegeApi(
          selectedDateData,
          selectedVeggieIdData,
          selectedVeggieColorImageUrlData,
          nicknameValueData,
          vegeNameData
      );

      return response;

      // // 선택된 데이터 수집
      // DateTime selectedDateData = selectedDate.value;
      // String selectedVeggieIdData = selectedVeggieId.value;
      // String selectedVeggieColorImageUrlData = selectedVeggieColorImageUrl.value;
      // String nicknameValueData = nicknameValue.value;
      //
      // // API 호출을 위한 데이터를 포함한 객체 생성
      // var requestData = {
      //   'selectedDate': selectedDateData,
      //   'selectedVeggieId': selectedVeggieIdData,
      //   'selectedVeggieColorImageUrl': selectedVeggieColorImageUrlData,
      //   'nicknameValue': nicknameValueData,
      // };

      // 여기에서 API 호출을 수행하고 응답을 처리
      // 예를 들어, FarmclubApiService의 적절한 메서드를 호출하여 데이터 전송
      // await FarmclubApiService().sendData(requestData);



  }



}
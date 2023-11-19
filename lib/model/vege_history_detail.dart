


import 'package:mojacknong_android/model/vege_history_dto.dart';

class VegeHistoryDetail {

  final List<VegeHistoryDto> diaryPostList;
  final Map<String, dynamic> farmResult;


  VegeHistoryDetail({
    List<VegeHistoryDto>? diaryPostList,
    Map<String, dynamic>? farmResult,
  })  : diaryPostList = diaryPostList ?? [],
        farmResult = farmResult ?? {}; // farmResult를 초기화

  factory VegeHistoryDetail.fromJson(Map<String, dynamic> json) {
    return VegeHistoryDetail(

      diaryPostList: (json['diaryPosts'] != null)
          ? List<VegeHistoryDto>.from(
        json['diaryPosts'].map(
              (x) => VegeHistoryDto.fromJson(x),
        ),
      ) : [],
      farmResult: json['farmResult'] ?? {},

    );
  }
}
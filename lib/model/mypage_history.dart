


import 'package:mojacknong_android/model/history_detail.dart';

class MypageHistory {
  final String historyId;
  final List<HistoryDetail> veggieHistoryDetailList;
  final List<HistoryDetail> farmClubHistoryDetailList;


  MypageHistory({
    required this.historyId,
    List<HistoryDetail>? veggieHistoryDetailList,
    List<HistoryDetail>? farmClubHistoryDetailList

  }): veggieHistoryDetailList = veggieHistoryDetailList ?? [],
      farmClubHistoryDetailList = farmClubHistoryDetailList ?? [] ;

  factory MypageHistory.fromJson(Map<String, dynamic> json) {
    return MypageHistory(
      historyId: json['historyId'],
      veggieHistoryDetailList: (json['veggieHistoryDetails'] != null)
          ? List<HistoryDetail>.from(
        json['veggieHistoryDetails'].map(
              (x) => HistoryDetail.fromJson(x),
        ),
      )
          : [],
      farmClubHistoryDetailList: (json['farmClubHistoryDetails'] != null)
          ? List<HistoryDetail>.from(
        json['farmClubHistoryDetails'].map(
              (x) => HistoryDetail.fromJson(x),
        ),
      )
          : [],
    );
  }
}
import 'farm_club_history_dto.dart';

class FarmClubHistoryDetail {
  final List<FarmClubHistoryDto> farmClubHistoryList;

  FarmClubHistoryDetail({
    required this.farmClubHistoryList,
  });

  factory FarmClubHistoryDetail.fromJson(Map<String, dynamic> json) {
    return FarmClubHistoryDetail(
      farmClubHistoryList: (json['missionPosts'] != null)
          ? List<FarmClubHistoryDto>.from(
        json['missionPosts'].map(
              (x) => FarmClubHistoryDto.fromJson(x),
        ),
      )
          : [],
    );
  }
}
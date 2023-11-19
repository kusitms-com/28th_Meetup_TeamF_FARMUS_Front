

class FarmClubHistoryDto {
  final int? stepNum;
  final String? stepName;
  final String? postImage;
  final String? content;
  final String? dateTime;
  final int? likeNum;

  FarmClubHistoryDto({
    required this.stepNum,
    required this.stepName,
    required this.postImage,
    required this.content,
    required this.dateTime,
    required this.likeNum

  });

  factory FarmClubHistoryDto.fromJson(Map<String, dynamic> json) {
    return FarmClubHistoryDto(
      stepNum: json['stepNum'],
      stepName: json['stepName'],
      postImage: json['postImage'],
      content: json['content'],
      dateTime: json['dateTime'],
      likeNum: json['likeNum'],


    );
  }
}
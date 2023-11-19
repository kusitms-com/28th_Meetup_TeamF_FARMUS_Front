
class VegeHistoryDto {

  final String? postImage;
  final String? content;
  final String? dateTime;

  VegeHistoryDto({

    required this.postImage,
    required this.content,
    required this.dateTime

  });

  factory VegeHistoryDto.fromJson(Map<String, dynamic> json) {
    return VegeHistoryDto(
      postImage: json['postImage'],
      content: json['content'],
      dateTime: json['dateTime'],

    );
  }
}
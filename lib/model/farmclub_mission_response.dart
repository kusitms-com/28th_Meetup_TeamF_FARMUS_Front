class FarmclubMissionResponse {
  final int code;
  final String message;
  final FarmclubMissionData data;

  FarmclubMissionResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory FarmclubMissionResponse.fromJson(Map<String, dynamic> json) {
    return FarmclubMissionResponse(
      code: json['code'],
      message: json['message'],
      data: FarmclubMissionData.fromJson(json['data']),
    );
  }
}

class FarmclubMissionData {
  final int registrationId;
  final String challengeName;
  final int step;
  final String image;
  final bool isEnd;

  FarmclubMissionData({
    required this.registrationId,
    required this.challengeName,
    required this.step,
    required this.image,
    required this.isEnd,
  });

  factory FarmclubMissionData.fromJson(Map<String, dynamic> json) {
    return FarmclubMissionData(
      registrationId: json['registrationId'],
      challengeName: json['challengeName'],
      step: json['step'],
      image: json['image'],
      isEnd: json['isEnd'],
    );
  }
}

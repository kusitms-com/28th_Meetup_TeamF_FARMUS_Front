class FarmusUser {
  String? refreshToken;
  String? accessToken;
  String? nickName;
  bool? early;
  String? motivation;
  int? time;
  String? skill;
  int? dday;
  dynamic?  userImageUrl;

  FarmusUser({
    required this.refreshToken,
    required this.accessToken,
    this.nickName,
    this.early,
    this.motivation,
    this.time,
    this.skill,
    this.dday,
    this.userImageUrl
  });

  factory FarmusUser.fromJson(Map<String, dynamic> json) {
    return FarmusUser(
        refreshToken: json["refreshToken"],
        accessToken: json["accessToken"],
        nickName: json['nickName'],
        early: json['early'],
        motivation: json['motivation'],
        time: json['time'],
        skill: json["skill"],
        dday: json["dday"],
        userImageUrl: json['userImageUrl']
    );
  }
}

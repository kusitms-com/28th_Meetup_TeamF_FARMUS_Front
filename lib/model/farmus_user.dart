class FarmusUser {
  String? nickName;
  String refreshToken;
  String accessToken;
  bool? early;

  FarmusUser({
    this.nickName,
    required this.refreshToken,
    required this.accessToken,
    this.early,
  });

  factory FarmusUser.fromJson(Map<String, dynamic> json) {
    return FarmusUser(
      nickName: json['nickName'],
      refreshToken: json["refreshToken"],
      accessToken: json["accessToken"],
      early: json['early'],
    );
  }
}

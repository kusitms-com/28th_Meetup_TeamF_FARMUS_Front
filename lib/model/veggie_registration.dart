class VeggieRegistration {
  final int veggieId;
  final String veggieName;
  final String veggieNickname;

  VeggieRegistration({
    required this.veggieId,
    required this.veggieName,
    required this.veggieNickname,
  });

  factory VeggieRegistration.fromJson(Map<String, dynamic> json) {
    return VeggieRegistration(
      veggieId: json['veggieId'],
      veggieName: json['veggieName'],
      veggieNickname: json['veggieNickname'],
    );
  }
}

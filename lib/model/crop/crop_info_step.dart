class CropInfoStep {
  final String stepName;
  final String tip;

  CropInfoStep({
    required this.stepName,
    required this.tip,
  });

  factory CropInfoStep.fromJson(Map<String, dynamic> json) {
    return CropInfoStep(
      stepName: json['stepName'] as String? ?? '',
      tip: json['tip'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stepName': stepName,
      'tip': tip,
    };
  }
}

class WholeHint {
  final int num;
  final String content;
  final List<String> tips;

  WholeHint({
    required this.num,
    required this.content,
    required this.tips,
  });

  factory WholeHint.fromJson(Map<String, dynamic> json) {
    return WholeHint(
      num: json['num'] ?? 0,
      content: json['content'] ?? '',
      tips: (json['tips'] as List<dynamic>?)
          ?.map((tip) => tip.toString())
          .toList() ??
          [],
    );
  }
}

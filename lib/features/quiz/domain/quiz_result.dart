class QuizResult {
  final String id;
  final String subjectId;
  final String subjectName;
  final String chapterTitle;
  final int score;
  final int total;
  final DateTime completedAt;

  const QuizResult({
    required this.id,
    required this.subjectId,
    required this.subjectName,
    required this.chapterTitle,
    required this.score,
    required this.total,
    required this.completedAt,
  });

  double get percentage => total == 0 ? 0 : (score / total) * 100;

  bool get passed => percentage >= 60;

  factory QuizResult.fromMap(Map<String, dynamic> map) {
    return QuizResult(
      id: map['id'] as String,
      subjectId: map['subjectId'] as String,
      subjectName: map['subjectName'] as String,
      chapterTitle: map['chapterTitle'] as String,
      score: map['score'] as int,
      total: map['total'] as int,
      completedAt: DateTime.parse(map['completedAt'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'chapterTitle': chapterTitle,
      'score': score,
      'total': total,
      'completedAt': completedAt.toIso8601String(),
    };
  }
}

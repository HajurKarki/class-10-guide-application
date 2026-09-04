class Chapter {
  final String id;
  final String subjectId;
  final int chapterNumber;
  final String title;
  final String description;

  const Chapter({
    required this.id,
    required this.subjectId,
    required this.chapterNumber,
    required this.title,
    required this.description,
  });

  factory Chapter.fromMap(Map<String, dynamic> map, String id) {
    return Chapter(
      id: id,
      subjectId: map['subjectId'] ?? '',
      chapterNumber: map['chapterNumber'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subjectId': subjectId,
      'chapterNumber': chapterNumber,
      'title': title,
      'description': description,
    };
  }
}

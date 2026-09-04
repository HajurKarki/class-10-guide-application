class Subject {
  final String id;
  final String name;
  final String description;
  final String icon;

  const Subject({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
  });

  factory Subject.fromMap(Map<String, dynamic> map, String id) {
    return Subject(
      id: id,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      icon: map['icon'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'icon': icon,
    };
  }
}

class UserProfile {
  final String name;
  final String? photoPath;

  const UserProfile({required this.name, this.photoPath});

  factory UserProfile.empty() => const UserProfile(name: '');

  UserProfile copyWith({String? name, String? photoPath}) {
    return UserProfile(
      name: name ?? this.name,
      photoPath: photoPath ?? this.photoPath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoPath': photoPath,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      name: map['name'] as String? ?? '',
      photoPath: map['photoPath'] as String?,
    );
  }
}

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/quiz_result.dart';

/// Saves quiz results on the device. Later you can sync these to Firebase.
class QuizResultStorage {
  static const _key = 'quiz_results';

  Future<void> saveResult(QuizResult result) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = await getResults();
    existing.insert(0, result);

    final encoded = existing.map((r) => jsonEncode(r.toMap())).toList();
    await prefs.setStringList(_key, encoded);
  }

  Future<List<QuizResult>> getResults() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key) ?? [];

    return raw
        .map((item) => QuizResult.fromMap(jsonDecode(item) as Map<String, dynamic>))
        .toList();
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

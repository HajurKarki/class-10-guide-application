import '../../subjects/domain/chapter_content_model.dart';
import 'quiz_questions_bank.dart';

class QuizRepository {
  String chapterId(String subjectId, String chapterTitle) {
    final slug = chapterTitle.toLowerCase().replaceAll(' ', '_');
    return '${subjectId}_$slug';
  }

  bool isQuizAvailable(String subjectId, String chapterTitle) {
    return questionCount(subjectId, chapterTitle) > 0;
  }

  int questionCount(String subjectId, String chapterTitle) {
    final id = chapterId(subjectId, chapterTitle);
    return QuizQuestionsBank.questionCount(id, chapterTitle);
  }

  Future<List<MCQItem>> getQuestions(
    String subjectId,
    String chapterTitle,
  ) async {
    final id = chapterId(subjectId, chapterTitle);
    return QuizQuestionsBank.getQuestions(id, chapterTitle);
  }
}

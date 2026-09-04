import 'package:flutter/material.dart';

import '../../../app/router/route_names.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/constants/subject_constants.dart';
import '../data/quiz_repository.dart';
import 'widgets/quiz_chapter_card.dart';

class QuizChapterListScreen extends StatelessWidget {
  final String subjectId;
  final String subjectName;

  const QuizChapterListScreen({
    super.key,
    required this.subjectId,
    required this.subjectName,
  });

  void _startQuiz(BuildContext context, String chapterTitle) {
    Navigator.pushNamed(
      context,
      RouteNames.quiz,
      arguments: {
        'subjectId': subjectId,
        'subjectName': subjectName,
        'chapterTitle': chapterTitle,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final chapters = SubjectConstants.chapters[subjectId] ?? [];
    final repository = QuizRepository();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.borderBlue),
                      ),
                      child: const Icon(Icons.arrow_back, size: 20, color: AppColors.textDark),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      subjectName,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                'Select a chapter to start the quiz',
                style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: chapters.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final chapter = chapters[index];
                    final count = repository.questionCount(subjectId, chapter);

                    return QuizChapterCard(
                      chapterNumber: index + 1,
                      chapterTitle: chapter,
                      questionCount: count,
                      onTap: () => _startQuiz(context, chapter),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

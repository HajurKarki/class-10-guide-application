import 'package:flutter/material.dart';

import '../../../app/router/route_names.dart';
import '../../../app/theme/app_colors.dart';
import '../../subjects/domain/chapter_content_model.dart';
import '../domain/quiz_result.dart';
import 'widgets/quiz_score_card.dart';

class QuizResultScreen extends StatelessWidget {
  final QuizResult result;
  final List<MCQItem> questions;
  final List<int?> selectedAnswers;

  const QuizResultScreen({
    super.key,
    required this.result,
    required this.questions,
    required this.selectedAnswers,
  });

  List<_ReviewItem> get _wrongAnswers {
    final items = <_ReviewItem>[];

    for (var i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] != questions[i].correctIndex) {
        items.add(
          _ReviewItem(
            question: questions[i].question,
            yourAnswer: selectedAnswers[i] != null
                ? questions[i].options[selectedAnswers[i]!]
                : 'Not answered',
            correctAnswer: questions[i].options[questions[i].correctIndex],
            explanation: questions[i].explanation,
          ),
        );
      }
    }

    return items;
  }

  void _retakeQuiz(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      RouteNames.quiz,
      arguments: {
        'subjectId': result.subjectId,
        'subjectName': result.subjectName,
        'chapterTitle': result.chapterTitle,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final wrongAnswers = _wrongAnswers;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Quiz Result'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textDark,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuizScoreCard(result: result),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Result saved on this device. Profile sync will come later.',
                  style: TextStyle(
                    color: AppColors.deepBlue,
                    height: 1.4,
                  ),
                ),
              ),
              if (wrongAnswers.isNotEmpty) ...[
                const SizedBox(height: 28),
                const Text(
                  'Review mistakes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 12),
                ...wrongAnswers.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ReviewCard(item: item),
                  ),
                ),
              ] else ...[
                const SizedBox(height: 28),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.cardWhite,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.borderBlue),
                  ),
                  child: const Text(
                    'Perfect score! You got every question right.',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textDark,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => _retakeQuiz(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Retake Quiz',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteNames.home,
                      (route) => false,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primaryBlue,
                    side: const BorderSide(color: AppColors.primaryBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Go to Home',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReviewItem {
  final String question;
  final String yourAnswer;
  final String correctAnswer;
  final String explanation;

  const _ReviewItem({
    required this.question,
    required this.yourAnswer,
    required this.correctAnswer,
    required this.explanation,
  });
}

class _ReviewCard extends StatelessWidget {
  final _ReviewItem item;

  const _ReviewCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderBlue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.question,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Your answer: ${item.yourAnswer}',
            style: const TextStyle(color: AppColors.error),
          ),
          const SizedBox(height: 4),
          Text(
            'Correct answer: ${item.correctAnswer}',
            style: const TextStyle(color: AppColors.success),
          ),
          if (item.explanation.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              item.explanation,
              style: const TextStyle(
                color: AppColors.textGrey,
                height: 1.4,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../domain/quiz_result.dart';

class QuizScoreCard extends StatelessWidget {
  final QuizResult result;

  const QuizScoreCard({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final passed = result.passed;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: passed
              ? [const Color(0xFF22C55E), const Color(0xFF16A34A)]
              : [const Color(0xFF38BDF8), AppColors.primaryBlue, AppColors.indigo],
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Icon(
            passed ? Icons.emoji_events : Icons.school,
            color: Colors.white,
            size: 48,
          ),
          const SizedBox(height: 12),
          Text(
            passed ? 'Great job!' : 'Keep practicing!',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            result.chapterTitle,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '${result.score}/${result.total}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${result.percentage.round()}% correct',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class ProfileScoreCard extends StatelessWidget {
  final int completedQuizzes;
  final double averageScore;

  const ProfileScoreCard({
    super.key,
    required this.completedQuizzes,
    required this.averageScore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderBlue),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _StatItem(
              label: 'Quizzes completed',
              value: '$completedQuizzes',
              valueColor: AppColors.textDark,
              align: CrossAxisAlignment.start,
            ),
          ),
          Container(
            width: 1,
            height: 48,
            color: AppColors.borderBlue,
          ),
          Expanded(
            child: _StatItem(
              label: 'Average score',
              value: '${averageScore.toStringAsFixed(1)}%',
              valueColor: AppColors.primaryBlue,
              align: CrossAxisAlignment.end,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;
  final CrossAxisAlignment align;

  const _StatItem({
    required this.label,
    required this.value,
    required this.valueColor,
    required this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textGrey,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

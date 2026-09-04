import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class QuizChapterCard extends StatelessWidget {
  final int chapterNumber;
  final String chapterTitle;
  final int questionCount;
  final VoidCallback onTap;

  const QuizChapterCard({
    super.key,
    required this.chapterNumber,
    required this.chapterTitle,
    required this.questionCount,
    required this.onTap,
  });

  bool get isAvailable => questionCount > 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cardWhite,
      borderRadius: BorderRadius.circular(20),
      elevation: 2,
      shadowColor: AppColors.primaryBlue.withValues(alpha: 0.08),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Opacity(
          opacity: isAvailable ? 1 : 0.65,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: isAvailable ? AppColors.lightBlue : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    isAvailable ? Icons.quiz : Icons.lock_clock,
                    color: isAvailable ? AppColors.primaryBlue : AppColors.textGrey,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chapter $chapterNumber',
                        style: const TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        chapterTitle,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        isAvailable
                            ? '$questionCount practice questions'
                            : 'Coming soon',
                        style: TextStyle(
                          color: isAvailable ? AppColors.success : AppColors.textGrey,
                          fontSize: 12,
                          fontWeight: isAvailable ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  isAvailable ? Icons.arrow_forward_ios : Icons.schedule,
                  color: isAvailable ? AppColors.primaryBlue : AppColors.textGrey,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class ScienceChapterBase extends StatelessWidget {
  final String chapterId;
  final String chapterTitle;
  final Widget? child;

  const ScienceChapterBase({
    super.key,
    required this.chapterId,
    required this.chapterTitle,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          chapterTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.textDark,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: child ??
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.borderBlue),
                      ),
                      child: const Icon(
                        Icons.edit_note,
                        size: 48,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      chapterId,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepBlue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Blank chapter page. Paste your hardcoded science note here.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}

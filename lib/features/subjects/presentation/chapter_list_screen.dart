import 'package:flutter/material.dart';

import '../../../app/router/route_names.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/constants/subject_constants.dart';
import 'science_chapters/science_scientific_learning_page.dart';
import 'widgets/chapter_card.dart';

class ChapterListScreen extends StatelessWidget {
  final String subjectId;
  final String subjectName;

  const ChapterListScreen({
    super.key,
    required this.subjectId,
    required this.subjectName,
  });

  @override
  Widget build(BuildContext context) {
    final chapters = SubjectConstants.chapters[subjectId] ?? [];

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

              Text(
                'Select a chapter to open notes',
                style: TextStyle(
                  color: Colors.grey.shade600,
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

                    return ChapterCard(
                      chapterNumber: index + 1,
                      chapterTitle: chapter,
                      onTap: () {
                        final chapterSlug = chapter.toLowerCase().replaceAll(' ', '_');
                        final chapterId = '${subjectId}_$chapterSlug';

                        if (chapterId == 'science_scientific_learning') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ScienceScientificLearningPage(),
                            ),
                          );
                          return;
                        }

                        Navigator.pushNamed(
                          context,
                          RouteNames.chapterContent,
                          arguments: {
                            'chapterId': chapterId,
                            'chapterTitle': chapter,
                          },
                        );
                      },
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

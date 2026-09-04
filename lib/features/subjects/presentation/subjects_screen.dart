import 'package:flutter/material.dart';

import '../../../app/router/route_names.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/constants/subject_constants.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import 'widgets/subject_card.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  void _openChapters(
    BuildContext context,
    String subjectId,
    String subjectName,
  ) {
    Navigator.pushNamed(
      context,
      RouteNames.chapters,
      arguments: {
        'subjectId': subjectId,
        'subjectName': subjectName,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final subjects = SubjectConstants.subjects;

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Subjects',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Choose one subject first',
                style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 24),

              Expanded(
                child: ListView.separated(
                  itemCount: subjects.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final subject = subjects[index];

                    return SubjectCard(
                      icon: subject['icon']!,
                      title: subject['name']!,
                      description: subject['description']!,
                      onTap: () {
                        _openChapters(
                          context,
                          subject['id']!,
                          subject['name']!,
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
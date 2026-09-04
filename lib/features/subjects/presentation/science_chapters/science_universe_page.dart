import 'package:flutter/material.dart';

import 'science_chapter_base.dart';

class ScienceUniversePage extends StatelessWidget {
  const ScienceUniversePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScienceChapterBase(
      chapterId: 'science_universe',
      chapterTitle: 'Universe',
    );
  }
}

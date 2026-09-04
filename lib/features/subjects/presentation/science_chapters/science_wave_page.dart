import 'package:flutter/material.dart';

import 'science_chapter_base.dart';

class ScienceWavePage extends StatelessWidget {
  const ScienceWavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScienceChapterBase(
      chapterId: 'science_wave',
      chapterTitle: 'Wave',
    );
  }
}

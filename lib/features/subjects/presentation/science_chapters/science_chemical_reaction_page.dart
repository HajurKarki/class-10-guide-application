import 'package:flutter/material.dart';

import 'science_chapter_base.dart';

class ScienceChemicalReactionPage extends StatelessWidget {
  const ScienceChemicalReactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScienceChapterBase(
      chapterId: 'science_chemical_reaction',
      chapterTitle: 'Chemical Reaction',
    );
  }
}

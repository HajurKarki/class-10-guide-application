class ChapterContent {
  final String chapterId;
  final String title;
  final String introduction;
  final List<NoteSection> notes;
  final List<FormulaItem> formulas;
  final List<SolvedExample> solvedExamples;
  final List<QAItem> questionsAndAnswers;
  final List<MCQItem> mcqs;
  final List<ExerciseSolution> exerciseSolutions;

  const ChapterContent({
    required this.chapterId,
    required this.title,
    required this.introduction,
    required this.notes,
    required this.formulas,
    required this.solvedExamples,
    required this.questionsAndAnswers,
    required this.mcqs,
    required this.exerciseSolutions,
  });

  factory ChapterContent.fromMap(Map<String, dynamic> map, String chapterId) {
    return ChapterContent(
      chapterId: chapterId,
      title: map['title'] ?? '',
      introduction: map['introduction'] ?? '',
      notes: (map['notes'] as List? ?? [])
          .map((e) => NoteSection.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
      formulas: (map['formulas'] as List? ?? [])
          .map((e) => FormulaItem.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
      solvedExamples: (map['solvedExamples'] as List? ?? [])
          .map((e) => SolvedExample.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
      questionsAndAnswers: (map['questionsAndAnswers'] as List? ?? [])
          .map((e) => QAItem.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
      mcqs: (map['mcqs'] as List? ?? [])
          .map((e) => MCQItem.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
      exerciseSolutions: (map['exerciseSolutions'] as List? ?? [])
          .map((e) => ExerciseSolution.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'introduction': introduction,
      'notes': notes.map((e) => e.toMap()).toList(),
      'formulas': formulas.map((e) => e.toMap()).toList(),
      'solvedExamples': solvedExamples.map((e) => e.toMap()).toList(),
      'questionsAndAnswers': questionsAndAnswers.map((e) => e.toMap()).toList(),
      'mcqs': mcqs.map((e) => e.toMap()).toList(),
      'exerciseSolutions': exerciseSolutions.map((e) => e.toMap()).toList(),
    };
  }
}

class NoteSection {
  final String title;
  final String content;
  final String? diagramType; // "venn_union", "venn_intersection", etc.

  const NoteSection({
    required this.title,
    required this.content,
    this.diagramType,
  });

  factory NoteSection.fromMap(Map<String, dynamic> map) {
    return NoteSection(
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      diagramType: map['diagramType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      if (diagramType != null) 'diagramType': diagramType,
    };
  }
}

class FormulaItem {
  final String name;
  final String formula;
  final String description;

  const FormulaItem({
    required this.name,
    required this.formula,
    required this.description,
  });

  factory FormulaItem.fromMap(Map<String, dynamic> map) {
    return FormulaItem(
      name: map['name'] ?? '',
      formula: map['formula'] ?? '',
      description: map['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'formula': formula,
      'description': description,
    };
  }
}

class SolvedExample {
  final String question;
  final List<String> steps;
  final String finalAnswer;

  const SolvedExample({
    required this.question,
    required this.steps,
    required this.finalAnswer,
  });

  factory SolvedExample.fromMap(Map<String, dynamic> map) {
    return SolvedExample(
      question: map['question'] ?? '',
      steps: List<String>.from(map['steps'] ?? []),
      finalAnswer: map['finalAnswer'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'steps': steps,
      'finalAnswer': finalAnswer,
    };
  }
}

class QAItem {
  final String question;
  final String answer;

  const QAItem({
    required this.question,
    required this.answer,
  });

  factory QAItem.fromMap(Map<String, dynamic> map) {
    return QAItem(
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer': answer,
    };
  }
}

class MCQItem {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const MCQItem({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });

  factory MCQItem.fromMap(Map<String, dynamic> map) {
    return MCQItem(
      question: map['question'] ?? '',
      options: List<String>.from(map['options'] ?? []),
      correctIndex: map['correctIndex'] ?? 0,
      explanation: map['explanation'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'options': options,
      'correctIndex': correctIndex,
      'explanation': explanation,
    };
  }
}

class ExerciseSolution {
  final String exerciseNumber;
  final String question;
  final String solution;

  const ExerciseSolution({
    required this.exerciseNumber,
    required this.question,
    required this.solution,
  });

  factory ExerciseSolution.fromMap(Map<String, dynamic> map) {
    return ExerciseSolution(
      exerciseNumber: map['exerciseNumber'] ?? '',
      question: map['question'] ?? '',
      solution: map['solution'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'exerciseNumber': exerciseNumber,
      'question': question,
      'solution': solution,
    };
  }
}

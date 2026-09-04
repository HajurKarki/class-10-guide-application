import 'package:flutter/material.dart';

import '../../../app/router/route_names.dart';
import '../../../app/theme/app_colors.dart';
import '../../subjects/domain/chapter_content_model.dart';
import '../data/quiz_repository.dart';
import '../data/quiz_result_storage.dart';
import '../domain/quiz_result.dart';
import 'widgets/quiz_option_tile.dart';
import 'widgets/quiz_progress_bar.dart';

class QuizScreen extends StatefulWidget {
  final String subjectId;
  final String subjectName;
  final String chapterTitle;

  const QuizScreen({
    super.key,
    required this.subjectId,
    required this.subjectName,
    required this.chapterTitle,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _repository = QuizRepository();
  final _storage = QuizResultStorage();

  List<MCQItem> _questions = [];
  final List<int?> _selectedAnswers = [];
  int _currentIndex = 0;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final questions = await _repository.getQuestions(
        widget.subjectId,
        widget.chapterTitle,
      );

      if (!mounted) return;

      if (questions.isEmpty) {
        setState(() {
          _loading = false;
          _error = 'No questions found for this chapter yet.';
        });
        return;
      }

      setState(() {
        _questions = questions;
        _selectedAnswers.addAll(List.filled(questions.length, null));
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'Could not load quiz. Please try again.';
      });
    }
  }

  int? get _selectedIndex => _selectedAnswers[_currentIndex];

  bool get _isLastQuestion => _currentIndex == _questions.length - 1;

  void _selectOption(int index) {
    setState(() {
      _selectedAnswers[_currentIndex] = index;
    });
  }

  void _goNext() {
    if (_selectedIndex == null) return;

    if (_isLastQuestion) {
      _finishQuiz();
      return;
    }

    setState(() {
      _currentIndex++;
    });
  }

  Future<void> _finishQuiz() async {
    var score = 0;
    for (var i = 0; i < _questions.length; i++) {
      if (_selectedAnswers[i] == _questions[i].correctIndex) {
        score++;
      }
    }

    final result = QuizResult(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      subjectId: widget.subjectId,
      subjectName: widget.subjectName,
      chapterTitle: widget.chapterTitle,
      score: score,
      total: _questions.length,
      completedAt: DateTime.now(),
    );

    await _storage.saveResult(result);

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      RouteNames.quizResult,
      arguments: {
        'result': result,
        'questions': _questions,
        'selectedAnswers': _selectedAnswers,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.chapterTitle)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.chapterTitle)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              _error!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: AppColors.textGrey),
            ),
          ),
        ),
      );
    }

    final question = _questions[_currentIndex];
    const labels = ['A', 'B', 'C', 'D'];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chapterTitle),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textDark,
        elevation: 0,
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuizProgressBar(
                current: _currentIndex + 1,
                total: _questions.length,
              ),
              const SizedBox(height: 28),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.borderBlue),
                ),
                child: Text(
                  question.question,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: question.options.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final label = index < labels.length ? labels[index] : '${index + 1}';

                    return QuizOptionTile(
                      label: label,
                      text: question.options[index],
                      isSelected: _selectedIndex == index,
                      onTap: () => _selectOption(index),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _selectedIndex == null ? null : _goNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: AppColors.borderBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(
                    _isLastQuestion ? 'Submit Quiz' : 'Next Question',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

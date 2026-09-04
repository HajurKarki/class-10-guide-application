import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../data/chapter_repository.dart';
import '../domain/chapter_content_model.dart';

class ChapterContentScreen extends StatefulWidget {
  final String chapterId;
  final String chapterTitle;

  const ChapterContentScreen({
    super.key,
    required this.chapterId,
    required this.chapterTitle,
  });

  @override
  State<ChapterContentScreen> createState() => _ChapterContentScreenState();
}

class _ChapterContentScreenState extends State<ChapterContentScreen>
    with SingleTickerProviderStateMixin {
  final _repository = ChapterRepository();
  late TabController _tabController;

  ChapterContent? _content;
  bool _isLoading = true;
  String? _errorMessage;

  // State for interactive MCQs: map of {mcqIndex: selectedOptionIndex}
  final Map<int, int> _selectedMcqAnswers = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _loadChapterContent();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadChapterContent() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final content = await _repository.getChapterContent(widget.chapterId);
      if (!mounted) return;

      if (content == null) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Failed to load content for "${widget.chapterTitle}". It may be coming soon!';
        });
      } else {
        setState(() {
          _content = content;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _errorMessage = 'An error occurred while loading. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.chapterTitle,
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
        bottom: _isLoading || _errorMessage != null
            ? null
            : TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: AppColors.primaryBlue,
                indicatorWeight: 3,
                labelColor: AppColors.primaryBlue,
                unselectedLabelColor: AppColors.textGrey,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                tabs: const [
                  Tab(text: 'Notes'),
                  Tab(text: 'Mnemonics / Formulas'),
                  Tab(text: 'Examples'),
                  Tab(text: 'Q & A'),
                  Tab(text: 'MCQs'),
                  Tab(text: 'Exercises'),
                ],
              ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
            ),
            const SizedBox(height: 16),
            Text(
              'Loading ${widget.chapterTitle}...',
              style: const TextStyle(color: AppColors.textGrey, fontSize: 16),
            ),
          ],
        ),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.menu_book, size: 80, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                _errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textDark, fontSize: 16),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _loadChapterContent,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final content = _content!;

    return TabBarView(
      controller: _tabController,
      children: [
        _buildNotesTab(content),
        _buildFormulasTab(content),
        _buildExamplesTab(content),
        _buildQATab(content),
        _buildMCQTab(content),
        _buildExercisesTab(content),
      ],
    );
  }

  // --- 1. NOTES TAB ---
  Widget _buildNotesTab(ChapterContent content) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (content.introduction.trim().isNotEmpty) ...[
          Card(
            elevation: 0,
            color: AppColors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: AppColors.borderBlue),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.info_outline, color: AppColors.primaryBlue),
                      SizedBox(width: 8),
                      Text(
                        'Introduction',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.deepBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    content.introduction,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
        // Notes list
        if (content.notes.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Text('No notes available for this chapter.'),
            ),
          )
        else
          ...content.notes.map((note) => _buildNoteCard(note)),
      ],
    );
  }

  Widget _buildNoteCard(NoteSection note) {
    return Card(
      elevation: 1,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Text(
              note.content,
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 2. FORMULAS / MNEMONICS TAB ---
  Widget _buildFormulasTab(ChapterContent content) {
    if (content.formulas.isEmpty) {
      return const Center(
        child: Text('No formulas or mnemonics found for this chapter.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: content.formulas.length,
      itemBuilder: (context, index) {
        final formula = content.formulas[index];
        return Card(
          elevation: 0,
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.blue.shade100, width: 1.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.lightbulb_outline,
                        color: AppColors.primaryBlue,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        formula.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200, width: 1),
                  ),
                  child: Text(
                    formula.formula,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.indigo,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  formula.description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textGrey,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // --- 3. EXAMPLES TAB ---
  Widget _buildExamplesTab(ChapterContent content) {
    if (content.solvedExamples.isEmpty) {
      return const Center(
        child: Text('No solved examples available.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: content.solvedExamples.length,
      itemBuilder: (context, index) {
        final example = content.solvedExamples[index];
        return Card(
          elevation: 2,
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primaryBlue,
                      radius: 14,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        example.question,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Steps to solve:',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textGrey,
                  ),
                ),
                const SizedBox(height: 8),
                ...example.steps.map((step) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Expanded(
                          child: Text(
                            step,
                            style: const TextStyle(fontSize: 14, height: 1.4),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFDBEAFE)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Final Answer:',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        example.finalAnswer,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.deepBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // --- 4. QUESTIONS & ANSWERS TAB ---
  Widget _buildQATab(ChapterContent content) {
    if (content.questionsAndAnswers.isEmpty) {
      return const Center(
        child: Text('No Q&A items available.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: content.questionsAndAnswers.length,
      itemBuilder: (context, index) {
        final qa = content.questionsAndAnswers[index];
        return Card(
          elevation: 1,
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade100),
          ),
          child: ExpansionTile(
            title: Text(
              qa.question,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppColors.textDark,
              ),
            ),
            leading: const CircleAvatar(
              backgroundColor: AppColors.lightBlue,
              radius: 16,
              child: Icon(Icons.help_outline, color: AppColors.primaryBlue, size: 18),
            ),
            childrenPadding: const EdgeInsets.all(16).copyWith(top: 0),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            shape: const Border(), // Removes bottom border lines when expanded
            children: [
              const Divider(height: 1),
              const SizedBox(height: 10),
              Text(
                qa.answer,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // --- 5. MCQS (INTERACTIVE QUIZ) TAB ---
  Widget _buildMCQTab(ChapterContent content) {
    if (content.mcqs.isEmpty) {
      return const Center(
        child: Text('No MCQs available.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: content.mcqs.length,
      itemBuilder: (context, index) {
        final mcq = content.mcqs[index];
        final selectedIndex = _selectedMcqAnswers[index];
        final isAnswered = selectedIndex != null;

        return Card(
          elevation: 1,
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${index + 1}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textGrey,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  mcq.question,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 16),
                ...List.generate(mcq.options.length, (optIndex) {
                  final optionText = mcq.options[optIndex];
                  return _buildMcqOptionTile(
                    index,
                    optIndex,
                    optionText,
                    mcq.correctIndex,
                    selectedIndex,
                    isAnswered,
                  );
                }),
                if (isAnswered) ...[
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              selectedIndex == mcq.correctIndex
                                  ? Icons.check_circle
                                  : Icons.cancel,
                              color: selectedIndex == mcq.correctIndex
                                  ? AppColors.success
                                  : AppColors.error,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              selectedIndex == mcq.correctIndex
                                  ? 'Correct Answer!'
                                  : 'Incorrect. Try again!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedIndex == mcq.correctIndex
                                    ? AppColors.success
                                    : AppColors.error,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Explanation:\n${mcq.explanation}',
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.4,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _selectedMcqAnswers.remove(index);
                      });
                    },
                    icon: const Icon(Icons.refresh, size: 16),
                    label: const Text('Reset Question'),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primaryBlue,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMcqOptionTile(
    int qIndex,
    int optIndex,
    String optionText,
    int correctIndex,
    int? selectedIndex,
    bool isAnswered,
  ) {
    Color tileColor = Colors.white;
    Color borderCol = Colors.grey.shade200;
    IconData? trailingIcon;
    Color iconColor = Colors.transparent;

    if (isAnswered) {
      if (optIndex == correctIndex) {
        // Correct Option Highlight
        tileColor = const Color(0xFFECFDF5);
        borderCol = AppColors.success;
        trailingIcon = Icons.check_circle_outline;
        iconColor = AppColors.success;
      } else if (optIndex == selectedIndex) {
        // User selected this, but it is incorrect
        tileColor = const Color(0xFFFEF2F2);
        borderCol = AppColors.error;
        trailingIcon = Icons.highlight_off;
        iconColor = AppColors.error;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Material(
        color: tileColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: isAnswered
              ? null
              : () {
                  setState(() {
                    _selectedMcqAnswers[qIndex] = optIndex;
                  });
                },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderCol, width: 1.5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    optionText,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textDark,
                      fontWeight: selectedIndex == optIndex ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                if (trailingIcon != null)
                  Icon(trailingIcon, color: iconColor, size: 20)
                else if (!isAnswered)
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300, width: 1.5),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- 6. EXERCISES (CASE STUDIES) TAB ---
  Widget _buildExercisesTab(ChapterContent content) {
    if (content.exerciseSolutions.isEmpty) {
      return const Center(
        child: Text('No exercise solutions available.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: content.exerciseSolutions.length,
      itemBuilder: (context, index) {
        final solution = content.exerciseSolutions[index];
        return Card(
          elevation: 1,
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade100),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.indigo.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    solution.exerciseNumber,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.indigo,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  solution.question,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(height: 1),
                const SizedBox(height: 12),
                const Text(
                  'Solution / Explanation:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textGrey,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  solution.solution,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

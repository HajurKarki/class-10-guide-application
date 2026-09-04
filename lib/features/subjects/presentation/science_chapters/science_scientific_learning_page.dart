import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import 'science_chapter_base.dart';

class ScienceScientificLearningPage extends StatelessWidget {
  const ScienceScientificLearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScienceChapterBase(
      chapterId: 'science_scientific_learning',
      chapterTitle: 'Scientific Learning',
      child: _ChapterContent(),
    );
  }
}

// ---------------------------------------------------------------------------
// Content models
// ---------------------------------------------------------------------------

class _Mcq {
  final String question;
  final List<String> options;
  final int correctIndex;
  const _Mcq(this.question, this.options, this.correctIndex);
}

class _TrueFalse {
  final String statement;
  final bool answer;
  const _TrueFalse(this.statement, this.answer);
}

// ---------------------------------------------------------------------------
// Main content
// ---------------------------------------------------------------------------

class _ChapterContent extends StatelessWidget {
  const _ChapterContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ChapterInfoCard(),
        const SizedBox(height: 16),
        _SectionCard(
          title: 'Introduction',
          icon: Icons.info_outline,
          initiallyExpanded: true,
          child: const Text(
            'Scientific learning is a systematic approach to understanding '
            'the natural world through observation, questioning, '
            'experimentation, and analysis. This chapter covers scientific '
            'observation, controlled variables, and the steps of the '
            'scientific method — concepts that build the critical-thinking '
            'foundation for the rest of the syllabus.',
            style: TextStyle(fontSize: 14, height: 1.5, color: AppColors.textGrey),
          ),
        ),
        _SectionCard(
          title: '1. Scientific vs. Regular Observation',
          icon: Icons.visibility_outlined,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bullet('Systematic and planned, with a specific purpose'),
              _bullet('Uses instruments and standardized methods for accuracy'),
              _bullet('Recorded in an organized manner with precise details'),
              _bullet('Reproducible and verifiable by others'),
              _bullet('Free from personal bias'),
              const SizedBox(height: 12),
              _comparisonTable(
                headers: const ['Aspect', 'Scientific', 'Regular'],
                rows: const [
                  ['Purpose', 'Specific research aim', 'General awareness'],
                  ['Method', 'Systematic, standardized', 'Casual, random'],
                  ['Instruments', 'Often used', 'Only senses'],
                  ['Recording', 'Detailed, organized', 'Vague, informal'],
                  ['Reproducibility', 'Repeatable', 'Not necessarily'],
                  ['Precision', 'High', 'Low'],
                ],
              ),
            ],
          ),
        ),
        _SectionCard(
          title: '2. Types of Variables',
          icon: Icons.tune,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _definitionTile(
                'Independent Variable',
                'What the experimenter deliberately changes. The cause.',
                Icons.arrow_upward,
                Colors.blue,
              ),
              _definitionTile(
                'Dependent Variable',
                'What is measured as a result. The effect.',
                Icons.arrow_downward,
                Colors.green,
              ),
              _definitionTile(
                'Controlled Variable',
                'Kept constant to ensure fair testing.',
                Icons.lock_outline,
                Colors.orange,
              ),
              const SizedBox(height: 12),
              const Text(
                'Example — "Does temperature affect sugar dissolving?"',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
              const SizedBox(height: 8),
              _comparisonTable(
                headers: const ['Type', 'Example'],
                rows: const [
                  ['Independent', 'Water temperature (20°C, 40°C, 60°C)'],
                  ['Dependent', 'Time for sugar to dissolve'],
                  ['Controlled', 'Amount of sugar (10g each time)'],
                  ['Controlled', 'Volume of water (100mL each time)'],
                  ['Controlled', 'Type of container'],
                ],
              ),
            ],
          ),
        ),
        _SectionCard(
          title: '3. Why Controlled Variables Matter',
          icon: Icons.balance,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bullet('Ensures fair testing — identical conditions except one factor'),
              _bullet('Isolates the true cause-and-effect relationship'),
              _bullet('Increases reliability and reduces error'),
              _bullet('Enables valid conclusions and fair comparisons'),
              const SizedBox(height: 12),
              _scenarioBox(
                label: 'WITHOUT control',
                text: 'Different sugar amounts, different water, different '
                    'containers → cannot tell what caused the time change.',
                color: Colors.red,
                icon: Icons.close,
              ),
              const SizedBox(height: 8),
              _scenarioBox(
                label: 'WITH control',
                text: 'Same sugar, same water, same container, only '
                    'temperature varies → clear valid conclusion.',
                color: Colors.green,
                icon: Icons.check,
              ),
            ],
          ),
        ),
        _SectionCard(
          title: '4. Steps in Scientific Method',
          icon: Icons.list_alt,
          child: Column(
            children: const [
              _StepTile(1, 'Observation', 'Collect information using senses and instruments.'),
              _StepTile(2, 'Questioning', 'Form a research question from the observation.'),
              _StepTile(3, 'Hypothesis', 'Educated, testable, falsifiable guess ("If X, then Y").'),
              _StepTile(4, 'Experimentation', 'Design and run a controlled experiment.'),
              _StepTile(5, 'Data Collection & Analysis', 'Record, tabulate, graph, and analyze results.'),
              _StepTile(6, 'Conclusion', 'State whether the hypothesis was supported.'),
              _StepTile(7, 'Communication', 'Share and verify findings through peer review.'),
            ],
          ),
        ),
        _SectionCard(
          title: '5. Real-World Applications',
          icon: Icons.public,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bullet('Medicine — controlled clinical trials for new drugs'),
              _bullet('Agriculture — testing fertilizers under fixed soil/water/light'),
              _bullet('Environmental science — consistent sampling method and location'),
              _bullet('Technology — comparing materials under fixed conditions'),
            ],
          ),
        ),
        _SectionCard(
          title: 'Key Definitions',
          icon: Icons.menu_book,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _GlossaryRow('Scientific Observation', 'Systematic, purposeful examination using instruments, recorded accurately.'),
              _GlossaryRow('Variable', 'A factor or condition that can change or be changed.'),
              _GlossaryRow('Hypothesis', 'A testable, educated guess formed before experimentation.'),
              _GlossaryRow('Experiment', 'A controlled test to determine the effect of one variable on another.'),
              _GlossaryRow('Data', 'Information collected through observation/measurement.'),
              _GlossaryRow('Conclusion', 'The final determination after analyzing data vs. hypothesis.'),
              _GlossaryRow('Reliability', 'Consistency of results when repeated.'),
              _GlossaryRow('Validity', 'Whether the experiment measures what it claims to.'),
            ],
          ),
        ),
        _SectionCard(
          title: 'Memory Tricks',
          icon: Icons.psychology_outlined,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('IDVC — Independent, Dependent, Variables to control, Constants',
                  style: TextStyle(fontSize: 14, height: 1.6)),
              Text('OHEC — Observe, Hypothesize, Experiment, Conclude',
                  style: TextStyle(fontSize: 14, height: 1.6)),
              SizedBox(height: 8),
              Text(
                '"In a fair test, change ONLY ONE thing; keep EVERYTHING ELSE the same."',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  color: AppColors.deepBlue,
                ),
              ),
            ],
          ),
        ),
        _SectionCard(
          title: 'Common Mistakes',
          icon: Icons.warning_amber_outlined,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bullet('Confusing independent and dependent variables'),
              _bullet('Not controlling all relevant variables'),
              _bullet('Changing multiple variables at once'),
              _bullet('Assuming correlation = causation'),
              _bullet('Making vague, unverifiable observations'),
              _bullet('Not repeating experiments enough times'),
            ],
          ),
        ),
        _SectionCard(
          title: 'Exam Tips',
          icon: Icons.lightbulb_outline,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bullet('MCQs: watch for keywords like "controlled", "fair test", "isolated effect"'),
              _bullet('Short answers: give definition + example + explain WHY'),
              _bullet('Long answers: identify all variables, list 3-4 controlled ones with reasons'),
              _bullet('Avoid vague words like "better" or "good" — use specific measurements'),
            ],
          ),
        ),
        _SectionCard(
          title: 'Practice: Multiple Choice',
          icon: Icons.quiz_outlined,
          child: Column(
            children: _mcqs
                .asMap()
                .entries
                .map((e) => _McqTile(index: e.key + 1, mcq: e.value))
                .toList(),
          ),
        ),
        _SectionCard(
          title: 'Practice: True or False',
          icon: Icons.check_circle_outline,
          child: Column(
            children: _trueFalse
                .asMap()
                .entries
                .map((e) => _TrueFalseTile(index: e.key + 1, item: e.value))
                .toList(),
          ),
        ),
        _SectionCard(
          title: 'Short Answer — Model Answers',
          icon: Icons.short_text,
          child: Column(
            children: const [
              _QaTile(
                q: 'Explain the importance of controlled variables with an example.',
                a: 'Controlled variables ensure observed changes are due only to '
                    'the independent variable. Example: testing if temperature '
                    'affects sugar dissolving — keep sugar amount, water volume, '
                    'and container the same, vary only temperature, so any '
                    'difference in dissolving time is confidently due to '
                    'temperature.',
              ),
              _QaTile(
                q: 'Differentiate independent and dependent variables.',
                a: 'Independent = what the experimenter deliberately changes '
                    '(the cause). Dependent = what is measured as a result '
                    '(the effect). E.g., soil pH (independent) vs. plant height '
                    'in cm (dependent).',
              ),
              _QaTile(
                q: 'Why must an experiment be repeated multiple times?',
                a: 'A single trial can be skewed by chance or measurement error. '
                    'Repetition confirms consistency, allows averaging, and '
                    'increases confidence that results are reliable.',
              ),
            ],
          ),
        ),
        _SectionCard(
          title: 'Quick Revision Sheet',
          icon: Icons.bolt,
          child: _comparisonTable(
            headers: const ['Concept', 'Remember'],
            rows: const [
              ['Scientific Observation', '≠ casual observation; systematic + instruments'],
              ['Independent Variable', 'CAUSE — what you change'],
              ['Dependent Variable', 'EFFECT — what you measure'],
              ['Controlled Variable', 'Kept the SAME — isolates the effect'],
              ['Hypothesis', '"If..., then..." testable statement'],
              ['Fair Test', 'Only ONE variable changes'],
              ['Scientific Method', 'Observe → Question → Hypothesize → Experiment → Analyze → Conclude'],
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _bullet(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('•  ', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: Text(text, style: const TextStyle(fontSize: 14, height: 1.4)),
            ),
          ],
        ),
      );

  Widget _definitionTile(String title, String desc, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
                const SizedBox(height: 2),
                Text(desc, style: const TextStyle(fontSize: 13, color: AppColors.textGrey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _scenarioBox({
    required String label,
    required String text,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 13, height: 1.4, color: Colors.black87),
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: TextStyle(fontWeight: FontWeight.bold, color: color),
                  ),
                  TextSpan(text: text),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _comparisonTable({required List<String> headers, required List<List<String>> rows}) {
    return Table(
      border: TableBorder.all(color: AppColors.borderBlue, width: 1),
      columnWidths: const {0: FlexColumnWidth(1)},
      children: [
        TableRow(
          decoration: BoxDecoration(color: AppColors.lightBlue),
          children: headers
              .map((h) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(h, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ))
              .toList(),
        ),
        ...rows.map(
          (r) => TableRow(
            children: r
                .map((c) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(c, style: const TextStyle(fontSize: 12)),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Reusable widgets
// ---------------------------------------------------------------------------

class _ChapterInfoCard extends StatelessWidget {
  const _ChapterInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderBlue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.science_outlined, color: AppColors.primaryBlue),
              const SizedBox(width: 8),
              const Text(
                'Chapter Overview',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.deepBlue),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _InfoChip('Total Marks', '5'),
              _InfoChip('Difficulty', 'Low–Moderate'),
              _InfoChip('MCQ Chance', 'Very High'),
              _InfoChip('Frequency', 'Every year'),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  final String value;
  const _InfoChip(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderBlue),
      ),
      child: Text(
        '$label: $value',
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.deepBlue),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final bool initiallyExpanded;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderBlue),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          leading: Icon(icon, color: AppColors.primaryBlue),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textDark),
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [child],
        ),
      ),
    );
  }
}

class _StepTile extends StatelessWidget {
  final int number;
  final String title;
  final String desc;
  const _StepTile(this.number, this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.primaryBlue,
            child: Text('$number', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(desc, style: const TextStyle(fontSize: 13, color: AppColors.textGrey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GlossaryRow extends StatelessWidget {
  final String term;
  final String def;
  const _GlossaryRow(this.term, this.def);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(term, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.deepBlue)),
          const SizedBox(height: 2),
          Text(def, style: const TextStyle(fontSize: 13, height: 1.4, color: AppColors.textGrey)),
        ],
      ),
    );
  }
}

class _QaTile extends StatefulWidget {
  final String q;
  final String a;
  const _QaTile({required this.q, required this.a});

  @override
  State<_QaTile> createState() => _QaTileState();
}

class _QaTileState extends State<_QaTile> {
  bool _show = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightBlue.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.q, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: () => setState(() => _show = !_show),
            child: Text(
              _show ? 'Hide answer' : 'Show model answer',
              style: const TextStyle(color: AppColors.primaryBlue, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          if (_show) ...[
            const SizedBox(height: 6),
            Text(widget.a, style: const TextStyle(fontSize: 13, height: 1.4, color: AppColors.textGrey)),
          ],
        ],
      ),
    );
  }
}

class _McqTile extends StatefulWidget {
  final int index;
  final _Mcq mcq;
  const _McqTile({required this.index, required this.mcq});

  @override
  State<_McqTile> createState() => _McqTileState();
}

class _McqTileState extends State<_McqTile> {
  int? _selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderBlue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${widget.index}. ${widget.mcq.question}',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 8),
          ...List.generate(widget.mcq.options.length, (i) {
            final isCorrect = i == widget.mcq.correctIndex;
            final isSelected = i == _selected;
            Color? bg;
            if (_selected != null) {
              if (isCorrect) {
                bg = Colors.green.withValues(alpha: 0.15);
              } else if (isSelected) {
                bg = Colors.red.withValues(alpha: 0.15);
              }
            }
            return GestureDetector(
              onTap: _selected == null ? () => setState(() => _selected = i) : null,
              child: Container(
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: bg ?? AppColors.lightBlue.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(child: Text(widget.mcq.options[i], style: const TextStyle(fontSize: 13))),
                    if (_selected != null && isCorrect)
                      const Icon(Icons.check_circle, color: Colors.green, size: 16),
                    if (_selected != null && isSelected && !isCorrect)
                      const Icon(Icons.cancel, color: Colors.red, size: 16),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _TrueFalseTile extends StatefulWidget {
  final int index;
  final _TrueFalse item;
  const _TrueFalseTile({required this.index, required this.item});

  @override
  State<_TrueFalseTile> createState() => _TrueFalseTileState();
}

class _TrueFalseTileState extends State<_TrueFalseTile> {
  bool? _selected;

  @override
  Widget build(BuildContext context) {
    final answered = _selected != null;
    final isCorrect = answered && _selected == widget.item.answer;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: !answered
            ? AppColors.lightBlue.withValues(alpha: 0.3)
            : (isCorrect ? Colors.green.withValues(alpha: 0.1) : Colors.red.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text('${widget.index}. ${widget.item.statement}', style: const TextStyle(fontSize: 13)),
          ),
          if (!answered) ...[
            _tfButton('T', () => setState(() => _selected = true)),
            const SizedBox(width: 6),
            _tfButton('F', () => setState(() => _selected = false)),
          ] else
            Icon(isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? Colors.green : Colors.red, size: 18),
        ],
      ),
    );
  }

  Widget _tfButton(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.borderBlue),
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Data
// ---------------------------------------------------------------------------

const List<_Mcq> _mcqs = [
  _Mcq(
    'Which is a characteristic of scientific observation?',
    ['Random and unplanned', 'Uses only five senses', 'Systematic and purposeful with recorded data', 'Based on personal feelings'],
    2,
  ),
  _Mcq(
    'What do we call a factor deliberately changed in an experiment?',
    ['Dependent variable', 'Independent variable', 'Controlled variable', 'Constant variable'],
    1,
  ),
  _Mcq(
    'Why are controlled variables important?',
    ['To make the experiment longer', 'To ensure fair testing and isolate the effect', 'To make it more complicated', 'To avoid measurements'],
    1,
  ),
  _Mcq(
    '"Does temperature affect sugar dissolving time?" — what is the dependent variable?',
    ['Temperature', 'Sugar dissolving time', 'Type of sugar', 'Type of water'],
    1,
  ),
  _Mcq(
    'Example of a controlled variable in a plant growth experiment:',
    ['Amount of light (changed)', 'Plant height (measured)', 'Type and amount of soil (kept same)', 'Plant species tested'],
    2,
  ),
  _Mcq(
    'A fair test requires:',
    ['Changing everything', 'Changing nothing', 'Changing ONLY the independent variable', 'Random changes'],
    2,
  ),
  _Mcq(
    'Which is NOT part of the scientific method?',
    ['Observation', 'Hypothesis', 'Random guessing', 'Experiment'],
    2,
  ),
];

const List<_TrueFalse> _trueFalse = [
  _TrueFalse('Scientific and casual observation are the same thing.', false),
  _TrueFalse('In a fair test, only one variable should be changed at a time.', true),
  _TrueFalse('Repeating an experiment multiple times makes results more reliable.', true),
  _TrueFalse('The dependent variable is what the experimenter changes.', false),
  _TrueFalse('Controlled variables help isolate the effect of the independent variable.', true),
  _TrueFalse('A single experiment is always enough to draw final conclusions.', false),
  _TrueFalse('Correlation always means causation.', false),
];
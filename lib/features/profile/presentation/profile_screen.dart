import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../app/router/route_names.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import '../../quiz/data/quiz_result_storage.dart';
import '../../quiz/domain/quiz_result.dart';
import '../data/profile_storage.dart';
import '../data/user_profile.dart';
import 'widgets/profile_score_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileStorage = ProfileStorage();
  final _quizStorage = QuizResultStorage();
  final _nameController = TextEditingController();
  final _nameFocus = FocusNode();

  UserProfile _profile = UserProfile.empty();
  bool _loading = true;
  bool _editingName = false;
  List<QuizResult> _results = [];

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocus.dispose();
    super.dispose();
  }

  Future<void> _loadProfile() async {
    final profile = await _profileStorage.getProfile();
    final results = await _quizStorage.getResults();
    if (!mounted) return;
    setState(() {
      _profile = profile;
      _nameController.text = profile.name;
      _results = results;
      _loading = false;
    });
  }

  Future<void> _saveName() async {
    final updated = _profile.copyWith(name: _nameController.text.trim());
    await _profileStorage.saveProfile(updated);
    if (!mounted) return;
    setState(() {
      _profile = updated;
      _editingName = false;
    });
    FocusScope.of(context).unfocus();
  }

  Future<void> _saveProfile({String? photoPath}) async {
    final updated = _profile.copyWith(
      name: _nameController.text.trim(),
      photoPath: photoPath ?? _profile.photoPath,
    );
    await _profileStorage.saveProfile(updated);
    if (!mounted) return;
    setState(() => _profile = updated);
  }

  Future<void> _pickPhoto() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final appDir = await getApplicationDocumentsDirectory();
    final fileName =
        'profile_photo_${DateTime.now().millisecondsSinceEpoch}.png';
    final savedFile =
        await File(image.path).copy('${appDir.path}/$fileName');
    await _saveProfile(photoPath: savedFile.path);
  }

  int get _completedCount => _results.length;

  double get _averageScore {
    if (_results.isEmpty) return 0;
    return _results.map((r) => r.percentage).reduce((a, b) => a + b) /
        _results.length;
  }

  List<QuizResult> get _mathResults =>
      _results.where((r) => r.subjectName.toLowerCase().contains('math')).toList();

  List<QuizResult> get _scienceResults =>
      _results.where((r) => r.subjectName.toLowerCase().contains('science')).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const BottomNavBar(currentIndex: 5),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Gradient header ────────────────────────────
                    _buildHeader(),

                    // ── Body content ───────────────────────────────
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Stats card
                          ProfileScoreCard(
                            completedQuizzes: _completedCount,
                            averageScore: _averageScore,
                          ),
                          const SizedBox(height: 20),

                          // About Developer nav row
                          _buildAboutDeveloperRow(context),
                          const SizedBox(height: 24),

                          // Quiz history
                          _buildQuizHistory(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  // ── Gradient header with avatar + inline name ──────────────────────────────
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF38BDF8), Color(0xFF2563EB), Color(0xFF4338CA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          // Avatar
          GestureDetector(
            onTap: _pickPhoto,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white.withValues(alpha: 0.25),
                  backgroundImage: _profile.photoPath != null
                      ? FileImage(File(_profile.photoPath!))
                      : null,
                  child: _profile.photoPath == null
                      ? const Icon(Icons.person, color: Colors.white, size: 48)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 14,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Inline name field
          _buildInlineName(),
        ],
      ),
    );
  }

  Widget _buildInlineName() {
    if (_editingName) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 200,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
            ),
            child: TextField(
              controller: _nameController,
              focusNode: _nameFocus,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: const InputDecoration(
                hintText: 'Your name',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
              onSubmitted: (_) => _saveName(),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: _saveName,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 18),
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: () {
              _nameController.text = _profile.name;
              setState(() => _editingName = false);
              FocusScope.of(context).unfocus();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                  const Icon(Icons.close, color: Colors.white70, size: 18),
            ),
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() => _editingName = true);
        Future.delayed(const Duration(milliseconds: 80), () {
          _nameFocus.requestFocus();
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _profile.name.isNotEmpty ? _profile.name : 'Tap to set name',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _profile.name.isNotEmpty ? Colors.white : Colors.white60,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.edit, color: Colors.white, size: 14),
          ),
        ],
      ),
    );
  }

  // ── About Developer nav row (photo instead of icon) ────────────────────────
  Widget _buildAboutDeveloperRow(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RouteNames.aboutDeveloper),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.borderBlue),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Developer photo (small circle)
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.borderBlue,
                  width: 1.5,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/my_photo.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About the Developer',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Hajur Karki — Developer & Tutor',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 15, color: AppColors.textGrey),
          ],
        ),
      ),
    );
  }

  // ── Quiz history — side-by-side Math / Science ─────────────────────────────
  Widget _buildQuizHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Quiz History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            Text(
              '${_results.length} ${_results.length == 1 ? 'result' : 'results'}',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        if (_results.isEmpty)
          _buildEmptyHistory()
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Math column
              Expanded(
                child: _SubjectColumn(
                  subject: 'Math',
                  color: const Color(0xFF2563EB),
                  bgColor: const Color(0xFFEFF6FF),
                  borderColor: const Color(0xFFBFDBFE),
                  icon: Icons.calculate_outlined,
                  results: _mathResults,
                ),
              ),
              const SizedBox(width: 12),
              // Science column
              Expanded(
                child: _SubjectColumn(
                  subject: 'Science',
                  color: const Color(0xFF059669),
                  bgColor: const Color(0xFFECFDF5),
                  borderColor: const Color(0xFFA7F3D0),
                  icon: Icons.science_outlined,
                  results: _scienceResults,
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildEmptyHistory() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderBlue),
      ),
      child: const Column(
        children: [
          Icon(Icons.quiz_outlined, size: 40, color: AppColors.borderBlue),
          SizedBox(height: 12),
          Text(
            'No quizzes taken yet',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Complete a quiz to see your results here.',
            style: TextStyle(color: AppColors.textGrey, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

// ── Subject column (Math or Science) ─────────────────────────────────────────
class _SubjectColumn extends StatelessWidget {
  final String subject;
  final Color color;
  final Color bgColor;
  final Color borderColor;
  final IconData icon;
  final List<QuizResult> results;

  const _SubjectColumn({
    required this.subject,
    required this.color,
    required this.bgColor,
    required this.borderColor,
    required this.icon,
    required this.results,
  });

  String _formatDate(DateTime dt) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${dt.day} ${months[dt.month - 1]}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Column header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 6),
              Text(
                subject,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const Spacer(),
              Text(
                '${results.length}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        if (results.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.borderBlue),
            ),
            child: Column(
              children: [
                Icon(Icons.inbox_outlined,
                    size: 24, color: AppColors.borderBlue),
                const SizedBox(height: 6),
                const Text(
                  'No results',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          )
        else
          ...results.map((r) => _ResultCard(
                result: r,
                color: color,
                bgColor: bgColor,
                borderColor: borderColor,
                formatDate: _formatDate,
              )),
      ],
    );
  }
}

// ── Individual result card inside a subject column ────────────────────────────
class _ResultCard extends StatelessWidget {
  final QuizResult result;
  final Color color;
  final Color bgColor;
  final Color borderColor;
  final String Function(DateTime) formatDate;

  const _ResultCard({
    required this.result,
    required this.color,
    required this.bgColor,
    required this.borderColor,
    required this.formatDate,
  });

  @override
  Widget build(BuildContext context) {
    final pct = result.percentage;
    final passed = result.passed;

    final Color scoreColor = pct >= 80
        ? AppColors.success
        : pct >= 60
            ? const Color(0xFFD97706)
            : AppColors.error;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderBlue),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chapter title
          Text(
            result.chapterTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),

          // Score ring + pass/fail
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: scoreColor.withValues(alpha: 0.1),
                  border: Border.all(color: scoreColor, width: 1.5),
                ),
                child: Center(
                  child: Text(
                    '${pct.toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: scoreColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${result.score}/${result.total}',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textGrey,
                      ),
                    ),
                    Text(
                      formatDate(result.completedAt),
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Pass/Fail badge
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: passed
                    ? AppColors.success.withValues(alpha: 0.1)
                    : AppColors.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: passed
                      ? AppColors.success.withValues(alpha: 0.4)
                      : AppColors.error.withValues(alpha: 0.4),
                ),
              ),
              child: Text(
                passed ? 'Pass' : 'Fail',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: passed ? AppColors.success : AppColors.error,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

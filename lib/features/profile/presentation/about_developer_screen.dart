import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AboutDeveloperScreen extends StatefulWidget {
  const AboutDeveloperScreen({super.key});

  @override
  State<AboutDeveloperScreen> createState() => _AboutDeveloperScreenState();
}

class _AboutDeveloperScreenState extends State<AboutDeveloperScreen> {
  static const _kSumKey = 'about_rating_sum';
  static const _kCountKey = 'about_rating_count';
  static const _kMyRatingKey = 'about_rating_mine';

  double _average = 0.0;
  int _count = 0;
  int _myRating = 0; // 0 = not rated yet
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _loadRating();
  }

  Future<void> _loadRating() async {
    final p = await SharedPreferences.getInstance();
    final sum = p.getInt(_kSumKey) ?? 0;
    final count = p.getInt(_kCountKey) ?? 0;
    final mine = p.getInt(_kMyRatingKey) ?? 0;
    setState(() {
      _count = count;
      _average = count == 0 ? 0.0 : sum / count;
      _myRating = mine;
      _loaded = true;
    });
  }

  Future<void> _submitRating(int stars) async {
    final p = await SharedPreferences.getInstance();
    int sum = p.getInt(_kSumKey) ?? 0;
    int count = p.getInt(_kCountKey) ?? 0;

    if (_myRating > 0) {
      // Update existing rating instead of double-counting
      sum = sum - _myRating + stars;
    } else {
      sum += stars;
      count += 1;
    }

    await p.setInt(_kSumKey, sum);
    await p.setInt(_kCountKey, count);
    await p.setInt(_kMyRatingKey, stars);

    setState(() {
      _count = count;
      _average = count == 0 ? 0.0 : sum / count;
      _myRating = stars;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Thanks! You rated $stars star${stars > 1 ? 's' : ''}.'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B14),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('About Developer'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Ambient gradient background
          const _AmbientBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  // Avatar with HK initials
                  Center(
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.15),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF7C3AED).withValues(alpha: 0.35),
                            blurRadius: 30,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'HK',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Hajur Karki',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Center(child: _RolePill()),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      'Crafting learning experiences that feel light,\nfocused and human.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Stats row — Projects + interactive Rating (Students removed)
                  _GlassCard(
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: _StatItem(
                            icon: Icons.layers_outlined,
                            value: '12+',
                            label: 'PROJECTS',
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 44,
                          color: Colors.white.withValues(alpha: 0.08),
                        ),
                        Expanded(
                          child: _RatingStat(
                            average: _average,
                            count: _count,
                            myRating: _myRating,
                            loaded: _loaded,
                            onRate: _submitRating,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // About Me
                  _GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _SectionHeader(
                          icon: Icons.explore_outlined,
                          title: 'About Me',
                          iconColor: Color(0xFF06B6D4),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "I'm passionate about software development and education. This app combines both interests into one platform where students can learn, explore, and gain confidence. Every feature has been designed with students in mind. I noticed many students struggle to find practical learning resources and project ideas. That's why I created this app—to make learning easier, more accessible, and more enjoyable for everyone.~",
                          style: TextStyle(
                            color: Colors.white70,
                            height: 1.6,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Why This App?
                  _GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _SectionHeader(
                          icon: Icons.lightbulb_outline,
                          title: 'Why This App?',
                          iconColor: Color(0xFFF59E0B),
                        ),
                        SizedBox(height: 14),
                        _FeaturePill(text: 'Help students learn more effectively'),
                        SizedBox(height: 10),
                        _FeaturePill(text: 'Provide free educational resources'),
                        SizedBox(height: 10),
                        _FeaturePill(text: 'Inspire students to build their own projects'),
                        SizedBox(height: 10),
                        _FeaturePill(text: 'Make learning available anytime, anywhere'),
                        SizedBox(height: 10),
                        _FeaturePill(text: 'Encourage curiosity and practical knowledge'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // My Mission
                  _GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _SectionHeader(
                          icon: Icons.gps_fixed,
                          title: 'My Mission',
                          iconColor: Color(0xFFEF4444),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Create educational apps that make learning simple, engaging, and accessible for every student.',
                          style: TextStyle(
                            color: Colors.white70,
                            height: 1.6,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Looking for a Tutor? (gradient card)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7C3AED), Color(0xFF3B82F6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF7C3AED).withValues(alpha: 0.35),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.menu_book_rounded, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Looking for a Tutor?',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Guidance in Mathematics, Science, Computer Engineering or programming — happy to help you learn and grow.',
                          style: TextStyle(
                            color: Colors.white,
                            height: 1.55,
                            fontSize: 13.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // TODO: open Facebook / contact link
                            },
                            icon: const Icon(Icons.mail_outline,
                                color: Color(0xFF3B0F87)),
                            label: const Text(
                              'Contact Me',
                              style: TextStyle(
                                color: Color(0xFF3B0F87),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Skills
                  _GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Skills',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: const [
                            _SkillChip('Flutter'),
                            _SkillChip('Dart'),
                            _SkillChip('Firebase'),
                            _SkillChip('REST API'),
                            _SkillChip('UI/UX'),
                            
                            _SkillChip('Teaching'),
                            _SkillChip('Problem Solving'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Quote
                  _GlassCard(
                    child: Column(
                      children: [
                        Icon(Icons.format_quote,
                            color: Colors.white.withValues(alpha: 0.4), size: 28),
                        const SizedBox(height: 6),
                        const Text(
                          '"Education grows when knowledge is shared."',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Made with ',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.6),
                            fontSize: 13,
                          ),
                        ),
                        const Text('♥', style: TextStyle(color: Color(0xFFEF4444))),
                        Text(
                          ' for Students',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.6),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Ambient background gradient blobs ────────────────────────────────────────
class _AmbientBackground extends StatelessWidget {
  const _AmbientBackground();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(-0.8, -0.9),
            radius: 1.2,
            colors: [
              const Color(0xFF7C3AED).withValues(alpha: 0.35),
              const Color(0xFF0B0B14).withValues(alpha: 0.0),
            ],
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.9, 0.6),
              radius: 1.0,
              colors: [
                const Color(0xFF06B6D4).withValues(alpha: 0.25),
                const Color(0xFF0B0B14).withValues(alpha: 0.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Glass card ───────────────────────────────────────────────────────────────
class _GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const _GlassCard({
    required this.child,
    this.padding = const EdgeInsets.all(18),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: child,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  const _SectionHeader({
    required this.icon,
    required this.title,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class _RolePill extends StatelessWidget {
  const _RolePill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.settings, size: 14, color: Color(0xFF06B6D4)),
          SizedBox(width: 6),
          Text(
            'Computer Engineer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white.withValues(alpha: 0.7), size: 20),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.55),
            fontSize: 11,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _RatingStat extends StatelessWidget {
  final double average;
  final int count;
  final int myRating;
  final bool loaded;
  final ValueChanged<int> onRate;

  const _RatingStat({
    required this.average,
    required this.count,
    required this.myRating,
    required this.loaded,
    required this.onRate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Interactive stars
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (i) {
            final filled = i < (myRating > 0 ? myRating : average.round());
            return GestureDetector(
              onTap: () => onRate(i + 1),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.5),
                child: Icon(
                  filled ? Icons.star_rounded : Icons.star_outline_rounded,
                  size: 18,
                  color: filled
                      ? const Color(0xFFF59E0B)
                      : Colors.white.withValues(alpha: 0.4),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 6),
        Text(
          loaded && count > 0 ? average.toStringAsFixed(1) : '—',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          count > 0 ? 'RATING ($count)' : 'TAP TO RATE',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.55),
            fontSize: 10.5,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _FeaturePill extends StatelessWidget {
  final String text;
  const _FeaturePill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)],
              ),
            ),
            child: const Icon(Icons.bolt, size: 14, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

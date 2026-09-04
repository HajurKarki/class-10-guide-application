import 'package:flutter/material.dart';

import '../../../app/router/route_names.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/bottom_nav_bar.dart';

class GameHubScreen extends StatelessWidget {
  const GameHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Games',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Pick a game and choose your level',
                style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 28),
              _GameCard(
                icon: '🔢',
                title: 'Sudoku',
                description:
                    'Fill the 9×9 grid so every row, column and 3×3 box contains the digits 1–9.',
                gradient: const [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                onTap: () => Navigator.pushNamed(
                  context,
                  RouteNames.gameLevel,
                  arguments: {'game': 'sudoku'},
                ),
              ),
              const SizedBox(height: 16),
              _GameCard(
                icon: '➕',
                title: 'KenKen',
                description:
                    'Fill the grid using arithmetic clues. Every row and column must have unique digits.',
                gradient: const [Color(0xFF10B981), Color(0xFF047857)],
                onTap: () => Navigator.pushNamed(
                  context,
                  RouteNames.gameLevel,
                  arguments: {'game': 'kenken'},
                ),
              ),
              const SizedBox(height: 16),
              _GameCard(
                icon: '📝',
                title: 'Crossword',
                description:
                    'Find the hidden words in the grid — horizontally, vertically, or diagonally.',
                gradient: const [Color(0xFFF59E0B), Color(0xFFB45309)],
                onTap: () => Navigator.pushNamed(
                  context,
                  RouteNames.gameLevel,
                  arguments: {'game': 'crossword'},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GameCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final List<Color> gradient;
  final VoidCallback onTap;

  const _GameCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(24),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: gradient.last.withValues(alpha: 0.35),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 48)),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.85),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Levels 1 – 20  →',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../app/router/route_names.dart';
import '../../../app/theme/app_colors.dart';

class GameLevelScreen extends StatelessWidget {
  final String game;

  const GameLevelScreen({super.key, required this.game});

  String get _title {
    switch (game) {
      case 'sudoku':
        return 'Sudoku';
      case 'kenken':
        return 'KenKen';
      case 'crossword':
        return 'Crossword';
      default:
        return 'Game';
    }
  }

  String get _routeName {
    switch (game) {
      case 'sudoku':
        return RouteNames.sudoku;
      case 'kenken':
        return RouteNames.kenken;
      case 'crossword':
        return RouteNames.crossword;
      default:
        return RouteNames.games;
    }
  }

  Color get _color {
    switch (game) {
      case 'sudoku':
        return const Color(0xFF2563EB);
      case 'kenken':
        return const Color(0xFF059669);
      case 'crossword':
        return const Color(0xFFD97706);
      default:
        return AppColors.primaryBlue;
    }
  }

  String _difficultyLabel(int level) {
    if (level <= 10) return 'Very Easy';
    if (level <= 15) return 'Easy';
    if (level <= 18) return 'Medium';
    return 'Hard';
  }

  Color _difficultyColor(int level) {
    if (level <= 10) return const Color(0xFF16A34A);   // green
    if (level <= 15) return const Color(0xFF2563EB);   // blue
    if (level <= 18) return const Color(0xFFF59E0B);   // amber
    return const Color(0xFFDC2626);                    // red
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            '$_title — Choose Level',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.92,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            final level = index + 1;
            final diffColor = _difficultyColor(level);
            return Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              elevation: 2,
              shadowColor: _color.withValues(alpha: 0.12),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => Navigator.pushNamed(
                  context,
                  _routeName,
                  arguments: {'level': level},
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$level',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _color,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: diffColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        _difficultyLabel(level),
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: diffColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

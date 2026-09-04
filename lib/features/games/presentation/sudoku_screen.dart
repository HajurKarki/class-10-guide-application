import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../data/sudoku_generator.dart';

class SudokuScreen extends StatefulWidget {
  final int level;

  const SudokuScreen({super.key, required this.level});

  @override
  State<SudokuScreen> createState() => _SudokuScreenState();
}

class _SudokuScreenState extends State<SudokuScreen> {
  late List<List<int>> _puzzle;
  late List<List<int>> _solution;
  late List<List<int>> _userInput;
  late List<List<bool>> _isGiven;

  int? _selectedRow;
  int? _selectedCol;
  bool _solved = false;
  int _mistakes = 0;
  static const int _maxMistakes = 3;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    final result = SudokuGenerator().generate(widget.level);
    _puzzle = result.puzzle;
    _solution = result.solution;
    _userInput = _puzzle.map((r) => List<int>.from(r)).toList();
    _isGiven = _puzzle
        .map((r) => r.map((v) => v != 0).toList())
        .toList();
    _selectedRow = null;
    _selectedCol = null;
    _solved = false;
    _mistakes = 0;
  }

  void _selectCell(int row, int col) {
    if (_isGiven[row][col]) {
      setState(() {
        _selectedRow = row;
        _selectedCol = col;
      });
      return;
    }
    setState(() {
      _selectedRow = row;
      _selectedCol = col;
    });
  }

  void _inputNumber(int num) {
    if (_selectedRow == null || _selectedCol == null) return;
    final r = _selectedRow!;
    final c = _selectedCol!;
    if (_isGiven[r][c]) return;
    if (_solved) return;

    setState(() {
      _userInput[r][c] = num;
      if (num != 0 && _solution[r][c] != num) {
        _mistakes++;
        if (_mistakes >= _maxMistakes) _showGameOver();
      }
      if (_isBoardComplete()) {
        _solved = true;
        _showWin();
      }
    });
  }

  bool _isBoardComplete() {
    for (var r = 0; r < 9; r++) {
      for (var c = 0; c < 9; c++) {
        if (_userInput[r][c] != _solution[r][c]) return false;
      }
    }
    return true;
  }

  void _showWin() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: const Text('🎉 Puzzle Solved!',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text('You completed Level ${widget.level} with '
              '$_mistakes mistake${_mistakes == 1 ? '' : 's'}!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() => _generatePuzzle());
              },
              child: const Text('Play Again'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Back'),
            ),
          ],
        ),
      );
    });
  }

  void _showGameOver() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: const Text('💀 Game Over',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text('You made 3 mistakes. Better luck next time!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() => _generatePuzzle());
              },
              child: const Text('Try Again'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Back'),
            ),
          ],
        ),
      );
    });
  }

  // ── Colors ────────────────────────────────────────────────────────────────

  Color _cellBg(int row, int col) {
    final isSelected = row == _selectedRow && col == _selectedCol;
    final sameBox = _selectedRow != null &&
        _selectedCol != null &&
        (row ~/ 3 == _selectedRow! ~/ 3) &&
        (col ~/ 3 == _selectedCol! ~/ 3);
    final sameRowOrCol = _selectedRow != null &&
        _selectedCol != null &&
        (row == _selectedRow || col == _selectedCol);

    if (isSelected) return const Color(0xFF2563EB);
    if (sameBox || sameRowOrCol) return const Color(0xFFDBEAFE);

    // Checkerboard for 3×3 boxes
    final boxRow = row ~/ 3;
    final boxCol = col ~/ 3;
    return (boxRow + boxCol) % 2 == 0
        ? Colors.white
        : const Color(0xFFF0F9FF);
  }

  Color _cellTextColor(int row, int col) {
    final isSelected = row == _selectedRow && col == _selectedCol;
    if (isSelected) return Colors.white;
    if (_isGiven[row][col]) return AppColors.textDark;
    final val = _userInput[row][col];
    if (val == 0) return Colors.transparent;
    return val == _solution[row][col]
        ? const Color(0xFF2563EB)
        : const Color(0xFFDC2626);
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
            'Sudoku — Level ${widget.level}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: AppColors.background,
        actions: [
          // Mistake counter
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                _maxMistakes,
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Icon(
                    i < _mistakes ? Icons.favorite_border : Icons.favorite,
                    color: i < _mistakes
                        ? Colors.grey.shade300
                        : const Color(0xFFDC2626),
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() => _generatePuzzle()),
            tooltip: 'New puzzle',
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          // ── Grid ──────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.textDark, width: 2.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 9,
                  ),
                  itemCount: 81,
                  itemBuilder: (context, index) {
                    final row = index ~/ 9;
                    final col = index % 9;
                    final val = _userInput[row][col];

                    return GestureDetector(
                      onTap: () => _selectCell(row, col),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _cellBg(row, col),
                          border: Border(
                            right: BorderSide(
                              color: col % 3 == 2
                                  ? AppColors.textDark
                                  : Colors.grey.shade300,
                              width: col % 3 == 2 ? 1.5 : 0.5,
                            ),
                            bottom: BorderSide(
                              color: row % 3 == 2
                                  ? AppColors.textDark
                                  : Colors.grey.shade300,
                              width: row % 3 == 2 ? 1.5 : 0.5,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            val == 0 ? '' : '$val',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: _isGiven[row][col]
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: _cellTextColor(row, col),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // ── Number pad ────────────────────────────────────────────
          // Use LayoutBuilder so buttons scale to any screen width
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // 10 buttons + 9 gaps; leave a little breathing room
                final btnSize = ((constraints.maxWidth - 9 * 6) / 10)
                    .clamp(28.0, 44.0);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      9,
                      (i) => _NumButton(
                        number: i + 1,
                        size: btnSize,
                        onTap: () => _inputNumber(i + 1),
                      ),
                    ),
                    _NumButton(
                      number: 0,
                      label: '✕',
                      size: btnSize,
                      onTap: () => _inputNumber(0),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _NumButton extends StatelessWidget {
  final int number;
  final String? label;
  final double size;
  final VoidCallback onTap;

  const _NumButton({
    required this.number,
    required this.onTap,
    required this.size,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size + 8,
          child: Center(
            child: Text(
              label ?? '$number',
              style: TextStyle(
                fontSize: (size * 0.48).clamp(14.0, 20.0),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2563EB),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

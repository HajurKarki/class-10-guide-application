import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../data/kenken_generator.dart';

class KenKenScreen extends StatefulWidget {
  final int level;

  const KenKenScreen({super.key, required this.level});

  @override
  State<KenKenScreen> createState() => _KenKenScreenState();
}

class _KenKenScreenState extends State<KenKenScreen> {
  late KenKenPuzzle _puzzle;
  late List<List<int>> _userInput;

  int? _selRow;
  int? _selCol;
  bool _solved = false;
  bool _showErrors = false;

  @override
  void initState() {
    super.initState();
    _newPuzzle();
  }

  void _newPuzzle() {
    _puzzle = KenKenGenerator().generate(widget.level);
    _userInput =
        List.generate(_puzzle.size, (_) => List.filled(_puzzle.size, 0));
    _selRow = null;
    _selCol = null;
    _solved = false;
    _showErrors = false;
  }

  void _select(int r, int c) => setState(() {
        _selRow = r;
        _selCol = c;
      });

  void _input(int num) {
    if (_selRow == null || _selCol == null || _solved) return;
    setState(() {
      _userInput[_selRow!][_selCol!] = num;
      if (_isSolved()) {
        _solved = true;
        _showWin();
      }
    });
  }

  bool _isSolved() {
    for (var r = 0; r < _puzzle.size; r++) {
      for (var c = 0; c < _puzzle.size; c++) {
        if (_userInput[r][c] != _puzzle.solution[r][c]) return false;
      }
    }
    return true;
  }

  bool _cellCorrect(int r, int c) {
    final v = _userInput[r][c];
    return v == 0 || v == _puzzle.solution[r][c];
  }

  void _showWin() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: const Text('🎉 Solved!',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text('You completed KenKen Level ${widget.level}!'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() => _newPuzzle());
                },
                child: const Text('Play Again')),
            ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Back')),
          ],
        ),
      );
    });
  }

  // ── Border helpers ────────────────────────────────────────────────────────

  /// True if the adjacent cell is in a different cage
  bool _borderRight(int r, int c) {
    if (c >= _puzzle.size - 1) return true;
    return _puzzle.cageIndex[r][c] != _puzzle.cageIndex[r][c + 1];
  }

  bool _borderBottom(int r, int c) {
    if (r >= _puzzle.size - 1) return true;
    return _puzzle.cageIndex[r][c] != _puzzle.cageIndex[r + 1][c];
  }

  /// Top-left cell of a cage (to draw the label)
  bool _isCageTopLeft(int r, int c) {
    final cageIdx = _puzzle.cageIndex[r][c];
    final cage = _puzzle.cages[cageIdx];
    // topmost, then leftmost
    final sorted = [...cage.cells]..sort(
        (a, b) => a.$1 != b.$1 ? a.$1.compareTo(b.$1) : a.$2.compareTo(b.$2));
    return sorted.first == (r, c);
  }

  @override
  Widget build(BuildContext context) {
    final size = _puzzle.size;
    final maxNum = size;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            'KenKen — Level ${widget.level}  ($size×$size)',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: AppColors.background,
        actions: [
          IconButton(
            icon: Icon(
              _showErrors ? Icons.visibility_off : Icons.visibility,
              color: _showErrors
                  ? const Color(0xFFDC2626)
                  : AppColors.textGrey,
            ),
            tooltip: 'Toggle error highlight',
            onPressed: () => setState(() => _showErrors = !_showErrors),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() => _newPuzzle()),
            tooltip: 'New puzzle',
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          // ── Grid ──────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xFF059669), width: 2.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size,
                  ),
                  itemCount: size * size,
                  itemBuilder: (context, idx) {
                    final r = idx ~/ size;
                    final c = idx % size;
                    final val = _userInput[r][c];
                    final isSelected = r == _selRow && c == _selCol;
                    final hasError =
                        _showErrors && val != 0 && !_cellCorrect(r, c);

                    return GestureDetector(
                      onTap: () => _select(r, c),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF059669)
                              : hasError
                                  ? const Color(0xFFFEE2E2)
                                  : Colors.white,
                          border: Border(
                            right: BorderSide(
                              color: _borderRight(r, c)
                                  ? const Color(0xFF059669)
                                  : Colors.grey.shade300,
                              width: _borderRight(r, c) ? 1.8 : 0.5,
                            ),
                            bottom: BorderSide(
                              color: _borderBottom(r, c)
                                  ? const Color(0xFF059669)
                                  : Colors.grey.shade300,
                              width: _borderBottom(r, c) ? 1.8 : 0.5,
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            // Cage label (top-left of cage)
                            if (_isCageTopLeft(r, c))
                              Positioned(
                                top: 2,
                                left: 3,
                                child: Text(
                                  _puzzle.cages[_puzzle.cageIndex[r][c]].label,
                                  style: TextStyle(
                                    fontSize: size <= 4 ? 10 : 8,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF059669),
                                  ),
                                ),
                              ),
                            // User value
                            Center(
                              child: Text(
                                val == 0 ? '' : '$val',
                                style: TextStyle(
                                  fontSize: size <= 4 ? 22 : 18,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? Colors.white
                                      : hasError
                                          ? const Color(0xFFDC2626)
                                          : AppColors.textDark,
                                ),
                              ),
                            ),
                          ],
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                ...List.generate(
                  maxNum,
                  (i) => _KenKenBtn(
                    label: '${i + 1}',
                    onTap: () => _input(i + 1),
                    color: const Color(0xFF059669),
                  ),
                ),
                _KenKenBtn(
                  label: '✕',
                  onTap: () => _input(0),
                  color: AppColors.textGrey,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Hint
          Text(
            'Every row and column must have each digit 1–$maxNum exactly once.',
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textGrey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _KenKenBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;

  const _KenKenBtn({
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

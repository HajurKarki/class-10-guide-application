import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../data/crossword_generator.dart';

class CrosswordScreen extends StatefulWidget {
  final int level;

  const CrosswordScreen({super.key, required this.level});

  @override
  State<CrosswordScreen> createState() => _CrosswordScreenState();
}

class _CrosswordScreenState extends State<CrosswordScreen> {
  late CrosswordPuzzle _puzzle;

  // Currently selected cells (during drag-selection)
  final Set<(int, int)> _selected = {};
  (int, int)? _dragStart;

  // Cells that are part of found words (to highlight permanently)
  final Set<(int, int)> _foundCells = {};

  @override
  void initState() {
    super.initState();
    _newPuzzle();
  }

  void _newPuzzle() {
    _puzzle = CrosswordGenerator().generate(widget.level);
    _selected.clear();
    _foundCells.clear();
    _dragStart = null;
  }

  void _startDrag(int r, int c) {
    setState(() {
      _dragStart = (r, c);
      _selected.clear();
      _selected.add((r, c));
    });
  }

  void _updateDrag(int r, int c) {
    if (_dragStart == null) return;
    final (sr, sc) = _dragStart!;
    setState(() {
      _selected.clear();
      _selected.addAll(_cellsBetween(sr, sc, r, c));
    });
  }

  void _endDrag() {
    if (_dragStart == null) return;
    _checkSelection();
    setState(() {
      _dragStart = null;
      _selected.clear();
    });
  }

  /// Returns all cells on the straight line from (r1,c1) to (r2,c2)
  /// Only horizontal, vertical, or diagonal (45°) lines are valid.
  List<(int, int)> _cellsBetween(int r1, int c1, int r2, int c2) {
    final dr = r2 - r1;
    final dc = c2 - c1;

    // Determine direction
    int stepR = 0, stepC = 0;
    if (dr == 0 && dc != 0) {
      stepC = dc > 0 ? 1 : -1;
    } else if (dc == 0 && dr != 0) {
      stepR = dr > 0 ? 1 : -1;
    } else if (dr.abs() == dc.abs()) {
      stepR = dr > 0 ? 1 : -1;
      stepC = dc > 0 ? 1 : -1;
    } else {
      return [(r1, c1)]; // invalid direction
    }

    final cells = <(int, int)>[];
    var r = r1, c = c1;
    while (true) {
      cells.add((r, c));
      if (r == r2 && c == c2) break;
      r += stepR;
      c += stepC;
      if (cells.length > _puzzle.gridSize + 2) break;
    }
    return cells;
  }

  void _checkSelection() {
    final selList = _selected.toList();
    final selWord = selList.map((rc) => _puzzle.grid[rc.$1][rc.$2]).join();
    final selWordRev = selWord.split('').reversed.join();

    for (final pw in _puzzle.placedWords) {
      if (pw.found) continue;
      if (selWord == pw.word || selWordRev == pw.word) {
        setState(() {
          pw.found = true;
          _foundCells.addAll(pw.cells);
          final allDone =
              _puzzle.placedWords.every((w) => w.found);
          if (allDone) {
            _showWin();
          }
        });
        return;
      }
    }
  }

  void _showWin() {
    Future.delayed(const Duration(milliseconds: 400), () {
      if (!mounted) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: const Text('🎉 All Words Found!',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(
              'You found all ${_puzzle.placedWords.length} words in Level ${widget.level}!'),
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

  // ── Cell colours ──────────────────────────────────────────────────────────

  Color _cellColor(int r, int c) {
    final cell = (r, c);
    if (_selected.contains(cell)) return const Color(0xFFFBBF24);
    if (_foundCells.contains(cell)) return const Color(0xFFBBF7D0);
    return Colors.white;
  }

  Color _cellTextColor(int r, int c) {
    final cell = (r, c);
    if (_selected.contains(cell)) return const Color(0xFF78350F);
    if (_foundCells.contains(cell)) return const Color(0xFF14532D);
    return AppColors.textDark;
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final gs = _puzzle.gridSize;
    final found = _puzzle.placedWords.where((w) => w.found).length;
    final total = _puzzle.placedWords.length;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Crossword — Level ${widget.level}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.background,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Center(
              child: Text(
                '$found / $total',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD97706),
                  fontSize: 16,
                ),
              ),
            ),
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
          // ── Grid ──────────────────────────────────────────────────
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
              child: AspectRatio(
                aspectRatio: 1,
                child: LayoutBuilder(builder: (context, constraints) {
                  final cellSize = constraints.maxWidth / gs;
                  return GestureDetector(
                    onPanStart: (d) {
                      final r = (d.localPosition.dy / cellSize).floor();
                      final c = (d.localPosition.dx / cellSize).floor();
                      if (r >= 0 && r < gs && c >= 0 && c < gs) {
                        _startDrag(r, c);
                      }
                    },
                    onPanUpdate: (d) {
                      final r = (d.localPosition.dy / cellSize).floor();
                      final c = (d.localPosition.dx / cellSize).floor();
                      if (r >= 0 && r < gs && c >= 0 && c < gs) {
                        _updateDrag(r, c);
                      }
                    },
                    onPanEnd: (_) => _endDrag(),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFD97706), width: 2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: gs,
                        ),
                        itemCount: gs * gs,
                        itemBuilder: (_, idx) {
                          final r = idx ~/ gs;
                          final c = idx % gs;
                          return Container(
                            decoration: BoxDecoration(
                              color: _cellColor(r, c),
                              border: Border.all(
                                  color: Colors.grey.shade200, width: 0.3),
                            ),
                            child: Center(
                              child: Text(
                                _puzzle.grid[r][c],
                                style: TextStyle(
                                  fontSize: cellSize * 0.5,
                                  fontWeight: FontWeight.w700,
                                  color: _cellTextColor(r, c),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          // ── Word list ──────────────────────────────────────────────
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.borderBlue),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Find these words:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: AppColors.textDark,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '$found/$total found',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        children: _puzzle.placedWords.map((pw) {
                          return _WordChip(
                            word: pw.word,
                            clue: pw.clue,
                            found: pw.found,
                          );
                        }).toList(),
                      ),
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

class _WordChip extends StatelessWidget {
  final String word;
  final String clue;
  final bool found;

  const _WordChip({
    required this.word,
    required this.clue,
    required this.found,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: clue,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: found
              ? const Color(0xFFBBF7D0)
              : AppColors.lightBlue,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: found
                ? const Color(0xFF16A34A)
                : AppColors.borderBlue,
          ),
        ),
        child: Text(
          word,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: found
                ? const Color(0xFF14532D)
                : AppColors.primaryBlue,
            decoration: found ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}

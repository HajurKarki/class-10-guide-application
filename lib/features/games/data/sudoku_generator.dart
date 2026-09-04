import 'dart:math';

class SudokuGenerator {
  final Random _rng = Random();

  // Returns a pair: [puzzle, solution] each as List<List<int>>
  // 0 = empty cell in puzzle
  ({List<List<int>> puzzle, List<List<int>> solution}) generate(int level) {
    final grid = _createSolvedGrid();
    final solution = _copy(grid);
    _removeClues(grid, level);
    return (puzzle: grid, solution: solution);
  }

  // ---------- Internal helpers ----------

  List<List<int>> _createSolvedGrid() {
    final grid = List.generate(9, (_) => List.filled(9, 0));
    _fillGrid(grid);
    return grid;
  }

  bool _fillGrid(List<List<int>> grid) {
    for (var row = 0; row < 9; row++) {
      for (var col = 0; col < 9; col++) {
        if (grid[row][col] == 0) {
          final nums = List.generate(9, (i) => i + 1)..shuffle(_rng);
          for (final num in nums) {
            if (_isValid(grid, row, col, num)) {
              grid[row][col] = num;
              if (_fillGrid(grid)) return true;
              grid[row][col] = 0;
            }
          }
          return false;
        }
      }
    }
    return true;
  }

  bool _isValid(List<List<int>> grid, int row, int col, int num) {
    // Row check
    if (grid[row].contains(num)) return false;
    // Column check
    for (var r = 0; r < 9; r++) {
      if (grid[r][col] == num) return false;
    }
    // Box check
    final boxRow = (row ~/ 3) * 3;
    final boxCol = (col ~/ 3) * 3;
    for (var r = boxRow; r < boxRow + 3; r++) {
      for (var c = boxCol; c < boxCol + 3; c++) {
        if (grid[r][c] == num) return false;
      }
    }
    return true;
  }

  /// Removes cells from the solved grid. More removals = higher difficulty.
  ///
  /// Distribution (20 levels):
  ///   Very Easy  levels  1–10 → 50 down to 45 clues shown
  ///   Easy       levels 11–15 → 44 down to 40 clues shown
  ///   Medium     levels 16–18 → 39 down to 35 clues shown
  ///   Hard       levels 19–20 → 32 down to 30 clues shown
  void _removeClues(List<List<int>> grid, int level) {
    final int clues;
    if (level <= 10) {
      // Very Easy: 50 clues at level 1, drops ~0.5 per level → 45 at level 10
      clues = 50 - ((level - 1) * 0.55).round(); // 50 … 45
    } else if (level <= 15) {
      // Easy: 44 clues at level 11, drops ~1 per level → 40 at level 15
      clues = 44 - ((level - 11) * 1.0).round(); // 44 … 40
    } else if (level <= 18) {
      // Medium: 39 clues at level 16, drops ~1.3 per level → 35 at level 18
      clues = 39 - ((level - 16) * 1.3).round(); // 39 … 35
    } else {
      // Hard: 32 clues at level 19, 30 at level 20
      clues = level == 19 ? 32 : 30;
    }
    final toRemove = 81 - clues;

    final positions = List.generate(81, (i) => i)..shuffle(_rng);
    var removed = 0;
    for (final pos in positions) {
      if (removed >= toRemove) break;
      final row = pos ~/ 9;
      final col = pos % 9;
      grid[row][col] = 0;
      removed++;
    }
  }

  List<List<int>> _copy(List<List<int>> grid) =>
      grid.map((row) => List<int>.from(row)).toList();
}

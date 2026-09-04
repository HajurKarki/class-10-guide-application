import 'dart:math';
import 'crossword_words.dart';

enum Direction { horizontal, vertical, diagonal }

class PlacedWord {
  final String word;
  final String clue;
  final int row;
  final int col;
  final Direction direction;
  bool found;

  PlacedWord({
    required this.word,
    required this.clue,
    required this.row,
    required this.col,
    required this.direction,
    this.found = false,
  });

  List<(int, int)> get cells {
    return List.generate(word.length, (i) {
      switch (direction) {
        case Direction.horizontal:
          return (row, col + i);
        case Direction.vertical:
          return (row + i, col);
        case Direction.diagonal:
          return (row + i, col + i);
      }
    });
  }
}

class CrosswordPuzzle {
  final int gridSize;
  final List<List<String>> grid;
  final List<PlacedWord> placedWords;

  const CrosswordPuzzle({
    required this.gridSize,
    required this.grid,
    required this.placedWords,
  });
}

class CrosswordGenerator {
  final Random _rng = Random();

  CrosswordPuzzle generate(int level) {
    final gridSize = _gridSizeForLevel(level);
    final words = CrosswordWords.forLevel(level);
    final grid = List.generate(gridSize, (_) => List.filled(gridSize, ''));
    final placed = <PlacedWord>[];

    for (final entry in words) {
      _tryPlace(entry.word, entry.clue, grid, placed, gridSize);
    }

    // Fill empty cells with random letters
    for (var r = 0; r < gridSize; r++) {
      for (var c = 0; c < gridSize; c++) {
        if (grid[r][c].isEmpty) {
          grid[r][c] = String.fromCharCode(65 + _rng.nextInt(26));
        }
      }
    }

    return CrosswordPuzzle(
      gridSize: gridSize,
      grid: grid,
      placedWords: placed,
    );
  }

  int _gridSizeForLevel(int level) {
    if (level <= 4) return 10;
    if (level <= 8) return 12;
    if (level <= 12) return 14;
    if (level <= 16) return 16;
    return 18;
  }

  bool _tryPlace(
    String word,
    String clue,
    List<List<String>> grid,
    List<PlacedWord> placed,
    int size,
  ) {
    final dirs = Direction.values.toList()..shuffle(_rng);
    for (var attempt = 0; attempt < 40; attempt++) {
      final dir = dirs[attempt % dirs.length];
      int maxRow, maxCol;
      switch (dir) {
        case Direction.horizontal:
          maxRow = size;
          maxCol = size - word.length;
          break;
        case Direction.vertical:
          maxRow = size - word.length;
          maxCol = size;
          break;
        case Direction.diagonal:
          maxRow = size - word.length;
          maxCol = size - word.length;
          break;
      }
      if (maxRow <= 0 || maxCol <= 0) continue;

      final row = _rng.nextInt(maxRow);
      final col = _rng.nextInt(maxCol);

      if (_canPlace(word, row, col, dir, grid, size)) {
        _placeWord(word, row, col, dir, grid);
        placed.add(PlacedWord(
            word: word, clue: clue, row: row, col: col, direction: dir));
        return true;
      }
    }
    return false;
  }

  bool _canPlace(
    String word,
    int row,
    int col,
    Direction dir,
    List<List<String>> grid,
    int size,
  ) {
    for (var i = 0; i < word.length; i++) {
      int r, c;
      switch (dir) {
        case Direction.horizontal:
          r = row;
          c = col + i;
          break;
        case Direction.vertical:
          r = row + i;
          c = col;
          break;
        case Direction.diagonal:
          r = row + i;
          c = col + i;
          break;
      }
      if (r >= size || c >= size) return false;
      final existing = grid[r][c];
      if (existing.isNotEmpty && existing != word[i]) return false;
    }
    return true;
  }

  void _placeWord(
    String word,
    int row,
    int col,
    Direction dir,
    List<List<String>> grid,
  ) {
    for (var i = 0; i < word.length; i++) {
      switch (dir) {
        case Direction.horizontal:
          grid[row][col + i] = word[i];
          break;
        case Direction.vertical:
          grid[row + i][col] = word[i];
          break;
        case Direction.diagonal:
          grid[row + i][col + i] = word[i];
          break;
      }
    }
  }
}

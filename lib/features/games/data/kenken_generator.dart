import 'dart:math';

enum KenKenOp { add, sub, mul, div, given }

class KenKenCage {
  final List<(int, int)> cells; // (row, col)
  final int target;
  final KenKenOp op;

  const KenKenCage({
    required this.cells,
    required this.target,
    required this.op,
  });

  String get opSymbol {
    switch (op) {
      case KenKenOp.add:
        return '+';
      case KenKenOp.sub:
        return '−';
      case KenKenOp.mul:
        return '×';
      case KenKenOp.div:
        return '÷';
      case KenKenOp.given:
        return '';
    }
  }

  String get label => op == KenKenOp.given ? '$target' : '$target$opSymbol';
}

class KenKenPuzzle {
  final int size;
  final List<List<int>> solution;
  final List<KenKenCage> cages;
  // cageIndex[row][col] = index in cages list
  final List<List<int>> cageIndex;

  const KenKenPuzzle({
    required this.size,
    required this.solution,
    required this.cages,
    required this.cageIndex,
  });
}

class KenKenGenerator {
  final Random _rng = Random();

  KenKenPuzzle generate(int level) {
    // Levels 1-5: 3×3, 6-10: 4×4, 11-15: 5×5, 16-20: 6×6
    final size = _sizeForLevel(level);
    final solution = _generateSolution(size);
    final cages = _buildCages(solution, size, level);
    final cageIndex = _buildCageIndex(size, cages);
    return KenKenPuzzle(
        size: size, solution: solution, cages: cages, cageIndex: cageIndex);
  }

  int _sizeForLevel(int level) {
    if (level <= 5) return 3;
    if (level <= 10) return 4;
    if (level <= 15) return 5;
    return 6;
  }

  List<List<int>> _generateSolution(int size) {
    // Latin square: row i = shift base row by i
    final base = List.generate(size, (i) => i + 1);
    return List.generate(size, (row) {
      final shifted = List.generate(size, (col) => base[(col + row) % size]);
      return shifted;
    });
  }

  List<KenKenCage> _buildCages(
      List<List<int>> sol, int size, int level) {
    // Flood-fill random cage groups
    final visited = List.generate(size, (_) => List.filled(size, false));
    final cages = <KenKenCage>[];

    final allCells = [
      for (var r = 0; r < size; r++)
        for (var c = 0; c < size; c++) (r, c)
    ]..shuffle(_rng);

    for (final start in allCells) {
      final (r, c) = start;
      if (visited[r][c]) continue;

      // Decide cage size (1-3, biased by level)
      final maxGroupSize = level <= 5 ? 2 : (level <= 12 ? 3 : 3);
      final groupSize = 1 + _rng.nextInt(maxGroupSize);

      final group = <(int, int)>[];
      final frontier = [(r, c)];
      while (group.length < groupSize && frontier.isNotEmpty) {
        frontier.shuffle(_rng);
        final cell = frontier.removeLast();
        final (cr, cc) = cell;
        if (visited[cr][cc]) continue;
        visited[cr][cc] = true;
        group.add(cell);
        // Add unvisited neighbors
        for (final n in _neighbors(cr, cc, size)) {
          final (nr, nc) = n;
          if (!visited[nr][nc]) frontier.add(n);
        }
      }

      cages.add(_makeCage(group, sol));
    }

    return cages;
  }

  List<(int, int)> _neighbors(int r, int c, int size) {
    final result = <(int, int)>[];
    if (r > 0) result.add((r - 1, c));
    if (r < size - 1) result.add((r + 1, c));
    if (c > 0) result.add((r, c - 1));
    if (c < size - 1) result.add((r, c + 1));
    return result;
  }

  KenKenCage _makeCage(List<(int, int)> group, List<List<int>> sol) {
    final values = group.map((rc) => sol[rc.$1][rc.$2]).toList();

    if (group.length == 1) {
      return KenKenCage(
          cells: group, target: values.first, op: KenKenOp.given);
    }

    // Choose operation
    final sum = values.reduce((a, b) => a + b);
    final product = values.reduce((a, b) => a * b);

    if (group.length == 2) {
      final a = values[0], b = values[1];
      final ops = <KenKenOp>[];
      ops.add(KenKenOp.add);
      ops.add(KenKenOp.mul);
      if ((a - b).abs() > 0) ops.add(KenKenOp.sub);
      final bigger = max(a, b), smaller = min(a, b);
      if (smaller != 0 && bigger % smaller == 0) ops.add(KenKenOp.div);

      final op = ops[_rng.nextInt(ops.length)];
      switch (op) {
        case KenKenOp.add:
          return KenKenCage(cells: group, target: sum, op: KenKenOp.add);
        case KenKenOp.mul:
          return KenKenCage(cells: group, target: product, op: KenKenOp.mul);
        case KenKenOp.sub:
          return KenKenCage(
              cells: group,
              target: (a - b).abs(),
              op: KenKenOp.sub);
        case KenKenOp.div:
          return KenKenCage(
              cells: group,
              target: bigger ~/ smaller,
              op: KenKenOp.div);
        default:
          return KenKenCage(cells: group, target: sum, op: KenKenOp.add);
      }
    }

    // 3+ cells: use add or mul
    if (_rng.nextBool()) {
      return KenKenCage(cells: group, target: sum, op: KenKenOp.add);
    }
    return KenKenCage(cells: group, target: product, op: KenKenOp.mul);
  }

  List<List<int>> _buildCageIndex(int size, List<KenKenCage> cages) {
    final index = List.generate(size, (_) => List.filled(size, -1));
    for (var i = 0; i < cages.length; i++) {
      for (final (r, c) in cages[i].cells) {
        index[r][c] = i;
      }
    }
    return index;
  }
}

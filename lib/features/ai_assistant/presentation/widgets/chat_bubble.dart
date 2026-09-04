import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUser,
  });

  // Strips any residual LaTeX dollar-sign wrappers the model may still emit.
  // e.g.  $$x^2$$  →  x^2   |  $F = ma$  →  F = ma
  String _cleanLatex(String text) {
    // Remove display math: $$...$$
    String result = text.replaceAllMapped(
      RegExp(r'\$\$(.+?)\$\$', dotAll: true),
      (m) => m.group(1)!.trim(),
    );
    // Remove inline math: $...$
    result = result.replaceAllMapped(
      RegExp(r'\$(.+?)\$'),
      (m) => m.group(1)!.trim(),
    );
    // Convert common LaTeX commands to readable symbols
    result = result
        .replaceAll(r'\frac{', '(')
        .replaceAllMapped(RegExp(r'\{(.+?)\}\{(.+?)\}'), (m) => '${m.group(1)} / ${m.group(2)}')
        .replaceAll(r'\sqrt{', '√(')
        .replaceAll(r'\cdot', '×')
        .replaceAll(r'\times', '×')
        .replaceAll(r'\div', '÷')
        .replaceAll(r'\pm', '±')
        .replaceAll(r'\alpha', 'α')
        .replaceAll(r'\beta', 'β')
        .replaceAll(r'\theta', 'θ')
        .replaceAll(r'\pi', 'π')
        .replaceAll(r'\infty', '∞')
        .replaceAll(r'\leq', '≤')
        .replaceAll(r'\geq', '≥')
        .replaceAll(r'\neq', '≠')
        .replaceAll(r'^{2}', '²')
        .replaceAll(r'^{3}', '³')
        .replaceAll(r'^2', '²')
        .replaceAll(r'^3', '³')
        .replaceAll(r'_{}', '')
        .replaceAll(r'\left(', '(')
        .replaceAll(r'\right)', ')')
        .replaceAll(r'\left[', '[')
        .replaceAll(r'\right]', ']')
        .replaceAll(r'\{', '{')
        .replaceAll(r'\}', '}');
    return result;
  }

  /// Parses a line and returns a list of TextSpan for bold (**text**) segments.
  List<TextSpan> _parseLine(String line, Color baseColor) {
    final spans = <TextSpan>[];
    final boldPattern = RegExp(r'\*\*(.+?)\*\*');
    int cursor = 0;

    for (final match in boldPattern.allMatches(line)) {
      if (match.start > cursor) {
        spans.add(TextSpan(
          text: line.substring(cursor, match.start),
          style: TextStyle(color: baseColor, fontSize: 14, height: 1.5),
        ));
      }
      spans.add(TextSpan(
        text: match.group(1),
        style: TextStyle(
          color: baseColor,
          fontSize: 14,
          height: 1.5,
          fontWeight: FontWeight.bold,
        ),
      ));
      cursor = match.end;
    }

    if (cursor < line.length) {
      spans.add(TextSpan(
        text: line.substring(cursor),
        style: TextStyle(color: baseColor, fontSize: 14, height: 1.5),
      ));
    }

    return spans.isEmpty
        ? [TextSpan(text: line, style: TextStyle(color: baseColor, fontSize: 14, height: 1.5))]
        : spans;
  }

  Widget _buildContent(BuildContext context, Color textColor) {
    final cleaned = _cleanLatex(message);
    // Split into lines and render each appropriately
    final lines = cleaned.split('\n');

    final widgets = <Widget>[];
    for (var i = 0; i < lines.length; i++) {
      final rawLine = lines[i];
      final trimmed = rawLine.trimLeft();

      if (trimmed.isEmpty) {
        widgets.add(const SizedBox(height: 6));
        continue;
      }

      // Bullet points: lines starting with *, -, or •
      if (trimmed.startsWith('* ') ||
          trimmed.startsWith('- ') ||
          trimmed.startsWith('• ')) {
        final content = trimmed.substring(2).trim();
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• ',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(children: _parseLine(content, textColor)),
                  ),
                ),
              ],
            ),
          ),
        );
        continue;
      }

      // Formula / code lines: lines that look like equations (contain =, ², ³, ±, √, etc.)
      final isMathLine = RegExp(r'[=²³±√×÷αβθπ∞≤≥≠/]').hasMatch(trimmed) &&
          !trimmed.contains(' is ') &&
          !trimmed.contains(' are ') &&
          trimmed.length < 80;

      if (isMathLine && !isUser) {
        widgets.add(
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFBFDBFE), width: 1),
            ),
            child: Text(
              trimmed,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 14,
                color: Color(0xFF1E40AF),
                height: 1.5,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),
        );
        continue;
      }

      // Normal text line with bold support
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: RichText(
            text: TextSpan(children: _parseLine(trimmed, textColor)),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textColor = isUser ? Colors.white : AppColors.textDark;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.82,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isUser ? AppColors.primaryBlue : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(isUser ? 18 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: _buildContent(context, textColor),
      ),
    );
  }
}

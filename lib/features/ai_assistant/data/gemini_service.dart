import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final List<String> apiKeys;
  final List<List<String>> _keyModelSets;
  int _currentKeyIndex = 0;

  GeminiService({required this.apiKeys})
      : _keyModelSets = List.generate(
          apiKeys.length,
          (index) => index == 0
              ? ['gemini-2.5-flash-lite']
              : ['gemini-flash-latest', 'gemini-2.5-flash-lite'],
        ) {
    if (apiKeys.isEmpty) {
      throw ArgumentError('At least one Gemini API key is required.');
    }
  }

  Future<String> askDoubt(String question) async {
    final errors = <String>[];

    for (var keyAttempt = 0; keyAttempt < apiKeys.length; keyAttempt++) {
      final keyIndex = (_currentKeyIndex + keyAttempt) % apiKeys.length;
      final apiKey = apiKeys[keyIndex];
      final models = _keyModelSets[keyIndex];

      for (final modelName in models) {
        try {
          final result = await _sendWithRetries(apiKey, modelName, question);
          _currentKeyIndex = keyIndex;
          return result;
        } catch (error, stackTrace) {
          final message = error.toString();
          print('Gemini askDoubt error with key #${keyIndex + 1}, model $modelName: $message');
          print('$stackTrace');
          errors.add('key#${keyIndex + 1} $modelName: $message');

          if (!_isRetryable(error)) {
            return 'AI request failed: $message';
          }
        }
      }

      if (keyAttempt < apiKeys.length - 1) {
        print('Switching to next Gemini API key.');
      }
    }

    return 'AI request failed after trying all configured Gemini API keys and models. ${errors.join(' | ')}';
  }

  Future<String> _sendWithRetries(String apiKey, String modelName, String question) async {
    const maxAttempts = 3;

    for (var attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        final response = await _createChatSession(apiKey, modelName).sendMessage(
          Content.text(question),
        );

        return response.text ?? 'Sorry, I could not answer that. Please try again.';
      } catch (error) {
        if (attempt < maxAttempts && _isRetryable(error)) {
          final delay = Duration(seconds: attempt * 2);
          print('Retry $attempt for model $modelName after ${delay.inSeconds}s: $error');
          await Future.delayed(delay);
          continue;
        }

        rethrow;
      }
    }

    throw Exception('AI request failed after $maxAttempts retries.');
  }

  ChatSession _createChatSession(String apiKey, String modelName) {
    final model = GenerativeModel(
      model: modelName,
      apiKey: apiKey,
      systemInstruction: _systemInstruction(),
    );

    return model.startChat();
  }

  void _rotateKey() {
    _currentKeyIndex = (_currentKeyIndex + 1) % apiKeys.length;
  }

  bool _isRetryable(Object error) {
    final message = error.toString().toLowerCase();
    return message.contains('503') ||
        message.contains('server error') ||
        message.contains('high demand') ||
        message.contains('temporarily') ||
        message.contains('unavailable');
  }

  Content _systemInstruction() {
    return Content.system(
      'You are a Class 10 NEB tutor. Be concise and direct. '
      'STRICT FORMATTING RULES — follow these exactly every time: '
      '1. NEVER use LaTeX or TeX notation. NEVER wrap anything in dollar signs like \$...\$ or \$\$...\$\$. '
      '2. Write all math in plain readable text. Examples: '
      '   - Write "a² + b²" not "\$a^2 + b^2\$" '
      '   - Write "(a + b)² = a² + 2ab + b²" not "\$\$(a+b)^2 = a^2 + 2ab + b^2\$\$" '
      '   - Write "F = ma" not "\$F = ma\$" '
      '   - Write "√(a² + b²)" not "\$\\sqrt{a^2+b^2}\$" '
      '   - Write "x = (-b ± √(b²-4ac)) / 2a" not LaTeX form '
      '3. Keep answers SHORT and to the point. '
      '   - For formulas: state the formula, one-line meaning, done. '
      '   - For concepts: 2-3 sentences max unless steps are needed. '
      '   - For problems: show steps clearly but without extra commentary. '
      '4. Use ** for bold. Use bullet points with • for lists. '
      '5. Do NOT add motivational filler phrases like "Great question!" or "I hope that helps!". '
      '6. Respond in simple English. Use Nepali only if the student writes in Nepali. '
      'Scope: Class 10 NEB — Math, Science, English, Nepali, Social Studies, '
      'Health & PE, Computer Science, Optional Math. '
      'If outside scope, say so in one line and redirect.',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../domain/chat_message.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/chat_input_bar.dart';
import '../data/gemini_service.dart';
import '../../../core/widgets/bottom_nav_bar.dart';

class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({super.key});

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _inputFocusNode = FocusNode();

  final List<ChatMessage> _messages = [
    ChatMessage(
      message:
          'Hi! I am your Class 10 study assistant. Ask me about Math, Science, formulas, definitions, or examples.',
      isUser: false,
      createdAt: DateTime.now(),
    ),
  ];

  bool _isLoading = false;
  GeminiService? _geminiService;

  // Track scroll direction to dismiss keyboard on scroll down
  double _lastScrollOffset = 0;

  @override
  void initState() {
    super.initState();
    final apiKeys = _loadApiKeys();
    debugPrint('Gemini API keys loaded: ${apiKeys.length}');
    if (apiKeys.isEmpty) {
      debugPrint('Warning: No Gemini API keys found. Please verify .env and pubspec assets.');
    } else {
      _geminiService = GeminiService(apiKeys: apiKeys);
    }

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final current = _scrollController.offset;
    // Scrolling down (content moves up) → dismiss keyboard
    if (current > _lastScrollOffset + 8) {
      FocusScope.of(context).unfocus();
    }
    _lastScrollOffset = current;
  }

  List<String> _loadApiKeys() {
    final env = dotenv.env;
    final keys = <String>[];

    void addKeys(String? raw) {
      if (raw?.isNotEmpty != true) return;
      keys.addAll(raw!
          .split(',')
          .map((key) => key.trim())
          .where((key) => key.isNotEmpty));
    }

    addKeys(env['GEMINI_API_KEY']);
    addKeys(env['GEMINI_API_KEYS']);

    for (var index = 2; index <= 6; index++) {
      addKeys(env['GEMINI_API_KEY_$index']);
    }

    return keys.toSet().toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  Future<void> _sendMessage([String? quickMessage]) async {
    if (_geminiService == null) {
      setState(() {
        _messages.add(ChatMessage(
          message:
              'No Gemini API key configured. Add GEMINI_API_KEY or GEMINI_API_KEYS to your .env file.',
          isUser: false,
          createdAt: DateTime.now(),
        ));
      });
      return;
    }

    final text = quickMessage ?? _controller.text.trim();
    if (text.isEmpty) return;

    // Dismiss keyboard after sending
    FocusScope.of(context).unfocus();

    setState(() {
      _messages.add(
          ChatMessage(message: text, isUser: true, createdAt: DateTime.now()));
      _isLoading = true;
    });

    _controller.clear();

    // Scroll to bottom after user message
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    final answer = await _geminiService!.askDoubt(text);

    setState(() {
      _messages.add(ChatMessage(
          message: answer, isUser: false, createdAt: DateTime.now()));
      _isLoading = false;
    });

    // Scroll to bottom after AI response
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
      // resizeToAvoidBottomInset keeps the input bar above the keyboard
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'AI Assistant',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Ask for explanations, formulas, and examples',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _quickPrompt('Explain trigonometry'),
                        const SizedBox(width: 8),
                        _quickPrompt('What is Ohm\u2019s Law?'),
                        const SizedBox(width: 8),
                        _quickPrompt('Give me a science quiz'),
                        const SizedBox(width: 8),
                        _quickPrompt('Important formulas'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── Chat list ────────────────────────────────────────────
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                itemCount: _messages.length + (_isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (_isLoading && index == _messages.length) {
                    return const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: _TypingIndicator(),
                      ),
                    );
                  }
                  final message = _messages[index];
                  return ChatBubble(
                    message: message.message,
                    isUser: message.isUser,
                  );
                },
              ),
            ),

            // ── Input bar ────────────────────────────────────────────
            ChatInputBar(
              controller: _controller,
              focusNode: _inputFocusNode,
              onSend: () => _sendMessage(),
              enabled: !_isLoading && _geminiService != null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickPrompt(String text) {
    return InkWell(
      onTap: () => _sendMessage(text),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xFFDBEAFE)),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF1D4ED8),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

// Simple animated typing indicator (three bouncing dots)
class _TypingIndicator extends StatefulWidget {
  const _TypingIndicator();

  @override
  State<_TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<_TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _dotAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();

    _dotAnimations = List.generate(3, (i) {
      return Tween<double>(begin: 0, end: -6).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(i * 0.2, 0.6 + i * 0.2, curve: Curves.easeInOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomRight: Radius.circular(18),
          bottomLeft: Radius.circular(4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) => Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            return Transform.translate(
              offset: Offset(0, _dotAnimations[i].value),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: Color(0xFF94A3B8),
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

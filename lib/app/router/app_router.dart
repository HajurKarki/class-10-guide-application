import 'package:flutter/material.dart';

import 'route_names.dart';

import '../../features/splash/presentation/splash_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/subjects/presentation/subjects_screen.dart';
import '../../features/subjects/presentation/chapter_list_screen.dart';
import '../../features/subjects/presentation/chapter_content_screen.dart';
import '../../features/quiz/presentation/quiz_subject_screen.dart';
import '../../features/quiz/presentation/quiz_chapter_list_screen.dart';
import '../../features/quiz/presentation/quiz_screen.dart';
import '../../features/quiz/presentation/quiz_result_screen.dart';
import '../../features/subjects/domain/chapter_content_model.dart';
import '../../features/quiz/domain/quiz_result.dart';
import '../../features/ai_assistant/presentation/ai_assistant_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/about_developer_screen.dart';
import '../../features/games/presentation/game_hub_screen.dart';
import '../../features/games/presentation/game_level_screen.dart';
import '../../features/games/presentation/sudoku_screen.dart';
import '../../features/games/presentation/kenken_screen.dart';
import '../../features/games/presentation/crossword_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteNames.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RouteNames.subjects:
        return MaterialPageRoute(builder: (_) => const SubjectsScreen());

      case RouteNames.chapters:
        final args = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (_) => ChapterListScreen(
            subjectId: args['subjectId'] as String,
            subjectName: args['subjectName'] as String,
          ),
        );

      case RouteNames.quizSubject:
        return MaterialPageRoute(builder: (_) => const QuizSubjectScreen());

      case RouteNames.quizChapters:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => QuizChapterListScreen(
            subjectId: args['subjectId'] as String,
            subjectName: args['subjectName'] as String,
          ),
        );

      case RouteNames.quiz:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => QuizScreen(
            subjectId: args['subjectId'] as String,
            subjectName: args['subjectName'] as String,
            chapterTitle: args['chapterTitle'] as String,
          ),
        );

      case RouteNames.quizResult:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => QuizResultScreen(
            result: args['result'] as QuizResult,
            questions: (args['questions'] as List).cast<MCQItem>(),
            selectedAnswers: (args['selectedAnswers'] as List).cast<int?>(),
          ),
        );

      case RouteNames.aiAssistant:
        return MaterialPageRoute(builder: (_) => const AiAssistantScreen());

      case RouteNames.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case RouteNames.aboutDeveloper:
        return MaterialPageRoute(builder: (_) => const AboutDeveloperScreen());

      case RouteNames.games:
        return MaterialPageRoute(builder: (_) => const GameHubScreen());

      case RouteNames.gameLevel:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => GameLevelScreen(game: args['game'] as String),
        );

      case RouteNames.sudoku:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => SudokuScreen(level: args['level'] as int),
        );

      case RouteNames.kenken:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => KenKenScreen(level: args['level'] as int),
        );

      case RouteNames.crossword:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => CrosswordScreen(level: args['level'] as int),
        );

      case RouteNames.chapterContent:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ChapterContentScreen(
            chapterId: args['chapterId'] as String,
            chapterTitle: args['chapterTitle'] as String,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }
}
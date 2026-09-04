import 'package:flutter/material.dart';
import '../domain/onboarding_model.dart';
import 'widgets/onboarding_indicator.dart';
import 'widgets/onboarding_page_iteam.dart';
import '../../../app/router/route_names.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<OnboardingModel> pages = const [
    OnboardingModel(
      image: 'assets/images/onboarding/onboarding_welcome.png',
      title: 'Welcome to\nClass 10 Math & Science Guide',
      subtitle: 'Your all-in-one learning companion for Class 10 students.',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding/onboarding_learn.png',
      title: 'Learn Better\nEveryday',
      subtitle:
          'Study Math and Science with easy explanations, examples and visuals.',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding/onboarding_practice.png',
      title: 'Practice. Track.\nSucceed.',
      subtitle: 'Practice quizzes, track your progress and achieve your goals.',
    ),
  ];

  void _goToNextPage() {
    if (currentIndex == pages.length - 1) {
      Navigator.pushReplacementNamed(context, RouteNames.home);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skipOnboarding() {
    Navigator.pushReplacementNamed(context, RouteNames.home);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = currentIndex == pages.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _skipOnboarding,
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xFF2563EB),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingPageItem(page: pages[index]);
                  },
                ),
              ),

              OnboardingIndicator(
                currentIndex: currentIndex,
                itemCount: pages.length,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _goToNextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    isLastPage ? 'Get Started' : 'Next',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
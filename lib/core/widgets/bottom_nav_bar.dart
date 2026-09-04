import 'package:flutter/material.dart';

import '../../app/router/route_names.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  void _navigate(BuildContext context, int index) {
    if (index == currentIndex) return;

    String routeName;

    switch (index) {
      case 0:
        routeName = RouteNames.home;
        break;
      case 1:
        routeName = RouteNames.subjects;
        break;
      case 2:
        routeName = RouteNames.quizSubject;
        break;
      case 3:
        routeName = RouteNames.games;
        break;
      case 4:
        routeName = RouteNames.aiAssistant;
        break;
      case 5:
        routeName = RouteNames.profile;
        break;
      default:
        routeName = RouteNames.home;
    }

    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) => _navigate(context, index),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.menu_book_outlined),
          selectedIcon: Icon(Icons.menu_book),
          label: 'Subjects',
        ),
        NavigationDestination(
          icon: Icon(Icons.quiz_outlined),
          selectedIcon: Icon(Icons.quiz),
          label: 'Quiz',
        ),
        NavigationDestination(
          icon: Icon(Icons.games_outlined),
          selectedIcon: Icon(Icons.games),
          label: 'Games',
        ),
        NavigationDestination(
          icon: Icon(Icons.smart_toy_outlined),
          selectedIcon: Icon(Icons.smart_toy),
          label: 'AI',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

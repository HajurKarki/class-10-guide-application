import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'router/route_names.dart';
import 'theme/app_theme.dart';

class ClassTenApp extends StatelessWidget {
  const ClassTenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class 10 Math & Science Guide',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
import 'package:flutter/material.dart';
import '../../domain/onboarding_model.dart';

class OnboardingPageItem extends StatelessWidget {
  final OnboardingModel page;

  const OnboardingPageItem({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          page.image,
          height: 280,
          fit: BoxFit.contain,
        ),

        const SizedBox(height: 40),

        Text(
          page.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 27,
            height: 1.2,
            fontWeight: FontWeight.bold,
            color: Color(0xFF07133D),
          ),
        ),

        const SizedBox(height: 18),

        Text(
          page.subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            height: 1.5,
            color: Color(0xFF4A5875),
          ),
        ),
      ],
    );
  }
}
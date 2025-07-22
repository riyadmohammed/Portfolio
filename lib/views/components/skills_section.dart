import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final skills = const [
    "Flutter",
    "Dart",
    "Firebase",
    "REST APIs",
    "UI/UX",
    "Git",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Skills', style: TextStyle(fontSize: 24)),
        const SizedBox(height: 8),
        AnimatedTextKit(
          animatedTexts: skills
              .map((skill) => TyperAnimatedText(skill,
              textStyle: const TextStyle(fontSize: 20)))
              .toList(),
          repeatForever: true,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:observable_accessibility/features/onboarding/onboarding_images.dart';
import 'package:observable_accessibility/features/onboarding/widgets/onbording_page_view.dart';

class OnbordingPage extends StatelessWidget {
  OnbordingPage({super.key});

  final List<Map<String, String>> onbordingText = [
    {
      'title': 'Schedule an appointment',
      'subtitle': 'It is very easy to schedule an appointment',
      'image': OnboardingImages.booking,
    },
    {
      'title': 'Select a date',
      'subtitle': 'First you can select a date',
      'image': OnboardingImages.booking1,
    },
    {
      'title': 'Select time',
      'subtitle': 'Then select a time',
      'image': OnboardingImages.booking2,
    },
    {
      'title': 'See all your appointments',
      'subtitle': 'Check all your appointments and delete them if needed',
      'image': OnboardingImages.booking3,
    },
    {
      'title': 'Get notified',
      'subtitle': 'If you schedule on web you\'ll receive a push notification',
      'image': OnboardingImages.booking4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial'),
      ),
      body: PageView.builder(
        itemCount: onbordingText.length,
        itemBuilder: (context, index) {
          return OnbordingPageView(
            svg: onbordingText[index]['image'] ?? '',
            title: onbordingText[index]['title'] ?? '',
            subtitle: onbordingText[index]['subtitle'] ?? '',
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:observable_accessibility/features/onboarding/models/onboarding_step.dart';
import 'package:observable_accessibility/features/onboarding/widgets/onbording_step_page_view.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial'),
      ),
      body: PageView.builder(
        itemCount: OnboardingStep.values.length,
        itemBuilder: (context, index) => OnboardingStepPageView(
          onboardingStep: OnboardingStep.values[index],
        ),
      ),
    );
  }
}

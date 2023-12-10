import 'package:flutter/material.dart';
import 'package:observable_accessibility/features/onboarding/models/onboarding_step.dart';
import 'package:observable_accessibility/features/onboarding/widgets/onbording_step_page_view.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial'),
      ),
      body: MergeSemantics(
        child: Semantics(
          liveRegion: true,
          onScrollDown: () => _setPageIndex(_pageController.page!.toInt() - 1),
          onScrollUp: () => _setPageIndex(_pageController.page!.toInt() + 1),
          onIncrease: () => _setPageIndex(_pageController.page!.toInt() + 1),
          onDecrease: () => _setPageIndex(_pageController.page!.toInt() - 1),
          child: PageView.builder(
            controller: _pageController,
            itemCount: OnboardingStep.values.length,
            itemBuilder: (context, index) => OnboardingStepPageView(
              onboardingStep: OnboardingStep.values[index],
            ),
          ),
        ),
      ),
    );
  }

  void _setPageIndex(int index) {
    print('fishes');
    if (index >= 0 && index < OnboardingStep.values.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}

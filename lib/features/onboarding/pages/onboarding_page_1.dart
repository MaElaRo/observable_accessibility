import 'package:flutter/material.dart';
import 'package:observable_accessibility/features/onboarding/models/onboarding_step.dart';
import 'package:observable_accessibility/features/onboarding/widgets/onbording_step_page_view.dart';

class OnboardingPage1 extends StatefulWidget {
  const OnboardingPage1({super.key});

  @override
  State<OnboardingPage1> createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {
  late PageController _pageController;

  var _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.toInt() ?? 0;
      });
    });
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
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: OnboardingStep.values.length,
            itemBuilder: (context, index) => OnboardingStepPageView(
              onboardingStep: OnboardingStep.values[index],
            ),
          ),
          // Buttons to make navigation easier.
          if (MediaQuery.of(context).accessibleNavigation)
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_currentPage > 0)
                    IconButton(
                      tooltip: 'Go back',
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => _setPageIndex(
                        _pageController.page!.toInt() - 1,
                      ),
                    )
                  else
                    const Spacer(),
                  if (_currentPage < OnboardingStep.values.length - 1)
                    IconButton(
                      tooltip: 'Go forward',
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () => _setPageIndex(
                        _pageController.page!.toInt() + 1,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _setPageIndex(int index) {
    if (index >= 0 && index < OnboardingStep.values.length) {
      setState(() {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }
}

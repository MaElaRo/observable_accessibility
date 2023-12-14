import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatefulWidget {
  const PageIndicator({
    Key? key,
    required this.pagesCount,
    required this.controller,
  }) : super(key: key);

  final int pagesCount;
  final PageController controller;

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  final _currentPageIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      _currentPageIndex.value = widget.controller.page!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    // We need to rebuild the widget tree whenever the current page changes
    // so the label will be updated
    return ValueListenableBuilder<int>(
      valueListenable: _currentPageIndex,
      builder: (_, value, child) {
        return
            // Only adding semantics will read the same thing over on over again
            Semantics(
          label:
              'Page ${(_currentPageIndex.value % (widget.pagesCount) + 1)} of ${widget.pagesCount}',
          child: Center(
            // We want to ignore any semantics from the custom package widget
            // if we want to have our own and the one provided make no sense
            // in our app context
            child: ExcludeSemantics(
              child: SmoothPageIndicator(
                controller: widget.controller,
                count: widget.pagesCount,
                effect: const ExpandingDotsEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  strokeWidth: 4,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.amber,
                  expansionFactor: 2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

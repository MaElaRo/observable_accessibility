import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnbordingPageView extends StatelessWidget {
  const OnbordingPageView({
    super.key,
    required this.svg,
    required this.title,
    required this.subtitle,
  });

  final String svg;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SVG Image
          SvgPicture.asset(
            svg,
            height: 200.0,
          ),
          const SizedBox(height: 20.0),
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          // Subtitle
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

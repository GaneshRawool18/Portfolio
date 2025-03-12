import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget tabletScreen;
  final Widget desktopScreen;

  ResponsiveLayout({
    required this.mobileScreen,
    required this.tabletScreen,
    required this.desktopScreen,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      return mobileScreen; // Mobile View
    } else if (screenWidth < 1100) {
      return tabletScreen; // Tablet View
    } else {
      return desktopScreen; // Desktop View
    }
  }
}

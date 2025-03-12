import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  /// Scroll to a specific section
  void scrollToSection(int index, BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    scrollController.animateTo(
      screenHeight * index,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
    notifyListeners(); // Notify UI updates
  }
}

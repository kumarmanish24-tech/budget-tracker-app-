import 'package:flutter/material.dart';

class ContainerController {
  // 1. Data Source
  final List<String> options = ['Home State', 'Settings State', 'Profile State'];

  // 2. State variable tracking the active index
  int selectedIndex = 0;

  // 3. Logic to update the index
  void updateIndex(int newIndex) {
    if (newIndex >= 0 && newIndex < options.length) {
      selectedIndex = newIndex;
    }
  }

  // 4. Getter logic for dynamic colors
  Color get containerColor {
    switch (selectedIndex) {
      case 0: return Colors.blue;
      case 1: return Colors.green;
      case 2: return Colors.orange;
      default: return Colors.grey;
    }
  }

  // 5. Getter logic for dynamic text strings
  String get displayInlineText {
    switch (selectedIndex) {
      case 0: return 'Active: Home';
      case 1: return 'Active: Settings';
      case 2: return 'Active: Profile';
      default: return 'Unknown State';
    }
  }

  // 6. Getter logic for dynamic border radius values
  double get cornerRadius {
    switch (selectedIndex) {
      case 0: return 15.0;
      case 1: return 30.0;
      case 2: return 0.0;
      default: return 8.0;
    }
  }
}

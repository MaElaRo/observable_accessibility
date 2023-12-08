import 'package:flutter/material.dart';

enum BottomTab {
  tutorial('Tutorial'),
  addAppointement('Add Appointement'),
  appointementList('Appointement List');

  const BottomTab(this.title);

  final String title;

  IconData getIconData({required bool isSelected}) {
    switch (this) {
      case BottomTab.tutorial:
        return Icons.info_outline;
      case BottomTab.addAppointement:
        return Icons.add;
      case BottomTab.appointementList:
        return Icons.list;
    }
  }
}

import 'package:flutter/material.dart';

class NavBarItemWidget {
  BottomNavigationBarItem TabItem(String label, IconData _icon) {
    return BottomNavigationBarItem(
      icon: Icon(_icon),
      label: label,
      backgroundColor: Colors.white,
    );
  }
}

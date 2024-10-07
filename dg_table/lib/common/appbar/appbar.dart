import 'package:flutter/material.dart';

class UnibagAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xFF6E58FF),
      title: const Text(
        '학점가방',
        style: TextStyle(fontFamily: 'MalangBold'),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
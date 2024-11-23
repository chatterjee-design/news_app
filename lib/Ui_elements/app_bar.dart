import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool backButton;
  final String title;

  const CustomAppBar({
    Key? key,
    required this.backButton,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0); // Height of the app bar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFDFCEE8),
      // automaticallyImplyLeading: false,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87, // Text color
        ),
      ),
      leading: backButton
          ? IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      )
          : null,
    );
  }
}

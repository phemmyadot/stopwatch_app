import 'package:flutter/material.dart';
import 'package:stopwatch_app/environment.dart';
import '../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppEnvironment.title,
        style: const TextStyle(
          fontSize: 24,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      centerTitle: true,
      elevation: 5,
      backgroundColor: AppColors.primaryColor,
    );
  }
}

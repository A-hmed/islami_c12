import 'package:flutter/material.dart';
import 'package:islami_c12/ui/utils/app_colors.dart';

abstract class AppStyles {
  static TextStyle appBarText = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.accent);

  static TextStyle semiBoldAccent = const TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: AppColors.accent);
  static TextStyle regularAccent = const TextStyle(
      fontSize: 25, fontWeight: FontWeight.w400, color: AppColors.accent);
}

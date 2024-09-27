import 'package:flutter/material.dart';
import 'package:islami_c12/ui/utils/app_styles.dart';

AppBar buildAppBar([String text = "Islami"]) {
  return AppBar(
    title: Text(
      text,
      style: AppStyles.appBarText,
    ),
    backgroundColor: Colors.transparent,
    centerTitle: true,
  );
}

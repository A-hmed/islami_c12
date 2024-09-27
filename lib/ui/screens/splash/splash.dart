import 'package:flutter/material.dart';
import 'package:islami_c12/ui/screens/home/home.dart';
import 'package:islami_c12/ui/utils/app_assets.dart';

class Splash extends StatelessWidget {
  static const String routeName = "splash";

  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Home.routeName);
    });
    return Scaffold(
      body: Image.asset(AppAssets.splash),
    );
  }
}

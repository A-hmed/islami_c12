import 'package:flutter/material.dart';
import 'package:islami_c12/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_c12/ui/screens/home/home.dart';
import 'package:islami_c12/ui/screens/splash/splash.dart';
import 'package:islami_c12/ui/screens/sura_details/sura_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.routeName: (_) => const Home(),
        Splash.routeName: (_) => const Splash(),
        SuraDetails.routeName: (_) => const SuraDetails(),
        HadethDetails.routeName: (_) => const HadethDetails()
      },
      initialRoute: Home.routeName,
    );
  }
}

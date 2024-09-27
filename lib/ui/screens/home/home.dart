import 'package:flutter/material.dart';
import 'package:islami_c12/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_c12/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_c12/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_c12/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_c12/ui/utils/app_assets.dart';
import 'package:islami_c12/ui/utils/app_colors.dart';
import 'package:islami_c12/ui/widgets/app_bar.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 1;
  List<Widget> tabs = [QuranTab(), AhadethTab(), SebhaTab(), RadioTab()];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.mainBackground))),
      child: Scaffold(
        appBar: buildAppBar(),
        body: tabs[currentIndex],
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: buildBottomNavBar(),
      ),
    );
  }

  Widget buildBottomNavBar() {
    return Theme(
      data: ThemeData(canvasColor: AppColors.primary),
      child: BottomNavigationBar(
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          currentIndex: currentIndex,
          backgroundColor: Colors.blue,
          selectedItemColor: AppColors.accent,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icQuran)), label: "Quran"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),
                label: "Ahadeth"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: "Sebha"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icRadio)), label: "Radio"),
          ]),
    );
  }
}

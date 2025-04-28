import 'package:flutter/material.dart';
import 'package:islamy/ui/screens/home/taps/ahadeth/ahadeth_tap.dart';
import 'package:islamy/ui/screens/home/taps/pray_time/pray_time_tap.dart';
import 'package:islamy/ui/screens/home/taps/quran/quran_tap.dart';
import 'package:islamy/ui/screens/home/taps/radio/radio_tap.dart';
import 'package:islamy/ui/screens/home/taps/sebha/sebha_tap.dart';
import 'package:islamy/ui/utils/app_assets.dart';
import 'package:islamy/ui/utils/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> taps = [
    QuranTap(),
    AhadethTap(),
    SebhaTap(),
    RadioTap(),
    PrayTimeTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: taps[currentIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Theme(
      data: ThemeData(canvasColor: AppColors.gold),
      child: BottomNavigationBar(
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppAssets.quran),
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppAssets.ahadeth),
            ),
            label: 'ahadeth',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppAssets.sebha),
            ),
            label: 'sebha',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppAssets.radio),
            ),
            label: 'radio',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppAssets.time),
            ),
            label: 'time',
          ),
        ],
      ),
    );
  }
}

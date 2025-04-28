import 'package:flutter/material.dart';
import 'package:islamy/ui/model/sura.dart';
import 'package:islamy/ui/screens/splash/splash.dart';
import 'package:islamy/ui/utils/constants.dart';

void main() {
  for (int i = 0; i < Constants.arabicQuranSuras.length; i++) {
    Constants.suras.add(
      Sura(
          nameAr: Constants.arabicQuranSuras[i],
          nameEn: Constants.englishQuranSuras[i],
          numVerses: Constants.numVersrs[i],
          suraNum: i + 1),
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

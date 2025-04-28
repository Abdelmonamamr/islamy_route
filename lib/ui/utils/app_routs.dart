import 'package:flutter/material.dart';
import 'package:islamy/ui/model/sura.dart';
import 'package:islamy/ui/screens/sura_details/sura_details.dart';

import '../screens/home/home.dart';

abstract final class AppRouts {
  static Route home = MaterialPageRoute(builder: (_) => Home());

  static suraDetails(Sura sura) {
    return MaterialPageRoute(builder: (_) => SuraDetails(sura: sura));
  }
}

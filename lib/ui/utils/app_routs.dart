import 'package:flutter/material.dart';

import '../screens/home/home.dart';

abstract final class AppRouts {
  static Route home = MaterialPageRoute(builder: (_) => Home());
}

import 'package:flutter/material.dart';

class ColorApp {
  static ColorApp? _instance;

  ColorApp._();

  static ColorApp get instance {
    _instance ??= ColorApp._();
    return _instance!;
  }

  Color get primary => Color(0XFFFFCC00);
  Color get secondary => const Color(0XFFF8880C);
}

extension ColorsAppExcetions on BuildContext {
  ColorApp get colors => ColorApp.instance;
}

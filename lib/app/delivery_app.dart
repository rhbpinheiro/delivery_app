import 'package:delivery_app/app/core/provider/aplication_binding.dart';
import 'package:delivery_app/app/core/ui/theme/theme_config.dart';
import 'package:flutter/material.dart';

import 'pages/home/home_router.dart';
import 'pages/splash/splash_page.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        title: "Delivery App",
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
        },
      ),
    );
  }
}

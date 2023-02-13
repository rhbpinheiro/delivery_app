import 'package:delivery_app/app/core/provider/aplication_binding.dart';
import 'package:delivery_app/app/core/ui/theme/theme_config.dart';
import 'package:delivery_app/app/pages/auth/login/login_page.dart';
import 'package:delivery_app/app/pages/auth/register/register_page.dart';
import 'package:delivery_app/app/pages/order/order_page.dart';
import 'package:delivery_app/app/pages/product_detail/product_detail_page.dart';
import 'package:delivery_app/app/pages/product_detail/product_detail_router.dart';
import 'package:flutter/material.dart';

import 'pages/auth/login/login_router.dart';
import 'pages/auth/register/register_router.dart';
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
          '/productDetail':(context) => ProductDetailRouter.page,
          '/auth/login':(context) => LoginRouter.page,
          '/auth/register':(context) => RegisterRouter.page,
          '/order':(context) => const OrderPage(),
        },
      ),
    );
  }
}

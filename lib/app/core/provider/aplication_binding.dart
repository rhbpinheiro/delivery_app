// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery_app/app/core/rest_client/custon_dio.dart';
import 'package:delivery_app/app/repositories/products/auth/auth_repository.dart';
import 'package:delivery_app/app/repositories/products/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AplicationBinding extends StatelessWidget {
  final Widget child;
  const AplicationBinding({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomDio(),
        ),
        Provider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            dio: context.read(),
          ),
        )
      ],
      child: child,
    );
  }
}

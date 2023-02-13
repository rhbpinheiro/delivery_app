import 'dart:developer';

import 'package:delivery_app/app/core/exceptions/repository_exception.dart';
import 'package:delivery_app/app/core/exceptions/unauthorized_exception.dart';
import 'package:delivery_app/app/core/rest_client/custon_dio.dart';
import 'package:delivery_app/app/models/auth_model.dart';
import 'package:delivery_app/app/repositories/products/auth/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;
  AuthRepositoryImpl({
    required this.dio,
  });

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
  final result = await dio.unauth().post('/auth', data: {
    'email': email,
    'password': password,
  });
    return AuthModel.fromMap(result.data);
  
} on DioError catch (e , s) {
  if(e.response?.statusCode == 403) {
    log('Permissão negada', error: e, stackTrace: s);
      throw UnauthorizedException();
  }
  log('Erro ao realizar login', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar login');
}
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await dio.unauth().post('/users', data: {
        'name': name,
        'email': email,
        'password': password,
      });
    } on DioError catch (e, s) {
      log('Erro ao registar usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registar usuário');
    }
  }
}

import 'dart:developer';

import 'package:delivery_app/app/pages/auth/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:delivery_app/app/repositories/products/auth/auth_repository.dart';

class RegisterController extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterController(
    this._authRepository,
  ) : super(
          RegisterState.initial(),
        );

  Future<void> register(String name, String email, String password) async {
    try {
      emit(state.copyWith(status: RegisterStatus.register));
      await _authRepository.register(name, email, password);
      emit(state.copyWith(status: RegisterStatus.success));
    } catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      emit(state.copyWith(status: RegisterStatus.error));
    }
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:delivery_app/app/core/exceptions/unauthorized_exception.dart';
import 'package:delivery_app/app/pages/auth/login/login_state.dart';
import 'package:delivery_app/app/repositories/products/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginController(this._authRepository) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));
      final authModel = await _authRepository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      sp.setString('accessToken', authModel.accessToken);
      sp.setString('refreshToken', authModel.refreshToken);
      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedException catch (e, s) {
      log('Login ou senha inválidos', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: LoginStatus.loginError,
            errorMessage: 'Login ou senha inválidos'),
      );
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: LoginStatus.error, errorMessage: 'Erro ao realizar login'),
      );
    }
  }
}

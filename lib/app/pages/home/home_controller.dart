// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:delivery_app/app/pages/home/home_state.dart';
import 'package:delivery_app/app/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(
    this._productsRepository,
  ) : super(
          const HomeState.initial(),
        );

  Future<void> loadProducts() async {
    emit(
      state.copyWith(status: HomeStateStatus.loading),
    );
    try {
      final products = await _productsRepository.find();
      emit(
        state.copyWith(status: HomeStateStatus.loaded, products: products),
      );
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: HomeStateStatus.error,
            errorMessage: "Erro ao buscar Produtos"),
      );
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:delivery_app/app/dto/order_product_dto.dart';
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

  void addOrUpdateBag(OrderProductDto orderProduct) {
    final shoppingBag = [...state.shoppingBag];
    final orderIndex = shoppingBag
        .indexWhere((orderP) => orderP.product == orderProduct.product);

    if (orderIndex > -1) {
      if (orderProduct.amount == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProduct;
      }
    }else{
       shoppingBag.add(orderProduct);
    }

    emit(state.copyWith(shoppingBag: shoppingBag));
  }
}

import 'dart:developer';

import 'package:delivery_app/app/core/exceptions/repository_exception.dart';
import 'package:delivery_app/app/core/rest_client/custon_dio.dart';
import 'package:delivery_app/app/models/product_model.dart';
import 'package:dio/dio.dart';

import './products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final CustomDio dio;
  ProductsRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<ProductModel>> find() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data
          .map<ProductModel>(
            (p) => ProductModel.fromMap(p),
          )
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produtos');
    }
  }
}

import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/services/results.dart';
import 'package:ecommerce_app/features/home/data/models/product_model.dart';

abstract class HomeRepo {
  Future<Results<List<ProductModel>, ErrorFailure>> getAllData();
  Future<Results<List<ProductModel>, ErrorFailure>> getBags();
  Future<Results<List<ProductModel>, ErrorFailure>> getShoes();
  Future<Results<List<ProductModel>, ErrorFailure>> getClothes();
}

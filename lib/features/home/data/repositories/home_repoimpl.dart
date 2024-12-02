import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/errors/server_error.dart';
import 'package:ecommerce_app/core/services/results.dart';
import 'package:ecommerce_app/features/home/data/datasources/remote/home_remote_datasource.dart';
import 'package:ecommerce_app/features/home/data/models/product_model.dart';
import 'package:ecommerce_app/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDatasource _remoteDatasource;

  HomeRepoImpl({required HomeRemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;
  @override
  Future<Results<List<ProductModel>, ErrorFailure>> getAllData() async {
    try {
      final List<ProductModel> data = await _remoteDatasource.getAllData();
      return Results.success(data: data);
    } on ServerError catch (e) {
      return Results.failure(error: ErrorFailure(message: e.errorMessage));
    }
  }

  @override
  Future<Results<List<ProductModel>, ErrorFailure>> getBags() async {
    try {
      final List<ProductModel> data = await _remoteDatasource.getBags();
      return Results.success(data: data);
    } on ServerError catch (e) {
      return Results.failure(error: ErrorFailure(message: e.errorMessage));
    }
  }

  @override
  Future<Results<List<ProductModel>, ErrorFailure>> getClothes() async {
    try {
      final List<ProductModel> data = await _remoteDatasource.getClothes();
      return Results.success(data: data);
    } on ServerError catch (e) {
      return Results.failure(error: ErrorFailure(message: e.errorMessage));
    }
  }

  @override
  Future<Results<List<ProductModel>, ErrorFailure>> getShoes() async {
    try {
      final List<ProductModel> data = await _remoteDatasource.getShoes();
      return Results.success(data: data);
    } on ServerError catch (e) {
      return Results.failure(error: ErrorFailure(message: e.errorMessage));
    }
  }
}

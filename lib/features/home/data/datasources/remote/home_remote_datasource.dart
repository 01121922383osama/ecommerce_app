import 'dart:math';

import 'package:ecommerce_app/core/errors/server_error.dart';
import 'package:ecommerce_app/features/home/data/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/constants/type_typefields.dart';

abstract class HomeRemoteDatasource {
  Future<List<ProductModel>> getAllData();
  Future<List<ProductModel>> getBags();
  Future<List<ProductModel>> getClothes();
  Future<List<ProductModel>> getShoes();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final SupabaseClient _client;

  HomeRemoteDatasourceImpl({required SupabaseClient client}) : _client = client;

  @override
  Future<List<ProductModel>> getAllData() async {
    List<ProductModel> products = [];
    try {
      final List<dynamic> bags = await _client.from(TypeFields.bags).select();
      final List<ProductModel> bagsList = bags.map((element) {
        return ProductModel.fromJson(element);
      }).toList();

      final List<dynamic> shoes = await _client.from(TypeFields.shoes).select();
      final List<ProductModel> shoesList = shoes.map((element) {
        return ProductModel.fromJson(element);
      }).toList();

      final List<dynamic> clothes =
          await _client.from(TypeFields.clothes).select();
      final List<ProductModel> clothesList = clothes.map((element) {
        return ProductModel.fromJson(element);
      }).toList();

      products.addAll([...bagsList, ...shoesList, ...clothesList]);
      products.shuffle(Random());
      return products;
    } on PostgrestException catch (e) {
      throw ServerError(errorMessage: e.message);
    }
  }

  @override
  Future<List<ProductModel>> getBags() async {
    try {
      final List<dynamic> bags = await _client.from(TypeFields.bags).select();
      final List<ProductModel> data = bags.map((element) {
        return ProductModel.fromJson(element);
      }).toList();
      return data;
    } on PostgrestException catch (e) {
      throw ServerError(errorMessage: e.message);
    }
  }

  @override
  Future<List<ProductModel>> getClothes() async {
    try {
      final List<dynamic> clothes =
          await _client.from(TypeFields.clothes).select();
      final List<ProductModel> data = clothes.map((element) {
        return ProductModel.fromJson(element);
      }).toList();
      return data;
    } on PostgrestException catch (e) {
      throw ServerError(errorMessage: e.message);
    }
  }

  @override
  Future<List<ProductModel>> getShoes() async {
    try {
      final List<dynamic> shoes = await _client.from(TypeFields.shoes).select();
      final List<ProductModel> data = shoes.map((element) {
        return ProductModel.fromJson(element);
      }).toList();
      return data;
    } on PostgrestException catch (e) {
      throw ServerError(errorMessage: e.message);
    }
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as num,
      name: json['productName'] as String?,
      description: json['productDescription'] as String?,
      price: json['price'] as num?,
      image: json['productImage'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.name,
      'productDescription': instance.description,
      'price': instance.price,
      'productImage': instance.image,
    };

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: 'id')
  final num id;
  @JsonKey(name: 'productName')
  final String? name;
  @JsonKey(name: 'productDescription')
  final String? description;
  @JsonKey(name: 'price')
  final num? price;
  @JsonKey(name: 'productImage')
  final String? image;

  ProductModel({
    required this.id,
    this.name,
    this.description,
    this.price,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

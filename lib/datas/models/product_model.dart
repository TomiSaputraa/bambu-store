import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel({
    required this.message,
    required this.status,
    required this.product,
    required this.username,
  });

  final String? message;
  final int? status;
  final List<Product>? product;
  final List<Username>? username;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Username {
  Username({
    required this.name,
    required this.id,
  });

  final String? name;
  final int? id;

  factory Username.fromJson(Map<String, dynamic> json) =>
      _$UsernameFromJson(json);

  Map<String, dynamic> toJson() => _$UsernameToJson(this);
}

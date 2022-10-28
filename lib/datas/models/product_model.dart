import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(createToJson: true)
class ProductModel {
  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    this.createdAt,
    this.updatedAt,
    required this.imageUrl,
    this.id,
  });

  final String? name;
  final String? description;
  final String? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imageUrl;
  final String? id;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

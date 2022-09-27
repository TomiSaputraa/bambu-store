part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class LoadProductEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class AddProductEvent extends ProductEvent {
  final String name;
  final String description;
  final String price;
  final String imageUrl;

  AddProductEvent(
      {required this.name,
      required this.description,
      required this.price,
      required this.imageUrl});
  @override
  List<Object?> get props => [];
}

class EditProductEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class DeleteProductEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

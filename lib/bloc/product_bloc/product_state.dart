part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitialState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState {
  // final Product products;
  // lalu kita jadi sebagai objek list dari repository disini untuk di olah oleh bloc
  final List<dynamic> products;

  ProductLoadedState(this.products);
  @override
  List<Object?> get props => [products];
}

class ProductFailedState extends ProductState {
  final String error;

  ProductFailedState(this.error);

  @override
  List<Object?> get props => [error];
}
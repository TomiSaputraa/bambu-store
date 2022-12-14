// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState {
  // lalu kita jadi sebagai objek list dari repository disini untuk di olah oleh bloc
  final List<dynamic> products;

  ProductLoadedState(this.products);

  @override
  List<Object?> get props => [products];

  // toJson ini akan dipanggil ke ProductBloc
  @override
  Map<String, dynamic> toJson() {
    return {
      'products': products,
    };
  }

  ProductLoadedState copyWith({
    List<dynamic>? products,
  }) {
    return ProductLoadedState(
      products ?? this.products,
    );
  }
}

class ProductFailedState extends ProductState {
  final String error;

  ProductFailedState(this.error) : super();

  @override
  List<Object?> get props => [error];
}

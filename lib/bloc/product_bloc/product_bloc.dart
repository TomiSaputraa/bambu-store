import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:test_app/datas/models/product_model.dart';
import 'package:test_app/datas/repositories/product_repo.dart';

import '../bloc_imports.dart';

part 'product_event.dart';
part 'product_state.dart';

// Bloc diganti dengan HydratedBloc untuk menyimpan state
class ProductBloc extends HydratedBloc<ProductEvent, ProductState> {
  final ProductRepository _repository;

  ProductBloc(this._repository) : super(ProductInitialState()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductInitialState());
      try {
        final response = await _repository.getData();
        emit(ProductLoadedState(response));
      } catch (e) {
        emit(ProductFailedState(e.toString()));
      }
    });

    // on<AddProductEvent>((event, emit) async {
    //   emit(ProductInitialState());
    //   try {
    //     final response = await _repository.postProduct(
    //       Product(
    //         name: event.name,
    //         description: event.description,
    //         price: event.price,
    //         imageUrl: event.imageUrl,
    //       ),
    //     ) as List<dynamic>;
    //     emit(ProductLoadedState(response));
    //   } catch (e) {
    //     emit(ProductFailedState(e.toString()));
    //   }
    // });
  }

  @override
  Map<String, dynamic>? toJson(ProductState state) {
    if (state is ProductLoadedState) {
      // toJson dibuat di state ProductLoadedState
      return state.toJson();
    } else {
      return null;
    }
  }

  @override
  ProductState? fromJson(Map<String, dynamic> json) {}
}

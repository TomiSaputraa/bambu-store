import 'package:test_app/datas/models/product_model.dart';
import 'package:test_app/datas/repositories/product_repo.dart';

import '../bloc_imports.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
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
  }
}

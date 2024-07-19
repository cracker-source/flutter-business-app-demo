import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../services/product_category/product_category_repository.dart';

part 'product_category_event.dart';
part 'product_category_state.dart';

class ProductCategoryBloc
    extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final ProductCategoryRepository productCategoryRepository;

  ProductCategoryBloc({required this.productCategoryRepository})
      : super(ProductCategoryInitialState()) {
    on<ProductCategoryLoadEvent>(_productCategoryLoadEvent);
  }

  void _productCategoryLoadEvent(event, emit) async {
    try {
      emit(ProductCategoryLoadingState());

      Response response =
          await productCategoryRepository.getUserProductCategories();

      if (response.data["status"] == "success") {
        emit(
          ProductCategoryLoadedState(
            productCategories: response.data["data"],
            headerImage: response.data["headerImage"],
          ),
        );
      }
    } catch (e) {
      emit(ProductCategoryErrorState());
    }
  }
}

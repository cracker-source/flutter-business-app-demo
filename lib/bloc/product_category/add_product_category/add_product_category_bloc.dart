import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../services/product_category/product_category_repository.dart';

part 'add_product_category_event.dart';
part 'add_product_category_state.dart';

class AddProductCategoryBloc
    extends Bloc<AddProductCategoryEvent, AddProductCategoryState> {
  final ProductCategoryRepository productCategoryRepository;
  AddProductCategoryBloc({required this.productCategoryRepository})
      : super(AddProductCategoryInitial()) {
    on<AddProductCategoryLoadEvent>(_addProductCategoryLoadEvent);

    on<AddProductCategoryAddEvent>(_addProductCategoryAddEvent);
  }

  void _addProductCategoryLoadEvent(event, emit) async {
    try {
      emit(AddProductCategoryLoading());

      Response response =
          await productCategoryRepository.getAllProductCategories();

      if (response.data["status"] == "success") {
        emit(AddProductCategoryLoaded(
            userProductCategories: response.data["data"]));
      }
    } catch (e) {
      emit(AddProductCategoryError());
    }
  }

  void _addProductCategoryAddEvent(event, emit) async {
    try {
      emit(AddProductCategoryAdding());

      Response response = await productCategoryRepository
          .addProductCategory(event.categoryName);

      if (response.data["status"] == "success") {
        emit(AddProductCategoryAdded());
      }
    } catch (e) {
      emit(AddProductCategoryAddingError());
    }
  }
}

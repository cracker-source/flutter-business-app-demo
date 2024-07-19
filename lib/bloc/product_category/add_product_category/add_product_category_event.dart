part of 'add_product_category_bloc.dart';

abstract class AddProductCategoryEvent extends Equatable {
  const AddProductCategoryEvent();

  @override
  List<Object> get props => [];
}

class AddProductCategoryLoadEvent extends AddProductCategoryEvent {}

class AddProductCategoryAddEvent extends AddProductCategoryEvent {
  final String categoryName;

  const AddProductCategoryAddEvent({required this.categoryName});
}

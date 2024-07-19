part of 'product_category_bloc.dart';

abstract class ProductCategoryEvent extends Equatable {
  const ProductCategoryEvent();

  @override
  List<Object> get props => [];
}

class ProductCategoryLoadEvent extends ProductCategoryEvent {}

class ProductCategorySortEvent extends ProductCategoryEvent {
  final String sortingName;

  const ProductCategorySortEvent({
    required this.sortingName,
  });
}

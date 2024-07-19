part of 'product_category_bloc.dart';

abstract class ProductCategoryState extends Equatable {
  const ProductCategoryState();

  @override
  List<Object> get props => [];
}

class ProductCategoryInitialState extends ProductCategoryState {}

class ProductCategoryLoadingState extends ProductCategoryState {}

class ProductCategoryErrorState extends ProductCategoryState {}

class ProductCategoryLoadedState extends ProductCategoryState {
  final List<dynamic> productCategories;
  final String headerImage;

  const ProductCategoryLoadedState({
    required this.productCategories,
    required this.headerImage,
  });

  @override
  List<Object> get props => [productCategories];
}

class ProductCategoryUserLoadingState extends ProductCategoryState {}

class ProductCategoryUserLoadedState extends ProductCategoryState {
  final List<dynamic> userProductCategories;

  const ProductCategoryUserLoadedState({required this.userProductCategories});

  @override
  List<Object> get props => [userProductCategories];
}

class ProductCategoryUserErrorState extends ProductCategoryState {}

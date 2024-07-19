part of 'add_product_category_bloc.dart';

abstract class AddProductCategoryState extends Equatable {
  const AddProductCategoryState();

  @override
  List<Object> get props => [];
}

class AddProductCategoryInitial extends AddProductCategoryState {}

class AddProductCategoryLoading extends AddProductCategoryState {}

class AddProductCategoryLoaded extends AddProductCategoryState {
  final List<dynamic> userProductCategories;

  const AddProductCategoryLoaded({required this.userProductCategories});

  @override
  List<Object> get props => [userProductCategories];
}

class AddProductCategoryError extends AddProductCategoryState {}

class AddProductCategoryAdding extends AddProductCategoryState {}

class AddProductCategoryAdded extends AddProductCategoryState {}

class AddProductCategoryAddingError extends AddProductCategoryState {}

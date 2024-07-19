import 'package:equatable/equatable.dart';

class ProductCategoryModel extends Equatable {
  final String image;
  final String name;
  final bool isSelected;

  const ProductCategoryModel({
    required this.image,
    required this.name,
    required this.isSelected,
  });

  @override
  List<Object?> get props => [image, name, isSelected];

  ProductCategoryModel copyWith({
    final String? image,
    final String? name,
    final bool? isSelected,
  }) {
    return ProductCategoryModel(
      image: image ?? this.image,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

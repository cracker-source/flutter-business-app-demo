import "package:flutter_bloc/flutter_bloc.dart";
import 'package:social/bloc/products/vegetables/add_vegetables/add_vegetables_bloc.dart';
import 'package:social/bloc/products/vegetables/user_veetables/user_vegetables_bloc.dart';

import '../../bloc/products/vegetables/all_vegetables/all_vegetables_bloc.dart';
import '../../services/products/vegetables/vegetables_repository.dart';
import '../../bloc/product_category/add_product_category/add_product_category_bloc.dart';
import '../../bloc/authentication/login/login_bloc.dart';
import '../../bloc/authentication/signup/signup_bloc.dart';
import 'product_category/product_category/product_category_bloc.dart';
import '../../bloc/verification/basic_verification/verification_bloc.dart';
import '../../bloc/verification/business_verification/business_verification_bloc.dart';
import '../../services/auth/auth_repository.dart';
import '../../services/product_category/product_category_repository.dart';
import '../../services/verification/verification_repository.dart';

class BlocProviders {
  final AuthRepository _authRepository = AuthRepository();
  final VerificationRepository _verificationRepository =
      VerificationRepository();

  final ProductCategoryRepository _productCategoryRepository =
      ProductCategoryRepository();

  final VegetablesRepository _vegetablesRepository = VegetablesRepository();

  blocs() {
    return [
      BlocProvider<SignupBloc>(
        create: (context) => SignupBloc(authRepository: _authRepository),
      ),
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(authRepository: _authRepository),
      ),
      BlocProvider<VerificationBloc>(
        create: (context) => VerificationBloc(_verificationRepository),
      ),
      BlocProvider<BusinessVerificationBloc>(
        create: (context) => BusinessVerificationBloc(_verificationRepository),
      ),
      BlocProvider(
        create: (context) => ProductCategoryBloc(
          productCategoryRepository: _productCategoryRepository,
        ),
      ),
      BlocProvider(
        create: (context) => AddProductCategoryBloc(
          productCategoryRepository: _productCategoryRepository,
        ),
      ),
      BlocProvider(
        create: (context) => AllVegetablesBloc(
          vegetablesRepository: _vegetablesRepository,
        ),
      ),
      BlocProvider(
        create: (context) => AddVegetablesBloc(
          vegetablesRepository: _vegetablesRepository,
        ),
      ),
      BlocProvider(
        create: (context) => UserVegetablesBloc(
          vegetablesRepository: _vegetablesRepository,
        ),
      )
    ];
  }
}

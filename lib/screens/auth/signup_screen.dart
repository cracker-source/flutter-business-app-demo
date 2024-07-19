import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/signup_screen/signup_form.dart';
import '../../utils/utils.dart';
import '../../bloc/authentication/signup/signup_bloc.dart';
import '../../widgets/common/loading_view.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text("Create your account"),
          ),
          body: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SignupForm(),
            ),
          ),
        ),
        BlocConsumer<SignupBloc, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccessfullState) {
              showSnackBar("Account successfully created");
            }
          },
          builder: (context, state) {
            if (state is SignupLoadingState) {
              return const LoadingView();
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/verification/basic_verification/verification_bloc.dart';
import '../bottom_tab_navigation/main_tab_screen.dart';
import 'signup_verification_screen.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<VerificationBloc>().add(const VerificationDetailsLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationBloc, VerificationState>(
      builder: (context, state) {
        if (state is VerificationLoadingState) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (state is VerificationUserUnAuthorized) {
          return const SignupVerificationScreen();
        } else if (state is VerificationUserAuthorized) {
          return const MainTabScreen();
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

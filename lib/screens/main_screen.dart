import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/authentication/login/login_bloc.dart';
import 'auth/authorization_screen.dart';
import 'auth/welcome_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    context.read<LoginBloc>().add(LoginCheckEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginUserAvailableInitialState) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (state is LoginUserAvailableState) {
        return const AuthorizationScreen();
      } else {
        return const WelcomeScreen();
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social/services/auth/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc({required this.authRepository}) : super(LoginInitialState()) {
    on<LoginEvent>(_loginRequestedEvent);
    on<LoginCheckEvent>(_loginCheckEvent);
  }

  void _loginRequestedEvent(event, emit) async {
    try {
      emit(LoginInitialState());

      await authRepository.logInBusiness(
        email: event.email,
        password: event.password,
      );

      emit(LoginSuccessfullState());
    } catch (e) {
      emit(LoginErrorState());
    }
  }

  Future<void> _loginCheckEvent(event, emit) async {
    try {
      emit(LoginUserAvailableInitialState());

      await authRepository.isLoggedIn;
      emit(LoginUserAvailableState());
    } catch (e) {
      emit(LoginUserAvailableErrorState());
    }
  }
}

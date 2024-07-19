import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../services/products/vegetables/vegetables_repository.dart';

part 'user_vegetables_event.dart';
part 'user_vegetables_state.dart';

class UserVegetablesBloc
    extends Bloc<UserVegetablesEvent, UserVegetablesState> {
  final VegetablesRepository vegetablesRepository;
  UserVegetablesBloc({
    required this.vegetablesRepository,
  }) : super(UserVegetablesInitial()) {
    on<UserVegetablesLoadEvent>(_userVegetablesLoadEvent);
  }

  void _userVegetablesLoadEvent(event, emit) async {
    try {
      emit(UserVegetablesLoadingState());

      Response response = await vegetablesRepository.loadUserVegetables();

      print("Response $response");

      if (response.data["status"] == "success") {
        emit(
          UserVegetablesLoadedState(
            userVegetables: response.data["data"],
          ),
        );
      }
    } catch (e) {
      emit(UserVegetablesErrorState());
    }
  }
}

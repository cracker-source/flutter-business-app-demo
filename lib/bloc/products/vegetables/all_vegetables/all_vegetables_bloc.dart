import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../services/products/vegetables/vegetables_repository.dart';

part 'all_vegetables_event.dart';
part 'all_vegetables_state.dart';

class AllVegetablesBloc extends Bloc<AllVegetablesEvent, AllVegetablesState> {
  final VegetablesRepository vegetablesRepository;
  AllVegetablesBloc({required this.vegetablesRepository})
      : super(AllVegetablesInitial()) {
    on<AllVegetablesLoad>(_allVegetablesLoad);
  }

  void _allVegetablesLoad(event, emit) async {
    try {
      emit(AllVegetablesLoadingState());

      Response response = await vegetablesRepository.loadAllVegetables();

      if (response.data["status"] == "success") {
        emit(AllVegetablesLoadedState(allVegetables: response.data["data"]));
      }
    } catch (e) {
      emit(AllVegetablesErrorState());
    }
  }
}

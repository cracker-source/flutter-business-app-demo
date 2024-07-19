import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../services/products/vegetables/vegetables_repository.dart';

part 'add_vegetables_event.dart';
part 'add_vegetables_state.dart';

class AddVegetablesBloc extends Bloc<AddVegetablesEvent, AddVegetablesState> {
  final VegetablesRepository vegetablesRepository;
  AddVegetablesBloc({
    required this.vegetablesRepository,
  }) : super(
          const AddVegetablesInitial(
            price: "",
            units: "",
          ),
        ) {
    on<AddVegetablesPriceEvent>(_addVegetablesPriceEvent);
    on<AddVegetablesPriceResetEvent>(_addVegetablesPriceResetEvent);
    on<AddVegetableEvent>(_addVegetableEvent);
  }

  void _addVegetablesPriceEvent(event, emit) {
    emit(AddVegetablesPriceAddedState(price: event.price, units: event.units));
  }

  void _addVegetablesPriceResetEvent(event, emit) {
    emit(const AddVegetablesInitial(price: "", units: ""));
  }

  void _addVegetableEvent(event, emit) async {
    try {
      emit(AddVegetablesLoadingState(price: state.price, units: state.units));

      Response response = await vegetablesRepository.addVegetable(
        vegetableName: event.vegetableName,
        units: state.units,
        price: state.price,
      );

      if (response.data["status"] == "success") {
        emit(const AddVegetablesSuccessState(price: "", units: ""));
      } else {
        emit(AddVegetablesErrorState(price: state.price, units: state.units));
      }
    } catch (e) {
      emit(AddVegetablesErrorState(price: state.price, units: state.units));
    }
  }
}

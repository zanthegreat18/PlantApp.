import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/plant.dart';
import 'plant_event.dart';
import 'plant_state.dart';

class PlantBloc extends Bloc<PlantEvent, PlantState> {
  PlantBloc() : super(PlantInitial()) {
    on<LoadPlantsEvent>((event, emit) async {
      emit(PlantLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(PlantLoaded([
        Plant(name: 'SAMANTHA', origin: 'RUSSIA', price: '\$440'),
        Plant(name: 'ANGELICA', origin: 'RUSSIA', price: '\$440'),
        Plant(name: 'NORA', origin: 'USA', price: '\$500'),
      ]));
    });
  }
}

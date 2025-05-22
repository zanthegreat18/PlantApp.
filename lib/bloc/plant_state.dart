import '../models/plant.dart';

abstract class PlantState {}

class PlantInitial extends PlantState {}

class PlantLoading extends PlantState {}

class PlantLoaded extends PlantState {
  final List<Plant> plants;
  PlantLoaded(this.plants);
}

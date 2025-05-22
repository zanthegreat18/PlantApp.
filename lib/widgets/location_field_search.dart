import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class LocationSearchField extends StatefulWidget {
  final void Function(String) onLocationSelected;

  const LocationSearchField({super.key, required this.onLocationSelected});

  @override
  State<LocationSearchField> createState() => _LocationSearchFieldState();
}

class _LocationSearchFieldState extends State<LocationSearchField> {
  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    googlePlace = GooglePlace("AIzaSyCdqmGoK2LoGW5p_WS4CYTCdsQI4OKJH80"); 
  }
import 'package:app_tanaman/widgets/icon_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:geolocator/geolocator.dart'; 
import '../models/plant.dart';

class PlantDetailPage extends StatefulWidget {
  final Plant plant;
  const PlantDetailPage({super.key, required this.plant});

  @override
  State<PlantDetailPage> createState() => _PlantDetailPageState();
}

class _PlantDetailPageState extends State<PlantDetailPage> {
  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  TextEditingController controller = TextEditingController();
  String selectedAddress = "";

  @override
  void initState() {
    super.initState();
    _checkPermission(); // <-- Minta izin lokasi dulu
    googlePlace = GooglePlace("AIzaSyCdqmGoK2LoGW5p_WS4CYTCdsQI4OKJH80");
  }

  void _checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
    }
  }
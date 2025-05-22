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
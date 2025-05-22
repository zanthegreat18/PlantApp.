import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class LocationSearchField extends StatefulWidget {
  final void Function(String) onLocationSelected;

  const LocationSearchField({super.key, required this.onLocationSelected});

  @override
  State<LocationSearchField> createState() => _LocationSearchFieldState();
}
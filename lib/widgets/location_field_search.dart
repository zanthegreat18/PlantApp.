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

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Cari alamat...",
            prefixIcon: Icon(Icons.location_on),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              autoCompleteSearch(value);
            } else {
              setState(() {
                predictions = [];
              });
            }
          },
        ),
        ...predictions.map((p) => ListTile(
              title: Text(p.description ?? ""),
              onTap: () {
                controller.text = p.description!;
                widget.onLocationSelected(p.description!);
                setState(() {
                  predictions = [];
                });
              },
            )),
      ],
    );
  }
}
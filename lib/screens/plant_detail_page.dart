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

  void showAddressSearchSheet(BuildContext context) {
    bool isLoading = false;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: controller,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Cari alamat...",
                          hintStyle: TextStyle(color: Colors.white54),
                          prefixIcon: Icon(Icons.location_on, color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) async {
                          if (value.isNotEmpty) {
                            setModalState(() => isLoading = true);
                            var result = await googlePlace.autocomplete.get(value);
                            if (mounted) {
                              setModalState(() {
                                isLoading = false;
                                predictions = result?.predictions ?? [];
                              });
                            }
                          } else {
                            setModalState(() {
                              predictions = [];
                              isLoading = false;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                      if (isLoading)
                        const CircularProgressIndicator(color: Colors.white),
                      ...predictions.map(
                        (p) => ListTile(
                          title: Text(
                            p.description ?? "",
                            style: const TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            controller.text = p.description!;
                            setState(() {
                              selectedAddress = p.description!;
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconTile(
                  icon: Icons.search,
                  onTap: () => showAddressSearchSheet(context),
                ),
              ],
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(80),
                  bottomLeft: Radius.circular(80),
                ),
                child: Container(
                  color: Colors.white10,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.local_florist, size: 120, color: Color(0xFF00FFB3)),
                      const SizedBox(height: 24),
                      Text(
                        widget.plant.name,
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        widget.plant.origin,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        widget.plant.price,
                        style: const TextStyle(fontSize: 24, color: Color(0xFF00FFB3)),
                      ),
                      const SizedBox(height: 24),
                      if (selectedAddress.isNotEmpty)
                        Text(
                          "📍 Lokasi dipilih: $selectedAddress",
                          style: const TextStyle(color: Colors.greenAccent),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
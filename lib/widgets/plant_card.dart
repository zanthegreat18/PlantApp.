import 'package:flutter/material.dart';
import '../models/plant.dart';
import '../screens/plant_detail_page.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;
  const PlantCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PlantDetailPage(plant: plant),
        ),
      ),
      child: Container(
        width: 140,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(16),
        ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.local_florist, size: 40, color: Color(0xFF00FFB3)),
            const Spacer(),
            Text(plant.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(plant.origin, style: const TextStyle(color: Colors.grey)),
            Text(plant.price, style: const TextStyle(
              color: Color(0xFF00FFB3),
              fontWeight: FontWeight.bold,
            )),
          ],
        ),
      ),
    );
  }
}
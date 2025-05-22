import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const IconTile({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: const Color(0xFF00FFB3)),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const IconTile({
    super.key,
    required this.icon,
    required this.onTap,
  });
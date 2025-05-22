import 'package:ojan_project1/bloc/plant_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/plant_bloc.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant UI',
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => PlantBloc()..add(LoadPlantsEvent()),
        child: const HomePage(),
      ),
    );
  }
}
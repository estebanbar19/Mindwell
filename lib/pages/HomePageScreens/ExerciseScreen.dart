import 'package:flutter/material.dart';
  import 'package:foodfast/data/Firebase/RealtimeDatabase.dart';
import 'package:foodfast/data/Theme/AppColors.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicios para la Ansiedad'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        color: AppColors.quaternaryColor,
        child: Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: const [
              ExerciseCard(
                title: 'Respiración Profunda',
                description:
                    'Realiza respiraciones profundas y lentas para calmarte.',
              ),
              ExerciseCard(
                title: 'Consciencia',
                description:
                    'Practica la atención plena para estar presente en el momento actual.',
              ),
              ExerciseCard(
                title: 'Visualización',
                description:
                    'Imagina un lugar tranquilo y visualiza todos los detalles para relajarte.',
              ),
              ExerciseCard(
                title: 'Escritura Terapéutica',
                description:
                    'Llevar un diario de tus pensamientos y sentimientos puede proporcionar una salida para las emociones y ayudarte a procesar lo que estás experimentando.',
              ),
              ExerciseCard(
                title: 'Práctica de Resiliencia',
                description:
                    'Desarrollar habilidades para afrontar y adaptarse a situaciones estresantes puede aumentar tu capacidad para lidiar con la ansiedad.',
              ),
               ExerciseCard(
                title: 'Música Relajante',
                description:
                    'Escuchar música suave y relajante puede tener un efecto calmante en la mente y el cuerpo.',
              ),
              // Agregar más ejercicios
            ],
          ),
        ),
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final String title;
  final String description;

  const ExerciseCard({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(149, 116, 116, 116),
      elevation: 5.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

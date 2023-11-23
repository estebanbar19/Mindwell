import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  CardHome({super.key, required this.imageName});

  String imageName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imageName,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.7,
        ),
      ),
    );
  }
}

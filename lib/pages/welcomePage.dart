import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodfast/data/Theme/AppColors.dart';

import '../firebase_options.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).popAndPushNamed('/login');
      },);
    });
    
    return Scaffold(
      body: Container(
        color: AppColors.quinaryColor,
        child: const Center(child: Text("MindWell", style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 70,
          fontFamily: 'VintageKing'
        ),)),
      ),
    );
  }
}

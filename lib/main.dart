import 'package:flutter/material.dart';
import 'package:foodfast/pages/HomePage.dart';
import 'package:foodfast/pages/loginPage.dart';
import 'package:foodfast/pages/welcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastFood',
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}


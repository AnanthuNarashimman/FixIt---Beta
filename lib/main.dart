import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';
import 'userhomepage.dart';
import 'workerhomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Important for Firebase Auth & Firestore
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
          brightness: Brightness.light,
        ),
      ),
      initialRoute: '/login', // Start with login screen

      // Named route definitions
      routes: {
        '/login': (context) => const Log(),
        '/home': (context) => const UserHomePage(),
        '/work': (context) => const WorkerHomePage(),
      },
    );
  }
}

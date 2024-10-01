import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyDs_L00Z5zHMhnf1gmozGJHbXCMoDmjZ9s",
      authDomain: "mineportfoliowebsite.firebaseapp.com",
      projectId: "mineportfoliowebsite",
      storageBucket: "mineportfoliowebsite.appspot.com",
      messagingSenderId: "793113479704",
      appId: "1:793113479704:web:03f671bea45a3f1045d16d"
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sweety Rawat',
      theme: ThemeData(
        inputDecorationTheme: kDefaultInputDecorationTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

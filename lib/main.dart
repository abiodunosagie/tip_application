import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_tip_app_calculator/splashscreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const TipApp());
}

class TipApp extends StatelessWidget {
  const TipApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

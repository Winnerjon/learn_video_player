import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/styles/themes.dart';
import 'screens/home/home_screen.dart';

void main() {

  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     systemNavigationBarContrastEnforced: true,
  //     systemNavigationBarColor: Colors.transparent,
  //     statusBarBrightness: Brightness.dark,
  //   ),
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Play',
      theme: AppThemes.light(),
      home: const HomeScreen(),
    );
  }
}

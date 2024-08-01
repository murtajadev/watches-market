import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:whatches_store/page/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  // ignore: unused_local_variable
  var box = Hive.openBox("ListFavoriteItems");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: SplashScreen()),
    );
  }
}

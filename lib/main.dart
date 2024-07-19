import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:logger/logger.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';

Logger logger = Logger();

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

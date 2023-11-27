import 'package:cafe_app/core.dart';
import 'package:cafe_app/state_util.dart';
import 'package:flutter/material.dart';
void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MainmenuView(),
    );
  }
}


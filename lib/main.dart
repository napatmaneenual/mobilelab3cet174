import 'package:flutter/material.dart';
//import 'package:mobilelab3cet174/screen/addform.dart';
import 'package:mobilelab3No22cet174/screen/item.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("HomeSweetHome ID:174"),
        backgroundColor: const Color.fromARGB(255, 68, 134, 255),
        centerTitle: true,
      ),
      body: const Item(),
    ),
  );
  }
}
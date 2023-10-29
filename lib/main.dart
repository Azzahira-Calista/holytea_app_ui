import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holytea_slicing_ui/views/firstpage.dart';
import 'package:holytea_slicing_ui/views/locationpage.dart';
import 'package:holytea_slicing_ui/views/menupage.dart';
import 'package:holytea_slicing_ui/views/privacypage.dart';
import 'package:holytea_slicing_ui/views/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirstPage(),
    );
  }
}

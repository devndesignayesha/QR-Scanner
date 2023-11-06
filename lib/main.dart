import 'package:flutter/material.dart';
import 'package:qr_code_project/qr_scanner.dart';
import 'package:qr_code_project/resultscreen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orangeAccent,
          elevation: 0.0,
        ),
      ),


      home: QRScanner(),
      debugShowCheckedModeBanner: false,
      title: 'QR Code Scanner',
      );
  }
}

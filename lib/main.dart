import 'package:flutter/material.dart';
import 'package:g_manager/screens/Loginscreen.dart';
import 'package:g_manager/screens/VendordashBoardScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Billing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        '/dashboard': (context) => VendorDashboard(),
      },
    );
  }
}

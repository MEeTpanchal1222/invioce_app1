import 'package:flutter/material.dart';
import 'package:invioce_app1/view/data_store_screen.dart';
import 'package:invioce_app1/view/slashscreen.dart';
import 'home_screan.dart';
// ✌ this is meet here ✌;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/':(context) => SplashScreen(),//screen 1;
        '/home':(context)=>HomeScreen(),//screen 2;
        '/edit':(context)=>dataScreen(),//screen 3;
      },
    );
  }
}
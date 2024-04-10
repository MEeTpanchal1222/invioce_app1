import 'package:flutter/material.dart';
//✌ this is meet here ✌;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {  //code first exeuted is initstate
    super.initState();//first he call all bulid methoed then futeure.delayed work;
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamed(context,'/home' );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Loading...',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

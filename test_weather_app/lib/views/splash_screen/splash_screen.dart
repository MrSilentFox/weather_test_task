import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () { Navigator.pushReplacementNamed(context, '/home'); }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.7,
                height: MediaQuery.of(context).size.width*0.7,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/cloud.png'))
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AutoSizeText('Simple Weather', style: TextStyle(color: Colors.white, fontSize: 35),maxLines: 1,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

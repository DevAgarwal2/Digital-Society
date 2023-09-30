import "dart:async";

import "package:digitalsociety/PageControl.dart";
import "package:flutter/material.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () { 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AnimPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: Image.asset("Assets/27462.jpg"),
        ),
        SizedBox(height: 20,),
        Center(child: Text("Welcome to Digital Society",style: TextStyle(
          color: Colors.grey.shade700,fontSize: 18
        ),),)
      ],),
    );
  }
}

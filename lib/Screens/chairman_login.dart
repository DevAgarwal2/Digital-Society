import "dart:math";

import "package:digitalsociety/Component/button_comp.dart";
import "package:digitalsociety/Component/sigincomp.dart";
import "package:digitalsociety/Screens/chairman_signup.dart";
import "package:digitalsociety/mainScreen/mainScree.dart";
import "package:flutter/material.dart";

class ChairmanLogin extends StatefulWidget {
  const ChairmanLogin({super.key});

  @override
  State<ChairmanLogin> createState() => _ChairmanLoginState();
}

class _ChairmanLoginState extends State<ChairmanLogin> {
  final TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                "Assets/new.png",
                height: 300,
                width: 500,
              ),
              SizedBox(
                height: 50,
              ),
              SiginComp(
                name: "Enter the email: ",
                controller: email,
                obstrue: false,
                icon: Icon(Icons.email_rounded),
              ),
              SizedBox(
                height: 15,
              ),
              SiginComp(
                name: "Enter the Password",
                controller: password,
                obstrue: true,
                icon: Icon(Icons.fingerprint),
              ),
              SizedBox(
                height: 30,
              ),
              ButtonComp(color: Colors.brown.shade900, text: "Submit",ontap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen1()));
              },),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not have Account"),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChairmanSignup())),
                    child: Text(
                      "Registered Now",
                      style: TextStyle(
                        fontSize: 17,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

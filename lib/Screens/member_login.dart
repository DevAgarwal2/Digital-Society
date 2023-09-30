import "dart:math";

import "package:digitalsociety/Component/button_comp.dart";
import "package:digitalsociety/Component/sigincomp.dart";
import "package:digitalsociety/Member/main_screen.dart";
import "package:digitalsociety/Screens/chairman_signup.dart";
import "package:digitalsociety/Screens/member_signup.dart";
import "package:flutter/material.dart";

class MemberLogin extends StatefulWidget {
  const MemberLogin({super.key});

  @override
  State<MemberLogin> createState() => _MemberLoginState();
}

class _MemberLoginState extends State<MemberLogin> {
  final TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                "Assets/member.png",
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
              ButtonComp(
                color: Colors.black,
                text: "Submit",
                ontap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainScreen2()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not have an Account"),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MemberSignup())),
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

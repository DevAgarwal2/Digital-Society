
import "package:digitalsociety/Component/button_comp.dart";
import "package:digitalsociety/Component/sigincomp.dart";
import "package:digitalsociety/Screens/chairman_login.dart";
import "package:digitalsociety/Screens/member_login.dart";
import "package:flutter/material.dart";

class MemberSignup extends StatefulWidget {
  const MemberSignup({super.key});

  @override
  State<MemberSignup> createState() => _MemberSignupState();
}

class _MemberSignupState extends State<MemberSignup> {
  final TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
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
                "Assets/newlog.png",
                height: 300,
                width: 500,
              ),
              SizedBox(
                height: 30,
              ),
              SiginComp(name: "Member name", controller:username, obstrue:false, icon: Icon(Icons.person)),
              SizedBox(height: 15,),
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
              ButtonComp(color: Colors.black, text: "Submit",ontap: () {
                
              },),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an Account"),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MemberLogin()));
                    },
                    child: Text(
                      "Sign up",
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

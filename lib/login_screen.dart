
import "package:digitalsociety/Component/login_comp.dart";
import "package:digitalsociety/Screens/chairman_login.dart";
import "package:digitalsociety/Screens/member_login.dart";
import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade300,
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Center(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child: Icon(
                          Icons.person,
                          size: 80,
                        ),
              )),
          SizedBox(
            height: 35,
          ),
          Text(
            "Welcome to Digital Society",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 45,),
          LoginComp(text: "Society Chairman ",ontap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChairmanLogin()));
          },),
          SizedBox(height: 20,),
          Text("OR",style: TextStyle(fontSize: 18),),
          SizedBox(height: 20,),
          LoginComp(text: "Society Member",ontap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MemberLogin()));
            
          },)


        ],
      )),
    );
  }
}

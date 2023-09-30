import "package:flutter/material.dart";

class LoginComp extends StatelessWidget {
  final String text;
  Function()? ontap;
   LoginComp({super.key,required this.text,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
      
        color: Colors.white,
        borderRadius: BorderRadius.circular(14)
      ),
      child: Text(text,textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
    ));
  }
}
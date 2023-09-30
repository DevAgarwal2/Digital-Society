import "package:flutter/material.dart";

class SiginComp extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  bool obstrue;
  Icon icon;

  SiginComp(
      {super.key,
      required this.name,
      required this.controller,
      required this.obstrue,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: TextField(
        obscureText: obstrue,
        controller: controller,
        decoration: InputDecoration(
            hintText: name, border: InputBorder.none, prefixIcon: icon),
      ),
    );
  }
}

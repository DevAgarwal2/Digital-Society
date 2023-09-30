import "package:flutter/material.dart";

class myTextField extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final String label;
  const myTextField({super.key,required this.controller,required this.name,required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 8,left: 12,right: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: name,
          border: OutlineInputBorder()
        ),

      ),
    );
  }
}
import "package:flutter/material.dart";
class FloatButton extends StatelessWidget {
  final Color color;
  const FloatButton({super.key,required this.color});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: color,
      onPressed: (){
        
      },
    child: Icon(Icons.add,color: Colors.white,),);
  }
}
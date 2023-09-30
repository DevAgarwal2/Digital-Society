import "package:flutter/material.dart";

class Main1 extends StatelessWidget {
  ListView ok;
   Main1({super.key,required this.ok});

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: Container(
              height: 500,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                topRight: Radius.circular(20)),
                color: Colors.white
              ),
              child: ok
            ),
          );
  }
}
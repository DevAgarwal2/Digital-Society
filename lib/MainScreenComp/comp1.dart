import "package:flutter/material.dart";

class TopComp extends StatelessWidget {
  const TopComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.brown.shade800,
          borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Image.asset("Assets/online.png",color: Colors.white,height: 70,width: 70,),
          SizedBox(height: 10,),
          Center(
            child: Text(
              "Digital Society",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

import "package:flutter/material.dart";

class MainComp extends StatelessWidget {
  final Color color;
  final String title;
  final String image;
  final double height;
  final double width;
  Function()? ontap;
   MainComp(
      {super.key,
      required this.color,
      required this.title,
      required this.image,
      required this.height,
      required this.width,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 200,
        width: 160,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text(title,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Image.asset(
              image,height: height,width: width,
            ),
          ],
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";
class DashboardComp extends StatelessWidget {
  final String name;
  Function()? ontap;
   DashboardComp({super.key,required this.name,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18)
        ),
        child: Center(child: Text(name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
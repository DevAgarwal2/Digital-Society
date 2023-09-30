import "package:digitalsociety/mainScreen/chairman_profile.dart";
import "package:digitalsociety/mainScreen/chairman_screen.dart";
import "package:flutter/material.dart";
class MainScreen1 extends StatefulWidget {
  const MainScreen1({super.key});

  @override
  State<MainScreen1> createState() => _MainScreen1State();
}

class _MainScreen1State extends State<MainScreen1> {
  int selectIndex = 0;
  List Page = [ChairmanScreen(),ProfileScreen()];
  void changeIndex(int index){
    setState(() {
      selectIndex = index;
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade100,
        currentIndex: selectIndex,
        onTap: (value) => changeIndex(value),
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,),label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person,size: 30,),label: '')
      ]),
      body: Page[selectIndex],
    );
  }
}
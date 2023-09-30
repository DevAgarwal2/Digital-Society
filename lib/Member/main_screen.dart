import "package:digitalsociety/Member/member_page.dart";
import "package:digitalsociety/mainScreen/chairman_profile.dart";
import "package:digitalsociety/mainScreen/chairman_screen.dart";
import "package:flutter/material.dart";
class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  int selectIndex = 0;
  List Page = [MemberScreen(),ProfileScreen()];
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
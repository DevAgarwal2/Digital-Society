import "package:digitalsociety/MainScreenComp/comp1.dart";
import "package:digitalsociety/MainScreenComp/maincomp.dart";
import "package:digitalsociety/login_screen.dart";
import "package:digitalsociety/mainScreen/Screens/complain_screen.dart";
import "package:digitalsociety/mainScreen/Screens/event_screen.dart";
import "package:digitalsociety/mainScreen/Screens/notice_screen.dart";
import 'package:digitalsociety/mainScreen/Screens/participant.dart';
import "package:flutter/material.dart";

class ChairmanScreen extends StatefulWidget {
  const ChairmanScreen({super.key});

  @override
  State<ChairmanScreen> createState() => _ChairmanScreenState();
}

class _ChairmanScreenState extends State<ChairmanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back,
                color: Colors.black,
                size: 35,),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
              ),
              Text(
                "Chairman",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300, shape: BoxShape.circle),
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 35,
                  ))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: TopComp(),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MainComp(
                      color: Colors.deepPurple.shade500,
                      title: "Participants",
                      image: "Assets/people.jpg",
                      height: 90,
                      width: 90,
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PublicScreen()));
                      },
                    ),
                    MainComp(
                      color: Colors.blueAccent.shade200,
                      title: "Notice",
                      image: "Assets/notice.jpg",
                      height: 90,
                      width: 90,
                      ontap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NoticeScreen()));
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MainComp(
                      color: Colors.deepOrange.shade400,
                      title: "Events",
                      image: "Assets/event.jpg",
                      height: 90,
                      width: 90,
                      ontap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventScreen()));
                      },
                    ),
                    MainComp(
                      color: Colors.red.shade600,
                      title: "Complaints",
                      image: "Assets/complaint.jpg",
                      height: 100,
                      width: 125,
                      ontap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComplaintScreen()));
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}

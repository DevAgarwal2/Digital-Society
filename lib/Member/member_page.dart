import "package:digitalsociety/MainScreenComp/comp1.dart";
import "package:digitalsociety/MainScreenComp/maincomp.dart";
import "package:digitalsociety/Member/complain2.dart";
import "package:digitalsociety/Member/event2.dart";
import "package:digitalsociety/Member/notice2.dart";
import "package:digitalsociety/Member/participant2.dart";
import "package:digitalsociety/login_screen.dart";

import "package:flutter/material.dart";

class MemberScreen extends StatefulWidget {
  const MemberScreen({super.key});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
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
                "Member",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300, shape: BoxShape.circle),
                  child:  Icon(
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
              height: 10,
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
                                builder: (context) => PublicScreen2()));
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
                                builder: (context) => NoticeScreen2()));
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
                                builder: (context) => EventScreen2()));
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
                                builder: (context) => ComplaintScreen2()));
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

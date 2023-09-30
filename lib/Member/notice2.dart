import "package:cloud_firestore/cloud_firestore.dart";
import "package:digitalsociety/Member/main_screen.dart";
import "package:digitalsociety/mainScreen/Comp/main1_comp.dart";
import "package:digitalsociety/mainScreen/Model/chariman_notice_model.dart";
import "package:digitalsociety/mainScreen/Screens/editPage2.dart";
import "package:digitalsociety/mainScreen/mainScree.dart";
import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class NoticeScreen2 extends StatefulWidget {
  const NoticeScreen2({super.key});

  @override
  State<NoticeScreen2> createState() => _NoticeScreen2State();
}

class _NoticeScreen2State extends State<NoticeScreen2> {
  TextEditingController title = TextEditingController();
  TextEditingController subject = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent.shade200,
        body: StreamBuilder(
          stream: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final noticeData = snapshot.data;
              return SafeArea(
                  child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen2()));
                            },
                            icon: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 150,
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.blueAccent.shade200,
                                size: 25,
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 45),
                        child: Text(
                          "Notice",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 45),
                        child: Text(
                          "5 Notices",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Main1(
                    ok: ListView(
                      children: noticeData!.map(fetchData).toList(),
                    ),
                  )
                ],
              ));
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return SpinKitDualRing(color: Colors.white);
          },
        ));
  }

  Widget fetchData(Notice notice) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueAccent.shade200,
        child: Icon(Icons.report),
      ),
      title: Text(notice.title),
      subtitle: Text(notice.notice),
    );
  }

  Stream<Iterable<Notice>> getData() {
    return FirebaseFirestore.instance
        .collection("Chairman2")
        .snapshots()
        .map((event) => event.docs.map((e) => Notice.fromJson(e.data())));
  }
}

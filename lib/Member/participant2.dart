import "package:cloud_firestore/cloud_firestore.dart";
import "package:digitalsociety/Member/main_screen.dart";
import "package:digitalsociety/mainScreen/Comp/main1_comp.dart";
import "package:digitalsociety/mainScreen/Model/chairman_member_model.dart";
import "package:digitalsociety/mainScreen/Screens/editPage1.dart";
import "package:digitalsociety/mainScreen/mainScree.dart";
import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class PublicScreen2 extends StatefulWidget {
  const PublicScreen2({super.key});

  @override
  State<PublicScreen2> createState() => _PublicScreen2State();
}

class _PublicScreen2State extends State<PublicScreen2> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        backgroundColor: Colors.deepPurple.shade500,
        body: StreamBuilder(
          stream: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data;
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
                                color: Colors.deepPurple,
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
                          "Participants",
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
                          "5 Participant",
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
                      children: userData!.map(fetchData).toList(),
                    ),
                  )
                ],
              ));
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else {
              return SpinKitDualRing(color: Colors.white);
            }
          },
        ));
  }

  Widget fetchData(PartipantModel partipantModel) => ListTile(
        leading: CircleAvatar(
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepPurple,
        ),
        title: Text(partipantModel.name),
        subtitle: Text(partipantModel.email),
       
      );

  Stream<Iterable<PartipantModel>> getData() {
    return FirebaseFirestore.instance.collection("Chairman1").snapshots().map(
        (event) => event.docs.map((e) => PartipantModel.fromJson(e.data())));
  }

  
}

import "package:cloud_firestore/cloud_firestore.dart";
import "package:digitalsociety/Member/main_screen.dart";
import "package:digitalsociety/mainScreen/Comp/main1_comp.dart";
import "package:digitalsociety/mainScreen/Model/chairman_event_model.dart";
import "package:digitalsociety/mainScreen/mainScree.dart";
import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class EventScreen2 extends StatefulWidget {
  const EventScreen2({super.key});

  @override
  State<EventScreen2> createState() => _EventScreen2State();
}

class _EventScreen2State extends State<EventScreen2> {
  TextEditingController title = TextEditingController();
  TextEditingController subject = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        backgroundColor: Colors.deepOrange.shade400,
        body: StreamBuilder(
          stream: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
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
                                color: Colors.deepOrange.shade400,
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
                          "Events",
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
                          "5 Events",
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
                    children: data!.map(fetchData).toList(),
                  ))
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

  Widget fetchData(EventModel event) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          Icons.event_available,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepOrange,
      ),
      title: Text(event.title),
      subtitle: Text(event.subject),
     
    );
  }

  Stream<Iterable<EventModel>> getData() {
    return FirebaseFirestore.instance
        .collection("Chairman3")
        .snapshots()
        .map((event) => event.docs.map((e) => EventModel.fromJson(e.data())));
  }

  
}

import "package:cloud_firestore/cloud_firestore.dart";
import "package:digitalsociety/Member/main_screen.dart";
import "package:digitalsociety/mainScreen/Comp/main1_comp.dart";
import "package:digitalsociety/mainScreen/Model/complaint_model.dart";
import "package:digitalsociety/mainScreen/Screens/editPage4.dart";
import "package:digitalsociety/mainScreen/mainScree.dart";
import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class ComplaintScreen2 extends StatefulWidget {
  const ComplaintScreen2({super.key});

  @override
  State<ComplaintScreen2> createState() => _ComplaintScreen2State();
}

class _ComplaintScreen2State extends State<ComplaintScreen2> {
  TextEditingController title = TextEditingController();
  TextEditingController subject = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red.shade600,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              context: context,
              builder: (BuildContext context) => Container(
                height: 600,
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "Assets/complaint2.png",
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: title,
                        autofocus: true,
                        autocorrect: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.title),
                            hintText: "Enter title",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: subject,
                        autofocus: true,
                        autocorrect: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.messenger),
                          hintText: "Enter complaint",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextButton(
                            onPressed: () {
                              createData(
                                  title: title.text, subject: subject.text);
                              title.clear();
                              subject.clear();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.red.shade600)),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red.shade600,
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
                                color: Colors.red.shade600,
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
                          "Complaint",
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
                          "5 Complaint",
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

  Widget fetchData(ComplaintModel complaintModel) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.red.shade700,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.message,
              color: Colors.white,
            ),
          )),
      title: Text(complaintModel.title),
      subtitle: Text(complaintModel.subject),
      trailing: PopupMenuButton(
        onSelected: (value) {
          if (value == "edit") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditPage4(
                        complaintModel: ComplaintModel(
                            id: complaintModel.id,
                            title: complaintModel.title,
                            subject: complaintModel.subject))));
          }
        },
        itemBuilder: (context) {
          return <PopupMenuEntry<String>>[
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.edit),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Edit")
                ],
              ),
              value: 'edit',
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Remove")
                ],
              ),
              value: "Remove",
              onTap: () {
                final docUser = FirebaseFirestore.instance
                    .collection("Member")
                    .doc(complaintModel.id);
                docUser.delete();
              },
            )
          ];
        },
      ),
    );
  }

  Stream<Iterable<ComplaintModel>> getData() {
    return FirebaseFirestore.instance.collection("Member").snapshots().map(
        (event) => event.docs.map((e) => ComplaintModel.fromJson(e.data())));
  }

  Future<void> createData(
      {required String title, required String subject}) async {
    final docUser = FirebaseFirestore.instance.collection("Member").doc();
    final data = ComplaintModel(id: docUser.id, title: title, subject: subject);
    final json = data.toJson();
    await docUser.set(json);
  }
}

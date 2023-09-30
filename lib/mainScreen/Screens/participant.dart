import "package:cloud_firestore/cloud_firestore.dart";
import "package:digitalsociety/mainScreen/Comp/main1_comp.dart";
import "package:digitalsociety/mainScreen/Model/chairman_member_model.dart";
import "package:digitalsociety/mainScreen/Screens/editPage1.dart";
import "package:digitalsociety/mainScreen/mainScree.dart";
import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class PublicScreen extends StatefulWidget {
  const PublicScreen({super.key});

  @override
  State<PublicScreen> createState() => _PublicScreenState();
}

class _PublicScreenState extends State<PublicScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
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
                      "Assets/family.png",
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        autofocus: true,
                        autocorrect: true,
                        controller: name,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Enter Name",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: email,
                        autofocus: true,
                        autocorrect: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Enter email",
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
                              createUser(name: name.text, email: email.text);
                              Navigator.pop(context);
                              name.clear();
                              email.clear();
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.deepPurple)),
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
                                      builder: (context) => MainScreen1()));
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
        trailing: PopupMenuButton(
          onSelected: (value) {
            if(value == "edit"){
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditPage1(
                                partipantModel: PartipantModel(
                                    id: partipantModel.id,
                                    name: partipantModel.name,
                                    email: partipantModel.email),
                              )));
            }
          },
          itemBuilder: (context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem(
                value: "edit",
                child: Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Edit")
                  ],
                ),
                onTap: () {
                  
                },
              ),
              PopupMenuItem(
                value: "Remove",
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
                onTap: () {
                  final docUser = FirebaseFirestore.instance
                      .collection("Chairman1")
                      .doc(partipantModel.id);
                  docUser.delete();
                },
              ),
            ];
          },
        ),
      );

  Stream<Iterable<PartipantModel>> getData() {
    return FirebaseFirestore.instance.collection("Chairman1").snapshots().map(
        (event) => event.docs.map((e) => PartipantModel.fromJson(e.data())));
  }

  Future<void> createUser({required String name, required String email}) async {
    final docUser = FirebaseFirestore.instance.collection("Chairman1").doc();
    final user = PartipantModel(id: docUser.id, name: name, email: email);
    final json = user.toJson();
    await docUser.set(json);
  }
}

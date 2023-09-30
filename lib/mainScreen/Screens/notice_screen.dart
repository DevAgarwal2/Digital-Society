import "package:cloud_firestore/cloud_firestore.dart";
import "package:digitalsociety/mainScreen/Comp/main1_comp.dart";
import "package:digitalsociety/mainScreen/Model/chariman_notice_model.dart";
import "package:digitalsociety/mainScreen/Screens/editPage2.dart";
import "package:digitalsociety/mainScreen/mainScree.dart";
import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({super.key});

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController subject = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent.shade200,
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
                      "Assets/notice2.png",
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
                          prefixIcon: Icon(Icons.report),
                          hintText: "Enter notice",
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
                                    Colors.blueAccent.shade200)),
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
                                      builder: (context) => MainScreen1()));
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
      trailing: PopupMenuButton(
        onSelected: (value) {
          if (value == "Edit") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditPage2(
                        notice: Notice(
                            id: notice.id,
                            title: notice.title,
                            notice: notice.notice))));
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
              value: "Edit",
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
                  Text("Remove"),
                ],
              ),
              value: "delete",
              onTap: () {
                final docUser = FirebaseFirestore.instance
                    .collection("Chairman2")
                    .doc(notice.id);
                docUser.delete();
              },
            )
          ];
        },
      ),
    );
  }

  Stream<Iterable<Notice>> getData() {
    return FirebaseFirestore.instance
        .collection("Chairman2")
        .snapshots()
        .map((event) => event.docs.map((e) => Notice.fromJson(e.data())));
  }

  Future<void> createData(
      {required String title, required String subject}) async {
    final docUser = FirebaseFirestore.instance.collection("Chairman2").doc();
    final note = Notice(id: docUser.id, title: title, notice: subject);
    final json = note.toJson();
    await docUser.set(json);
  }
}

import "package:cloud_firestore/cloud_firestore.dart";
import "package:digitalsociety/Component/sigincomp.dart";
import "package:digitalsociety/mainScreen/Model/chairman_member_model.dart";
import "package:digitalsociety/mainScreen/Model/chariman_notice_model.dart";
import "package:digitalsociety/mainScreen/Screens/notice_screen.dart";
import "package:digitalsociety/mainScreen/Screens/participant.dart";
import "package:flutter/material.dart";

class EditPage2 extends StatefulWidget {
  Notice notice;
  EditPage2({super.key,required this.notice});

  @override
  State<EditPage2> createState() => _EditPage2State();
}

class _EditPage2State extends State<EditPage2> {
  TextEditingController title = TextEditingController();
  TextEditingController subject = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade200,
        title: Text("Edit Page"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SiginComp(
              name: "Edit title",
              controller: title,
              obstrue: false,
              icon: Icon(Icons.title)),
          SizedBox(
            height: 20,
          ),
          SiginComp(
              name: "Edit notice",
              controller: subject,
              obstrue: false,
              icon: Icon(Icons.report_rounded)),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              
             
              final editTitle = title.text;
              final editSubject = subject.text;
              final docUser = FirebaseFirestore.instance
                  .collection("Chairman2")
                  .doc(widget.notice.id);
                  docUser.update({
                    "id":widget.notice.id,
                  "title":editTitle,
                  "notice":editSubject
                  });
                  Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => NoticeScreen()));
            },
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blueAccent.shade200)),
          ),
        ],
      )),
    );
  }
}

import "package:cloud_firestore/cloud_firestore.dart";
import "package:digitalsociety/Component/sigincomp.dart";
import "package:digitalsociety/mainScreen/Model/chairman_event_model.dart";
import "package:digitalsociety/mainScreen/Screens/event_screen.dart";
import "package:digitalsociety/mainScreen/Screens/participant.dart";
import "package:flutter/material.dart";

class EditPage3 extends StatefulWidget {
  EventModel eventModel;
  EditPage3({super.key, required this.eventModel});

  @override
  State<EditPage3> createState() => _EditPage3State();
}

class _EditPage3State extends State<EditPage3> {
  TextEditingController title = TextEditingController();
  TextEditingController subject = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade600,
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
              name: "Edit subject",
              controller: subject,
              obstrue: false,
              icon: Icon(Icons.event)),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              
             
              final editTitle = title.text;
              final editSubject = subject.text;
              final docUser = FirebaseFirestore.instance
                  .collection("Chairman3")
                  .doc(widget.eventModel.id);
                  docUser.update({
                    "id":widget.eventModel.id,
                  "title":editTitle,
                  "subject":editSubject
                  });
                  Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>EventScreen()));
            },
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepOrange.shade600)),
          ),
        ],
      )),
    );
  }
}

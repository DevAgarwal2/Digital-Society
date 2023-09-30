import "package:cloud_firestore/cloud_firestore.dart";
import "package:digitalsociety/Component/sigincomp.dart";
import "package:digitalsociety/Member/complain2.dart";
import "package:digitalsociety/mainScreen/Model/chairman_event_model.dart";
import "package:digitalsociety/mainScreen/Model/complaint_model.dart";
import "package:digitalsociety/mainScreen/Screens/event_screen.dart";
import "package:digitalsociety/mainScreen/Screens/participant.dart";
import "package:flutter/material.dart";

class EditPage4 extends StatefulWidget {
  ComplaintModel complaintModel;
  EditPage4({super.key, required this.complaintModel});

  @override
  State<EditPage4> createState() => _EditPage4State();
}

class _EditPage4State extends State<EditPage4> {
  TextEditingController title = TextEditingController();
  TextEditingController subject = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
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
                  .collection("Member")
                  .doc(widget.complaintModel.id);
                  docUser.update({
                    "id":widget.complaintModel.id,
                  "title":editTitle,
                  "subject":editSubject
                  });
                  Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>ComplaintScreen2()));
            },
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red.shade800)),
          ),
        ],
      )),
    );
  }
}

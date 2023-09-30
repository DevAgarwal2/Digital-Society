import "package:cloud_firestore/cloud_firestore.dart";
import "package:digitalsociety/Component/sigincomp.dart";
import "package:digitalsociety/mainScreen/Model/chairman_member_model.dart";
import "package:digitalsociety/mainScreen/Screens/participant.dart";
import "package:flutter/material.dart";

class EditPage1 extends StatefulWidget {
  PartipantModel partipantModel;
  EditPage1({super.key, required this.partipantModel});

  @override
  State<EditPage1> createState() => _EditPage1State();
}

class _EditPage1State extends State<EditPage1> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Edit Page"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SiginComp(
              name: "Edit Name",
              controller: name,
              obstrue: false,
              icon: Icon(Icons.person)),
          SizedBox(
            height: 20,
          ),
          SiginComp(
              name: "Edit Email",
              controller: email,
              obstrue: false,
              icon: Icon(Icons.email)),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              
             
              final editName = name.text;
              final editEmail = email.text;
              final docUser = FirebaseFirestore.instance
                  .collection("Chairman1")
                  .doc(widget.partipantModel.id);
                  docUser.update({
                    "id":widget.partipantModel.id,
                  "name":editName,
                  "email":editEmail
                  });
                  Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => PublicScreen()));
            },
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple)),
          ),
        ],
      )),
    );
  }
}

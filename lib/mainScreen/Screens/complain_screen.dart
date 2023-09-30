import "package:cloud_firestore/cloud_firestore.dart";
import "package:digitalsociety/mainScreen/Comp/main1_comp.dart";
import "package:digitalsociety/mainScreen/Model/complaint_model.dart";
import "package:digitalsociety/mainScreen/mainScree.dart";
import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.red.shade600,
      body: StreamBuilder(stream: getData(), builder:(context, snapshot) {
        if(snapshot.hasData){
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
                              builder: (context) => MainScreen1()));
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
          Main1(ok: ListView(
            children: data!.map(fetchData).toList(),
          ))
        ],
      ));
      
        }
        else if(snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()),);
        }
        return SpinKitDualRing(color: Colors.white);
      },)
    );
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
      trailing: IconButton(onPressed: (){
        
                final docUser = FirebaseFirestore.instance
                    .collection("Member")
                    .doc(complaintModel.id);
                docUser.delete();
              
      }, icon: Icon(Icons.delete,color: Colors.red,))
       
    );
  }

  Stream<Iterable<ComplaintModel>> getData() {
    return FirebaseFirestore.instance.collection("Member").snapshots().map(
        (event) => event.docs.map((e) => ComplaintModel.fromJson(e.data())));
  }

}

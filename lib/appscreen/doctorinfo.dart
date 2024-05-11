import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:med_vista/appscreen/Detailinfo_doctor.dart';
import 'package:med_vista/colors.dart';

class DoctorInfo extends StatefulWidget {
  String? specializationId;
  DoctorInfo(this.specializationId);

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        title: Text(
          "Find Your Health Concern",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("doctors")
            .where("specialization", isEqualTo: widget.specializationId.toString())
            .snapshots(),
        builder: (context, snapshot) {
    if(snapshot.connectionState == ConnectionState.active){
      if(snapshot.hasData){
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 20,left: 15,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 50,backgroundImage: NetworkImage("${snapshot.data!.docs[index]["image"]}"),),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data!.docs[index]["name"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text("${snapshot.data!.docs[index]["specialization"]}",style: TextStyle(
                            fontSize: 16,
                          ),),
                          Text("${snapshot.data!.docs[index]["experience"]} of experience",style: TextStyle(
                            fontSize: 16
                          )),
                        ],
                      ),
                    ],
                  ),
                  Divider(height: 40),
                  Row(
                    children: [
                      Text(
                        "Consultation Fees",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "${snapshot.data!.docs[index]["fee"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailInfo(),));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Text(
                            "View Doctor",
                            style: TextStyle(
                              color: blue_color,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(blue_color),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        child: Text(
                          "Book Appointment",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 4,
                    height: 30,
                  ),
                ],
              ),
            );
          },
        );
      }
      else if(snapshot.hasError){
        return Center(child: Text("${snapshot.hasError.toString()}"),);
      }
      else{
        return Center(child: Text(",No data found"),);
      }
    }
    else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Center(child: Text("No doctors found",style: TextStyle(fontSize: 20),))
        ],
      );
    }
        },
      ),
    );
  }
}

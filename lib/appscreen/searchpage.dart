import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:med_vista/colors.dart';

class SearchPage extends StatefulWidget {

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  var query;
  final List<String> specializationItems = [
    "Dermatologist",
    "General physician",
    "Dentist",
    "Sexologist",
    "Gynaecologist",
    "Orthopedic",
    "Psychologist",
    "E N T specialist",
    "Pediatrician",
    "Homeopathy",
    "gastroenterologist",
    "Ophthalmologist",
    "Cardiologist",
    "Physiotherapist",
    "Neurologist",
    "Pulmonologists",
    "Nephrologists",
    "General Surgeon",
    "oncologist",
    "Urologist",
    "Nutritionist",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        title: Text("Search for doctors",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: AnimatedSearchBar(
                label: "Search",
                controller: searchController,
                onFieldSubmitted: (p0) {
                  setState(() {
                    query =searchController;
                  });
                },
                onChanged: (p0) {
                  setState(() {
                    query =searchController;
                  });
                },
                onClose: () {
                  query = null;
                },
              ),
            ),
           // query == null ?
            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection("specs").snapshots(), builder: (context, snapshot) {
              if(ConnectionState == ConnectionState.active){
                if(snapshot.hasData){
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Container(
                          width: MediaQuery.of(context).size.height,
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          padding: EdgeInsets.symmetric(vertical: 18,horizontal: 20),
                          decoration: BoxDecoration(border: Border.all(color: Colors.black.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Text("${snapshot.data!.docs[index]["id"].toString()}",style: TextStyle(fontSize: 15),)
                      );
                    },);
                }
                else if(snapshot.hasError){
                  return Center(child: Text("${snapshot.hasError.toString()}"),);
                }
                else{
                  return Center(child: Text(",No data found"),);
                }
              }
              else{
                return Center(child: CircularProgressIndicator());
              }
            },) 
            //     :
            // StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection("specs").where("id",isGreaterThanOrEqualTo: query.toString().toUpperCase()).snapshots(), builder: (context, snapshot) {
            //   if(ConnectionState == ConnectionState.active){
            //     if(snapshot.hasData){
            //       return ListView.builder(
            //         shrinkWrap: true,
            //         physics: NeverScrollableScrollPhysics(),
            //         itemCount: specializationItems.length,
            //         itemBuilder: (context, index) {
            //           return Container(
            //               width: MediaQuery.of(context).size.height,
            //               margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            //               padding: EdgeInsets.symmetric(vertical: 18,horizontal: 20),
            //               decoration: BoxDecoration(border: Border.all(color: Colors.black.withOpacity(0.2)),
            //                   borderRadius: BorderRadius.circular(3)
            //               ),
            //               child: Text("${snapshot.data!.docs[index]["id"].toString().substring(0,0).toUpperCase()}"+"${snapshot.data!.docs[index]["id"].toString()}",style: TextStyle(fontSize: 15),)
            //           );
            //         },);
            //     }
            //     else if(snapshot.hasError){
            //       return Center(child: Text("${snapshot.hasError.toString()}"),);
            //     }
            //     else{
            //       return Center(child: Text(",No data found"),);
            //     }
            //   }
            //   else{
            //     return Center(child: CircularProgressIndicator());
            //   }
            // },)
          ],
        ),
      ),
    );
  }
}

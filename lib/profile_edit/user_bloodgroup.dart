import 'package:flutter/material.dart';

import '../colors.dart';
import '../user/usermodel.dart';

class UserBloodGroup extends StatefulWidget {
  const UserBloodGroup({Key? key}) : super(key: key);

  @override
  State<UserBloodGroup> createState() => _UserBloodGroupState();
}

class _UserBloodGroupState extends State<UserBloodGroup> {

  var bloodgroup;
  var colApositive = Colors.white;
  var colAnegative = Colors.white;
  var colBpositive = Colors.white;
  var colBnegative = Colors.white;
  var colOPositive = Colors.white;
  var colOnegative = Colors.white;
  var colABpositive = Colors.white;
  var colABnegative = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        actions: [
          TextButton(onPressed: (){
            UserDataModel().addBloodGroup(bloodgroup);
            Navigator.pop(context);
          },
              child: const Text("Save",style: TextStyle(
                  color: Colors.white,
                  fontSize: 22
              ),))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: blue_color,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text("What is your blood group?",style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),),
            ),
          ),
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    colApositive = Colors.blue;
                    colAnegative = Colors.white;
                    colABnegative = Colors.white;
                    colABpositive = Colors.white;
                    colBnegative = Colors.white;
                    colBpositive = Colors.white;
                    colOnegative = Colors.white;
                    colOPositive = Colors.white;
                    bloodgroup = "A+";
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width*0.12,
                  decoration: BoxDecoration(
                    color: colApositive,
                      border: Border.all(color: Colors.grey)
                  ),
                  child: const Center(child: Text("A+",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    colApositive = Colors.white;
                    colAnegative = Colors.blue;
                    colABnegative = Colors.white;
                    colABpositive = Colors.white;
                    colBnegative = Colors.white;
                    colBpositive = Colors.white;
                    colOnegative = Colors.white;
                    colOPositive = Colors.white;
                    bloodgroup = "A-";
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width*0.12,
                  decoration: BoxDecoration(
                    color: colAnegative,
                      border: Border.all(color: Colors.grey)
                  ),
                  child: const Center(child: Text("A-",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    colApositive = Colors.white;
                    colAnegative = Colors.white;
                    colABnegative = Colors.white;
                    colABpositive = Colors.white;
                    colBnegative = Colors.white;
                    colBpositive = Colors.blue;
                    colOnegative = Colors.white;
                    colOPositive = Colors.white;
                    bloodgroup = "B+";
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width*0.12,
                  decoration: BoxDecoration(
                    color: colBpositive,
                      border: Border.all(color: Colors.grey)
                  ),
                  child: const Center(child: Text("B+",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    colApositive = Colors.white;
                    colAnegative = Colors.white;
                    colABnegative = Colors.white;
                    colABpositive = Colors.white;
                    colBnegative = Colors.blue;
                    colBpositive = Colors.white;
                    colOnegative = Colors.white;
                    colOPositive = Colors.white;
                    bloodgroup = "B-";
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width*0.12,
                  decoration: BoxDecoration(
                    color: colBnegative,
                      border: Border.all(color: Colors.grey)
                  ),
                  child: const Center(child: Text("B-",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    colApositive = Colors.white;
                    colAnegative = Colors.white;
                    colABnegative = Colors.white;
                    colABpositive = Colors.white;
                    colBnegative = Colors.white;
                    colBpositive = Colors.white;
                    colOnegative = Colors.white;
                    colOPositive = Colors.blue;
                    bloodgroup = "O+";
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width*0.12,
                  decoration: BoxDecoration(
                    color: colOPositive,
                      border: Border.all(color: Colors.grey)
                  ),
                  child: const Center(child: Text("O+",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    colApositive = Colors.white;
                    colAnegative = Colors.white;
                    colABnegative = Colors.white;
                    colABpositive = Colors.white;
                    colBnegative = Colors.white;
                    colBpositive = Colors.white;
                    colOnegative = Colors.blue;
                    colOPositive = Colors.white;
                    bloodgroup = "O-";
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width*0.12,
                  decoration: BoxDecoration(
                    color: colOnegative,
                      border: Border.all(color: Colors.grey)
                  ),
                  child: const Center(child: Text("O-",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    colApositive = Colors.white;
                    colAnegative = Colors.white;
                    colABnegative = Colors.white;
                    colABpositive = Colors.blue;
                    colBnegative = Colors.white;
                    colBpositive = Colors.white;
                    colOnegative = Colors.white;
                    colOPositive = Colors.white;
                    bloodgroup = "AB+";
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width*0.12,
                  decoration: BoxDecoration(
                    color: colABpositive,
                      border: Border.all(color: Colors.grey)
                  ),
                  child: const Center(child: Text("AB+",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    colApositive = Colors.white;
                    colAnegative = Colors.white;
                    colABnegative = Colors.blue;
                    colABpositive = Colors.white;
                    colBnegative = Colors.white;
                    colBpositive = Colors.white;
                    colOnegative = Colors.white;
                    colOPositive = Colors.white;
                    bloodgroup = "AB-";
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width*0.12,
                  decoration: BoxDecoration(
                    color: colABnegative,
                      border: Border.all(color: Colors.grey)
                  ),
                  child: const Center(child: Text("AB-",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
            ]
          )
        ],
      ),
    );
  }
}

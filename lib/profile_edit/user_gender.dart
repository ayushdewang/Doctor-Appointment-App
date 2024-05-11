import 'package:flutter/material.dart';
import 'package:med_vista/colors.dart';
import 'package:med_vista/user/usermodel.dart';

class UserGender extends StatefulWidget {
  const UserGender({super.key});



  @override
  State<UserGender> createState() => _UserGenderState();
}

class _UserGenderState extends State<UserGender> {

  var gender;
  var malecolor1 = Colors.black;
  var malecolor2 = Colors.white;
  var femalecolor1 = Colors.black;
  var femalecolor2 = Colors.white;
  var othercolor1 = Colors.black;
  var othercolor2 = Colors.white;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        actions: [
          TextButton(onPressed: (){
            UserDataModel().addGender(gender);
            Navigator.pop(context);
            setState(() {

            });
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
              child: Text("Which gender do you\nidentify with?",style: TextStyle(
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
                    gender = 'Male';
                    malecolor1 = Colors.blue;
                    malecolor2 = Colors.blue;
                    femalecolor1 = Colors.black;
                    femalecolor2 = Colors.white;
                    othercolor1 = Colors.black;
                    othercolor2 = Colors.white;
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width*0.2,
                  decoration: BoxDecoration(
                    color: malecolor2,
                    border: Border.all(color: malecolor1)
                  ),
                  child: const Center(child: Text("MALE",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    gender = 'Female';
                    malecolor1 = Colors.black;
                    malecolor2 = Colors.white;
                    femalecolor1 = Colors.blue;
                    femalecolor2 = Colors.blue;
                    othercolor1 = Colors.black;
                    othercolor2 = Colors.white;
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width*0.2,
                  decoration: BoxDecoration(
                      color: femalecolor2,
                      border: Border.all(color: femalecolor1)
                  ),
                  child: const Center(child: Text("FEMALE",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    gender = 'Other';
                    malecolor1 = Colors.black;
                    malecolor2 = Colors.white;
                    femalecolor1 = Colors.black;
                    femalecolor2 = Colors.white;
                    othercolor1 = Colors.blue;
                    othercolor2 = Colors.blue;
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width*0.2,
                  decoration: BoxDecoration(
                      color: othercolor2,
                      border: Border.all(color: othercolor1)
                  ),
                  child: const Center(child: Text("OTHER",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:med_vista/colors.dart';
import 'package:med_vista/user/usermodel.dart';

class UserName extends StatefulWidget {
  const UserName({super.key});


  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue_color,
      appBar: AppBar(
        backgroundColor: blue_color,
        actions: [
          TextButton(onPressed: (){
            UserDataModel().addName(namecontroller.text.toString());
            Navigator.pop(context);
          },
              child: const Text("Save",style: TextStyle(
                color: Colors.white,
                fontSize: 22
              ),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("What is your name?",style: TextStyle(
              fontSize: 28,
              color: Colors.white
            ),),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                border: BorderDirectional(bottom: BorderSide(color: Colors.white,width: 4))
              ),
              child: TextField(
                controller: namecontroller,
                style: const TextStyle(color: Colors.white,fontSize: 30),
                decoration: InputDecoration(
                  hintText: "Enter Full Name",hintStyle:
                TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 30),
                  border: InputBorder.none
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

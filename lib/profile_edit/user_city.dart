import 'package:flutter/material.dart';
import 'package:med_vista/user/usermodel.dart';

import '../colors.dart';
class UserCity extends StatefulWidget {
  const UserCity({super.key});


  @override
  State<UserCity> createState() => _UserCityState();
}

class _UserCityState extends State<UserCity> {

  TextEditingController citycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue_color,
      appBar: AppBar(
        backgroundColor: blue_color,
        actions: [
          TextButton(onPressed: (){
            UserDataModel().addCity(citycontroller.text.toString());
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Which city are you from?",style: TextStyle(
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
                controller: citycontroller,
                style: const TextStyle(color: Colors.white,fontSize: 30),
                decoration: InputDecoration(
                    hintText: "Enter your city",hintStyle:
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_vista/user/usermodel.dart';

import '../colors.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({super.key});


  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  TextEditingController emergencycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue_color,
      appBar: AppBar(
        backgroundColor: blue_color,
        actions: [
          TextButton(onPressed: (){
            UserDataModel().addEmergencyContact(emergencycontroller.text.toString());
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
            const Text("Who is your emergency\ncontact?",style: TextStyle(
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
                controller: emergencycontroller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10)
                ],
                style: const TextStyle(color: Colors.white,fontSize: 30),
                decoration: InputDecoration(
                    hintText: "Enter 10 digits",hintStyle:
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

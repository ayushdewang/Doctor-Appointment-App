import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_vista/user/usermodel.dart';

import '../colors.dart';

class UserWeight extends StatefulWidget {
  const UserWeight({super.key});


  @override
  State<UserWeight> createState() => _UserWeightState();
}

class _UserWeightState extends State<UserWeight> {
  TextEditingController weightcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue_color,
      appBar: AppBar(
        backgroundColor: blue_color,
        actions: [
          TextButton(onPressed: (){
            UserDataModel().addWeight(weightcontroller.text.toString());
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
            const Text("How much do you weigh?\n(in kgs)",style: TextStyle(
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
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(3)
                ],
                controller: weightcontroller,
                style: const TextStyle(color: Colors.white,fontSize: 30),
                decoration: InputDecoration(
                    hintText: "Enter your weight",hintStyle:
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

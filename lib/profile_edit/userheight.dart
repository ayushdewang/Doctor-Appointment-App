import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';
import '../user/usermodel.dart';

class UserHeight extends StatefulWidget {
  const UserHeight({Key? key}) : super(key: key);

  @override
  State<UserHeight> createState() => _UserHeightState();
}
class _UserHeightState extends State<UserHeight> {
  TextEditingController feetcontroller = TextEditingController();
  TextEditingController inchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        actions: [
          TextButton(onPressed: (){
            UserDataModel().addHeight("${feetcontroller.text} feet ${inchcontroller.text} inch");
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
              child: Text("What is your height?",style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),),
            ),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Row(
              children: [
                const Text("Feet"),
                const SizedBox(width: 20,),
                Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: feetcontroller,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1)
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(""),
                ),
                const Text("Inch"),
                const SizedBox(width: 20,),
                Expanded(child: TextField(
                  controller: inchcontroller,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(2)
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

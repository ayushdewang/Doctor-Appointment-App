import 'package:flutter/material.dart';

import '../colors.dart';
import '../user/usermodel.dart';

class UserBirthDate extends StatefulWidget {
  const UserBirthDate({Key? key}) : super(key: key);

  @override
  State<UserBirthDate> createState() => _UserBirthDateState();
}

class _UserBirthDateState extends State<UserBirthDate> {

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue_color,
      appBar: AppBar(
        backgroundColor: blue_color,
        actions: [
          TextButton(onPressed: (){
            UserDataModel().addBirthDate("${selectedDate.toLocal()}".split(' ')[0]);
            Navigator.pop(context);
          },
              child: const Text("Save",style: TextStyle(
                  color: Colors.white,
                  fontSize: 22
              ),))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Select your birth date?",style: TextStyle(
            color: Colors.white,
            fontSize: 28
          ),),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child:  Center(
              child: ElevatedButton(
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(side: BorderSide(color: Colors.white)))),
                onPressed: () => _selectDate(context),
                child: Text('Select date',style: TextStyle(color: blue_color),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

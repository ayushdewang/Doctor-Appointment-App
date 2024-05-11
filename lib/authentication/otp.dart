import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:med_vista/appscreen/homescreen.dart';
import 'package:med_vista/authentication/login.dart';



class OtpScreen extends StatefulWidget {
  String verificationid;
  String phonenumber;
  OtpScreen(
       {super.key, required this.verificationid,required this.phonenumber}
      );
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var otpcontroller;

  Future<void> fetchUserPhoneNumber() async {
    try {
      DocumentSnapshot document =
      await FirebaseFirestore.instance.collection('users').doc("+91"+widget.phonenumber).get();

      if (document.exists) {
        // If the document exists, extract the phone number
        print("document exist");
      } else {
        // If the document does not exist
        FirebaseFirestore.instance.collection("users").doc("+91"+widget.phonenumber).set({
          "phone_number": "+91${widget.phonenumber}"
        });
        print("new user created");
      }
    } catch (e) {
      // Handle errors, e.g., FirebaseException
      print("Error getting user phone number: $e");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
                },
                icon: const Icon(Icons.arrow_back_sharp),
                label: const Text("")),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Enter the 6 digit OTP sent to\n${widget.phonenumber}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (value){
                  setState(() {
                    otpcontroller = value;
                  });
                },
              )
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Didn't receive the code?",style: TextStyle(fontSize: 15),),
                TextButton(onPressed: (){}, 
                    child: const Text("Resend",style: TextStyle(fontSize: 15),)
                )
              ],
            ),
            const SizedBox(height: 20,),
            Center(
              child: SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(onPressed: ()async{
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                        verificationId: widget.verificationid,
                        smsCode: otpcontroller.toString());
                    FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
                    });
                  } catch (ex) {
                    log(ex.toString());
                  }
                  fetchUserPhoneNumber();
                },
                    child: const Text("Confirm",style: TextStyle(fontSize: 16),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

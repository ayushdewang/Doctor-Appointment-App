import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_vista/authentication/doctor_login.dart';
import 'package:med_vista/authentication/otp.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phonecontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/logo1.jpg"),
              const SizedBox(height: 35),
              const Text(
                "Let’s get started! Enter your mobile number",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                child: TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  keyboardType: TextInputType.number,
                  controller: phonecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter your number',
                    labelText: 'Mobile number',
                  ),
                ),
              ),
              const Text("By continuing, you agree to our"),
              const Text(
                "Terms & Conditions",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
                width: 180,
                child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException ex) {},
                          codeSent: (String verificationid, int? resendtoken) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpScreen(
                                    verificationid: verificationid,
                                    phonenumber:
                                        phonecontroller.text.toString(),
                                  ),
                                ));
                          },
                          codeAutoRetrievalTimeout: (String verificationid) {},
                          phoneNumber: '+91${phonecontroller.text}');
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorLogin(),
                        ));
                  },
                  child: const Text("Login as doctor! click here"))
            ],
          ),
        ),
      ),
    );
  }
}

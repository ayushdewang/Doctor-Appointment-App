import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_vista/authentication/login.dart';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({super.key});


  @override
  State<DoctorLogin> createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(

          children: [
            Image.asset("assets/logo1.jpg"),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22,vertical: 15),
              child: TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  hintText: 'Enter your number',
                  labelText: 'Mobile number',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  hintText: 'Enter your password',
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Text("By continuing, you agree to our"),
            const Text("Terms & Conditions",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
            const SizedBox(height: 5,),
            SizedBox(
              height: 45,
              width: 180,
              child: ElevatedButton(onPressed: (){},
                  child: const Text("Continue",style: TextStyle(fontSize: 15,color: Colors.black),)
              ),
            ),
            const SizedBox(height: 20,),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
            },
                child: const Text("Login as user! click here")
            )
          ],
        ),
      ),
    ),);
  }
}

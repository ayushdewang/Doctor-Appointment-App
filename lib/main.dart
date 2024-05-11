import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:med_vista/appscreen/homescreen.dart';
import 'package:med_vista/appscreen/onboardingscreen.dart';
import 'package:med_vista/authentication/checkuser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'appscreen/user_detail_screen.dart';

var initscreen;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initscreen = preferences.getInt('initscreen');
  await preferences.setInt("initscreen", 1);
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        storageBucket: "myhospital-9ef64.appspot.com",
          apiKey: 'AIzaSyCb8N_o6sdK0veq5GIO9ogQ-8c2hfbLkYg',
          appId: '1:489943528248:android:27536d88560d1f557e87cd',
          messagingSenderId: '489943528248',
          projectId: 'myhospital-9ef64')
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "MedVista",
    initialRoute: initscreen == 0 || initscreen == null ? '/onboarding' : '/splash',
    routes: {
      '/' : (context) => const HomeScreen(),
      '/splash' : (context) => const SplashScreen(),
      '/onboarding' : (context) => const Splash1(),
      '/home' : (context) => const HomeScreen(),
      '/userdetail' : (context) => const UserDetailScreen(),
    },
    //home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
      Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckUser(),
            )),
      );
     }



  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image(image: AssetImage("assets/splash_logo.png"),width: 250,),
            Image.asset("assets/splash_logo.png", width: 100),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Connecting health,one appointment at a time",
              style: TextStyle(
                  fontSize: 8,
                  color: Colors.blueGrey,
                  decoration: TextDecoration.none),
            ),
          ],
        )));
  }
}

class Splash1 extends StatefulWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          )),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image(image: AssetImage("assets/splash_logo.png"),width: 250,),
            Image.asset("assets/splash_logo.png", width: 100),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Connecting health,one appointment at a time",
              style: TextStyle(
                  fontSize: 8,
                  color: Colors.blueGrey,
                  decoration: TextDecoration.none),
            ),
          ],
        )));
  }
}



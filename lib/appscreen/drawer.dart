import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:med_vista/user/usermodel.dart';

import '../authentication/login.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});


  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  logout(){
    FirebaseAuth.instance.signOut().then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchUserDetail();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      userImage!= null ?
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(userImage),
                      ): const CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person),
                      ),
                      const SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userName != null ? userName.toString() : "",style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                          ),),
                          Text(FirebaseAuth.instance.currentUser!.phoneNumber.toString(),style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300
                          ),),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                const Divider(),
                ListTile(
                  onTap: (){
                    Navigator.pushNamed(context,"/userdetail",);
                  },
                  trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                  title: const Text("View and edit profile",style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17
                  ),),
                )
              ],
            ),
            const Divider(thickness: 7,),
            ListTile(
              onTap: (){},
              title: Text("Appointments",style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.black.withOpacity(0.7)
              ),),
              leading: const Icon(Icons.book_rounded,color: Colors.blue,size: 30,),
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            ),
            ListTile(
              onTap: (){},
              title: Text("My Doctors",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.7)
              ),),
              leading: const Icon(Icons.account_box,color: Colors.blue,size: 30,),
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            ),
            ListTile(
              onTap: (){},
              title: Text("Settings",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.7)
              ),),
              leading: const Icon(Icons.settings,color: Colors.blue,size: 30,),
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 45,
              width: 150,
              child: ElevatedButton(onPressed: logout,
                  style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                  shape:
                  MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3))),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Logout",style: TextStyle(
                        color: Colors.white,
                        fontSize: 17
                      ),),
                      Icon(Icons.logout,
                      color: Colors.white,)
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

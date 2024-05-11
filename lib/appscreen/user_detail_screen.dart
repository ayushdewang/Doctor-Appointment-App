import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:med_vista/profile_edit/email.dart';
import 'package:med_vista/profile_edit/emergency_contact.dart';
import 'package:med_vista/profile_edit/maritial_status.dart';
import 'package:med_vista/profile_edit/user_city.dart';
import 'package:med_vista/profile_edit/user_gender.dart';
import 'package:med_vista/profile_edit/user_name.dart';
import 'package:med_vista/profile_edit/userbirth.dart';
import 'package:med_vista/profile_edit/userheight.dart';
import 'package:med_vista/profile_edit/weight.dart';
import 'package:med_vista/user/usermodel.dart';

import '../colors.dart';
import '../profile_edit/user_bloodgroup.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});


  @override
  State<UserDetailScreen> createState() => _UserDetailScreen();
}

class _UserDetailScreen extends State<UserDetailScreen> {
  bool? ischecked = false;
  var userphone = FirebaseAuth.instance.currentUser?.phoneNumber;
  File? pickedImage;
  showAlertBox(){
    return showDialog(context: context, builder:  (BuildContext context){
      return AlertDialog(
        title: const Text("Pick Image From"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: (){
      pickImage(ImageSource.camera);
      Navigator.pop(context);
      },
            leading: const Icon(Icons.camera_alt_outlined),
            title: const Text("Camera"),
          ),
          ListTile(
            onTap: (){
      pickImage(ImageSource.gallery);
      Navigator.pop(context);
      },
            leading: const Icon(Icons.image),
            title: const Text("Gallery"),
          )
        ],
      ));
    });
  }
  uploadImg()async{

    UploadTask uploadTask = FirebaseStorage.instance.ref("userprofile").child("${FirebaseAuth.instance.currentUser!.phoneNumber}_profilepic.jpg").putFile(pickedImage!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String url = await taskSnapshot.ref.getDownloadURL();
    FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.phoneNumber.toString()).update({
      "image" : url
    }).then((value) {
      log("Image Uploaded");
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetchUserDetail();

  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        title: const Text("Profile",style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25),
              child: Text("Name",style: TextStyle(
                color: Colors.black45,
                fontSize: 17,
                fontWeight: FontWeight.w500
              ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserName(),));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(userName != null ? userName.toString() : "",style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),),
                    InkWell(
                      onTap: (){
                        showAlertBox();
                      },
                      child: userImage!= null ?
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(userImage),
                      ): const CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person),
                      )
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Contact Number",style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                    fontSize: 17
                  ),),
                  Text(FirebaseAuth.instance.currentUser!.phoneNumber.toString(),style: const TextStyle(
                      fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),),
                ],
              ),
            ),
            const Divider(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EmailId(),));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Email Id",style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                    ),),
                    Text(userEmail != null ? userEmail.toString().length <= 23 ? userEmail.toString() : userEmail.toString().substring(0,23) : "",style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ),
            ),
            const Divider(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserGender(),));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Gender",style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                    ),),
                    Text(userGender != null ? userGender.toString() : "",style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ),
            ),
            const Divider(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserBirthDate(),));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Date of Birth",style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                    ),),
                    Text(userBirthDate != null ? userBirthDate.toString() : "",style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ),
            ),
            const Divider(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserBloodGroup()));
                },
                child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Blood Group",style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                      fontSize: 17
                  ),),
                  Text(userBloodGroup != null ? userBloodGroup.toString() : "",style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                ],
              ),)
            ),
            const Divider(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MaritialStatus(),));
                  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Marital Status",style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                    ),),
                    Text(userMaritialStatus != null ? userMaritialStatus.toString() : "",style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ),
            ),
            const Divider(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserHeight(),));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Height",style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                    ),),
                    Text(userHeight != null ? userHeight.toString() : "",style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ),
            ),
            const Divider(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserWeight(),));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Weight",style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                    ),),
                    Text(userWeight != null ? userWeight.toString() : "",style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ),
            ),
            const Divider(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EmergencyContact(),));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Emergency Contact",style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                    ),),
                    Text(userEmergencyContact != null ? userEmergencyContact.toString() : "",style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ),
            ),
            const Divider(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserCity(),));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("City",style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                    ),),
                    Text(userCity != null ? userCity.toString() : "",style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ),
            ),
            const Divider(height: 30,),
          ],
        ),
      ),
    );
  }
  pickImage(ImageSource imageSource)async{
    try{
      final photo=await ImagePicker().pickImage(source: imageSource);
      if(photo==null)return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
      uploadImg();
    }
    catch(ex){
      log(ex.toString());
    }
  }
}

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserDataModel {

    final phoneno = FirebaseAuth.instance.currentUser?.phoneNumber.toString();

  void addName(String name) async {
    await FirebaseFirestore.instance.collection("users").doc("$phoneno").update({
      "name": name
    }).then((value) {
      fetchUserDetail();
      log("name updated");
    },);
  }

  void addEmailId(String emailId) async {

    await FirebaseFirestore.instance.collection("users").doc(phoneno).update({
      "emailid": emailId
    }).then((value) {
      fetchUserDetail();
      log("Email updated");
    },);
  }

  void addGender(String gender) async {

    await FirebaseFirestore.instance.collection("users").doc(phoneno).update({
      "gender": gender
    }).then((value) {
      fetchUserDetail();
      log("Gender updated");
    },);
  }

  void addWeight(String weight) async {

    await FirebaseFirestore.instance.collection("users").doc(phoneno).update({
      "weight": weight
    }).then((value) {
      fetchUserDetail();
      log("Weight updated");
    },);
  }

  void addEmergencyContact(String contact) async {

    await FirebaseFirestore.instance.collection("users").doc(phoneno).update({
      "emergencycontact": contact
    }).then((value) {
      fetchUserDetail();
      log("Emergency contact updated");
    },);
  }

  void addCity(String city) async {

    await FirebaseFirestore.instance.collection("users").doc(phoneno).update({
      "city": city
    }).then((value) {
      fetchUserDetail();
      log("City updated");
    },);
  }

  void addMaritialStatus(String maritial) async {

    await FirebaseFirestore.instance.collection("users").doc(phoneno).update({
      "maritialstatus":  maritial
    }).then((value) {
      fetchUserDetail();
      log("Maritial status updated");
    },);
  }

  void addBloodGroup(String blood) async {
    await FirebaseFirestore.instance.collection("users").doc("$phoneno").update({
      "bloodgroup": blood
    }).then((value) {
      fetchUserDetail();
      log("Blood group updated");
      },);
    }

    void addHeight(String height) async {
      await FirebaseFirestore.instance.collection("users").doc("$phoneno").update({
        "height": height
      })
          .then((value) {
        fetchUserDetail();
        log("Height updated");
      },);
    }

    void addBirthDate(String date) async {
      await FirebaseFirestore.instance.collection("users").doc("$phoneno").update({
        "birthdate": date
      })
          .then((value) {
        fetchUserDetail();
        log("Birth Date updated");
      },);
    }
}

var userName;
var userEmail;
var userCity;
var userMaritialStatus;
var userGender;
var userWeight;
var userEmergencyContact;
var userBloodGroup;
var userHeight;
var userBirthDate;
var userImage;


Future<void> fetchUserDetail() async {
    final userphone = FirebaseAuth.instance.currentUser?.phoneNumber.toString();

    try {
      DocumentSnapshot document =
      await FirebaseFirestore.instance.collection('users').doc('$userphone').get();

      if (document.exists) {
        // If the document exists, extract the phone number
        userName = document['name'];
        userEmail = document['emailid'];
        userGender = document['gender'];
        userCity = document['city'];
        userEmergencyContact = document['emergencycontact'];
        userMaritialStatus = document['maritialstatus'];
        userWeight = document['weight'];
        userBloodGroup = document['bloodgroup'];
        userHeight = document["height"];
        userBirthDate = document["birthdate"];
        userImage = document["image"].toString();
      } else {
        // If the document does not exist
        print('User not found');
      }
    } catch (e) {
      // Handle errors, e.g., FirebaseException
      print("Error getting user phone number: $e");
    }
  }




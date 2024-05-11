import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_vista/appscreen/doctorinfo.dart';
import 'package:med_vista/appscreen/searchpage.dart';
import 'package:med_vista/user/usermodel.dart';
import '../colors.dart';
import 'categories.dart';
import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserDetail();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Alert"),
              content: const Text("Do you want to Exit"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text("NO")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text("Exit"))
              ],
            );
          },
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
          appBar: AppBar(

            centerTitle: true,
            title: const Text("Med Vista",style: TextStyle(color: Colors.white)),
            backgroundColor: const Color.fromRGBO(41, 61, 133, 1),
          ),
          drawer: const MyDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(),));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black12,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22,vertical: 6),
                      child: Row(
                        children: [
                          Icon(Icons.search_outlined,color: Colors.black45,size: 40,),
                          SizedBox(width: 10,),
                          Text("Search for doctors",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 20),)
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 220,
                      width: 165,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                spreadRadius: 2)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: ClipRRect(
                                borderRadius:
                                const BorderRadius.vertical(top: Radius.circular(18)),
                                child: Image.asset(
                                  "assets/doctor banner.jpeg",
                                ),
                              )),
                          const Text(
                            "Instant Video\nConsult",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Categories_Sec()));
                      },
                      child: Container(
                        height: 220,
                        width: 165,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  spreadRadius: 2)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: ClipRRect(
                                  borderRadius:
                                  const BorderRadius.vertical(top: Radius.circular(18)),
                                  child: Image.asset(
                                    "assets/doctor img.jpeg",
                                  ),
                                )),
                            const Text(
                              "Book\nAppointment",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

//Book Appointment with top specialist section*******************************************

                const Divider(color: Colors.black12,thickness: 8,height: 50,),
                const Row(
                  children: [
                    SizedBox(width: 20,),
                    Icon(Icons.book_outlined),
                    SizedBox(width: 20,),
                    Text(
                      "Book appointment with top\nspecialists in your city",
                      style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                const SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo("Pediatrician"),));
      } ,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            height: 280,
                            width: 165,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      spreadRadius: 2)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    child: ClipRRect(
                                      borderRadius:
                                      const BorderRadius.vertical(top: Radius.circular(18)),
                                      child: Image.asset(
                                        "assets/pediatrician_img.png",
                                      ),
                                    )),
                                const SizedBox(height: 8,),
                                const Text(
                                  "Pediatrician",
                                  style: TextStyle(
                                      fontSize: 19, fontWeight: FontWeight.bold),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text("Consult a child specialist if your kid has a cold,cough,fev.."),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo("Dentist"),));
                            },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            height: 280,
                            width: 165,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      spreadRadius: 2)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    child: ClipRRect(
                                      borderRadius:
                                      const BorderRadius.vertical(top: Radius.circular(18)),
                                      child: Image.asset(
                                        "assets/dentist_img.png",
                                      ),
                                    )),
                                const SizedBox(height: 8,),
                                const Text(
                                  "Dentist",
                                  style: TextStyle(
                                      fontSize: 19, fontWeight: FontWeight.bold),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text("Book appointments for bleeding gums, toothache,cavities,a..."),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                    onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo("Dermatologist"),));
                    },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            height: 280,
                            width: 165,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      spreadRadius: 2)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    child: ClipRRect(
                                      borderRadius:
                                      const BorderRadius.vertical(top: Radius.circular(18)),
                                      child: Image.asset(
                                        "assets/dermatologist_img.png",
                                      ),
                                    )),
                                const SizedBox(height: 8,),
                                const Text(
                                  "Dermatologist",
                                  style: TextStyle(
                                      fontSize: 19, fontWeight: FontWeight.bold),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text("Consult for hair loss\n,skin infections,and other skin-related pr..."),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo("Orthopedic"),));
    },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            height: 280,
                            width: 165,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      spreadRadius: 2)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    child: ClipRRect(
                                      borderRadius:
                                      const BorderRadius.vertical(top: Radius.circular(18)),
                                      child: Image.asset(
                                        "assets/orthopedist_img.png",
                                      ),
                                    )),
                                const SizedBox(height: 8,),
                                const Text(
                                  "Orthopedist",
                                  style: TextStyle(
                                      fontSize: 19, fontWeight: FontWeight.bold),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text("Visit your doctor for joint pains,sprains,\narthritis, and other b..."),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Categories_Sec(),));
                    },
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
                        backgroundColor: const MaterialStatePropertyAll(Color.fromRGBO(41, 61, 133, 1))),
                child: const Text("View All Specialists",style: TextStyle(color: Colors.white),)
                ),
                SizedBox(height: 20,),
                //const Divider(color: Colors.black12,thickness: 8,height: 50,),
//                 const SizedBox(height: 20,),
//                 const Row(
//                   children: [
//                     SizedBox(width: 20,),
//                     Icon(Icons.book_outlined),
//                     SizedBox(width: 20,),
//                     Text(
//                       "Doctors Available Near You",
//                       style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//
// //Section available doctors near you//****************************************
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 22,vertical: 30),
//                         child: Row(
//                           children: [
//                             CircleAvatar(radius: 50,),
//                             SizedBox(width: 15),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Doctor Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                                 Text("Doctor Specialization")
//                               ],
//                             )
//                           ],
//                         ),
//                       ),


//Community section ************************************************************

                Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.1),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                        child: Text("Our community of doctors and patients drive us to create technologies for better and affordable healthcare",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.supervised_user_circle_sharp,size: 30,color: blue_color,),
                              const Text("Our Users",style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black54
                              ),),
                              const Text("00",style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30
                              ),)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.add_box_rounded,size: 30,color: blue_color,),
                              const Text("Our Doctors",style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black54
                              ),),
                              const Text("00",style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 30
                              ),)
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ),
                Container(
                  color: blue_color,
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                        child: Text("Med Vista",style: TextStyle(
                          fontSize: 30,
                          color: Colors.white
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Our vision is to help mankind live healthier, longer lives by making quality healthcare accessible, affordable and convenient",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.8)
                        ),),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

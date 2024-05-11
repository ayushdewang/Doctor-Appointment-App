import 'package:flutter/material.dart';
import '../colors.dart';
import 'doctorinfo.dart';

class Categories_Sec extends StatefulWidget {
  const Categories_Sec({Key? key}) : super(key: key);

  @override
  State<Categories_Sec> createState() => _Categories_SecState();
}

class _Categories_SecState extends State<Categories_Sec> {
  final List<String> specializationItems = [
    "Dermatologist",
    "General physician",
    "Dentist",
    "Sexologist",
    "Gynaecologist",
    "Orthopedic",
    "Psychologist",
    "E N T specialist",
    "Pediatrician",
    "Homeopathy",
    "gastroenterologist",
    "Ophthalmologist",
    "Cardiologist",
    "Physiotherapist",
    "Neurologist",
    "Pulmonologists",
    "Nephrologists",
    "General Surgeon",
    "oncologist",
    "Urologist",
    "Nutritionist",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        title: const Text("Find Doctors",style: TextStyle(
          color: Colors.white
        )),
      ),
      body: Container(
        color: blue_color.withOpacity(1),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: const Text("All Specialist",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[1].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset("assets/categories icon/covid_icon-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("COVID\n",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[0].toString()),));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/skin_acne_icon-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Skin &\nHair",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
          
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[4].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/women_icon-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Women's\nHealth",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[1].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/general_physician_icon-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("General\nPhysician",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                ],
              ),
          
          const Divider(color: Colors.white,height: 50,),
          //Row 1 ********************************************************************************************
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[2].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/dental_icon-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Dental\nCare",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[5].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/bones_icon-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Bones &\nJoints",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[6].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/menta_icon-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Mental\nWellness",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[7].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/ear_nose_icon-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Ear,Nose,\nThroat",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                ],
              ),
          const Divider(color: Colors.white,height: 50,),
          //Row 2 ********************************************************************************
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[3].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/sexual_health-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Sexual\nHealth",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[8].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/child_specialist-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Child\nSpecialist",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[9].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/homopathy-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Homeo-\n-pathy",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[10].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/digestive_issue-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Digestive\nIssue",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                ],
              ),
          const Divider(color: Colors.white,height: 50,),
          //Row 3 **********************************************************************************
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[11].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/eye_specialist-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Eye\nSpecialist",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[12].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/heart-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Heart\n",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[13].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/physiotherapy-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Physio-\n-therapy",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[14].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/brain_nerves-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Brain &\nNerves",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.white,height: 50,),
          //row 4 **********************************************************************************************
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[15].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/lungs-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Lungs &\nBreathing",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[16].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/kidney-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Kidney\nIssue",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[17].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/general_surgery-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("General\nSurgeon",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[1].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/diabetes-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Diabetes\n",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.white,height: 50,),
//row 5 ******************************************************************************************

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[18].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/cancer-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Cancer\n",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[19].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/urinary-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Urinary\nIssues",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorInfo(specializationItems[20].toString()),));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(radius: 35,backgroundColor: Colors.white,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/categories icon/diet_nutrition-removebg-preview.png",)),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Diet &\nNutrition",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorInfo(),));
                    },
                    child: const Column(
                      children: [
                        Text("                ")
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../colors.dart';
import '../user/usermodel.dart';

class MaritialStatus extends StatefulWidget {
  const MaritialStatus({super.key});


  @override
  State<MaritialStatus> createState() => _MaritialStatusState();
}

class _MaritialStatusState extends State<MaritialStatus> {

  var status;
  var status1color1 = Colors.black;
  var status1color2 = Colors.white;
  var status2color1 = Colors.black;
  var status2color2 = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        actions: [
          TextButton(onPressed: (){
            UserDataModel().addMaritialStatus(status);
            Navigator.pop(context);
            setState(() {
            });
          },
              child: const Text("Save",style: TextStyle(
                  color: Colors.white,
                  fontSize: 22
              ),))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: blue_color,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text("Are you married?",style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),),
            ),
          ),
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    status = 'Single';
                    status1color1 = Colors.blue;
                    status1color2 = Colors.blue;
                    status2color1 = Colors.black;
                    status2color2 = Colors.white;

                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width*0.2,
                  decoration: BoxDecoration(
                      color: status1color2,
                      border: Border.all(color: status1color1)
                  ),
                  child: const Center(child: Text("Single",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    status = 'Married';
                    status1color1 = Colors.black;
                    status1color2 = Colors.white;
                    status2color1 = Colors.blue;
                    status2color2 = Colors.blue;

                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width*0.2,
                  decoration: BoxDecoration(
                      color: status2color2,
                      border: Border.all(color: status2color1)
                  ),
                  child: const Center(child: Text("Married",style:
                  TextStyle(
                      color: Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

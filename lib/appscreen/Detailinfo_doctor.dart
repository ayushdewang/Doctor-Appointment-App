import "package:flutter/material.dart";
import "package:med_vista/colors.dart";

class DetailInfo extends StatefulWidget {
  const DetailInfo({super.key});

  @override
  State<DetailInfo> createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        title: Text("Doctor Info",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}

import 'package:ex27/home.dart';
import 'package:ex27/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class spalsh extends StatefulWidget {
  const spalsh({Key? key}) : super(key: key);

  @override
  State<spalsh> createState() => _spalshState();
}

class _spalshState extends State<spalsh> {

  void initState(){
    super.initState(

    );

    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainNavigationScreen() ));
    });

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(child: Text('MyPocket',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white),)),
      ),
    );
  }
}

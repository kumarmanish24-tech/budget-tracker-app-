import 'package:ex27/home.dart';
import 'package:ex27/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';

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
        // child: Center(child: Text('MyPocket',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white),)),
        child: Center(
          child: SizedBox(height: 200,
              width: 200,
              child: Lottie.asset('assets/lotties/Animation - 1783485628800.json')),
        ),
      ),
    );
  }
}

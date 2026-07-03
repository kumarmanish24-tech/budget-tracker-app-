import 'package:flutter/material.dart';



class predata{

  String CategotyName;
  String CategotyImage;

  String date;
  String time;
  String note;
  String amount;


  predata({required this .CategotyName,required this .CategotyImage,required this .date,required this .time,required this .note,required this .amount});





}



class Category with ChangeNotifier{

   List<Map<String, String>> _fruitsWithImages = [
    {'name': 'Burger', 'img': 'assets/icons/burger.png'},
    {'name': 'Cafe', 'img': 'assets/icons/cafe.png'},
    {'name': 'Bus', 'img': 'assets/icons/bus.png'}, // Add more if needed
    {'name': 'Cinema', 'img': 'assets/icons/cinema.png'}, // Add more if needed
  ];


   List<Map<String, String>> get fruitsWithImages => _fruitsWithImages;

   List<predata> _exdata = [];
   List<predata> get exdata => _exdata;


   void exadd(predata predata){

     _exdata.add(predata);
     notifyListeners();

   }











}
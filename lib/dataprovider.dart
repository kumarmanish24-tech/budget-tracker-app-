import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'Dbhelper2.dart';


class Dataprovider with ChangeNotifier{



}


class incomedata with ChangeNotifier{

  String _balance = '00.00';
  String _Income = '00.00';
  String _expence = '00.00';
  String _totalIncome = '0.00';
  List<Map<String,dynamic>> _allRecords = [];
  List<Map<String, dynamic>> get allRecords => _allRecords;


  String get totalIncome => _totalIncome;

  String get balance  => _balance;
  String get income  => _balance;
  String get expence  => _balance;


  Future<void> refreshData() async{

    double rawAmount = await DBHelper2.getTotalIncome();
    _totalIncome = rawAmount.toStringAsFixed(2);
    _allRecords = await DBHelper2.getAllRecords();

    notifyListeners();

  }
















}



class DataExpenceProvider with ChangeNotifier{







}








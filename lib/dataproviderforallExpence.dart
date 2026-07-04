import 'package:flutter/material.dart';
import 'Dbhelper.dart';
import 'Dbhelper2.dart';
import 'DBhelper3.dart';
import 'dataprovider.dart';


class Alldata with ChangeNotifier{

  String _balance = '00.00';
  String _totalIncome = '00.00';
  String _totalExpence = '00.00';
  List<Map<String,dynamic>> _allRecords = [];


  String get balance  => _balance;
  String get totalIncome => _totalIncome;
  String get totalexpence  => _totalExpence;
  List<Map<String, dynamic>> get allRecords => _allRecords;


  Future<void> refreshData() async{

    double rawAmount = await DBHelper3.getTotalIncome();
    _totalIncome = rawAmount.toStringAsFixed(2);
    _allRecords = await DBHelper3.getAllRecords();

    notifyListeners();

  }

  Future<void> addIncomeAndRefresh(double Income, String date, String notes,String category,String note,double Expence ) async {
    // 1. Database mein insert karega
    await DBHelper3.insertIncome(Income, date, category, note, Expence);


    await refreshData();
    notifyListeners();

  }





}
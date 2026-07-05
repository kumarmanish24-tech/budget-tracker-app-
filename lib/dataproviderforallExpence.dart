import 'package:flutter/material.dart';
import 'Dbhelper.dart';
import 'Dbhelper2.dart';
import 'DBhelper3.dart';
import 'dataprovider.dart';

class alld with ChangeNotifier{
  String _balance = '00.00';
  String _totalIncome = '00';
  String _totalExpence = '00.00';
  String get balance  => _balance;
  String get totalIncome => _totalIncome;
  String get totalexpence  => _totalExpence;


  Future<void> refreshallData() async{

    double rawAmount = await DBHelper.getTotalIncome();
    _totalIncome = rawAmount.toStringAsFixed(2);
    double rawexpanse = await DBHelper2.getTotalIncome();
    _totalExpence = rawexpanse.toStringAsFixed(2);

    double rawBalance = rawAmount - rawexpanse;
    _balance = rawBalance.toStringAsFixed(2);


    notifyListeners();

  }





}


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

  Future<void> addIncomeAndRefresh(double Income, String date, String notes,String category,double Expence ) async {
    // 1. Database mein insert karega
    await DBHelper3.insertIncome(Income, date, category, notes, Expence);


    await refreshData();
    notifyListeners();

  }





}
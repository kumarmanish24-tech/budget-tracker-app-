import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'Dbhelper2.dart';
import 'Dbhelper.dart';


class Addincomedata with ChangeNotifier{


  List<Map<String,dynamic>> _allRecords = [];
  List<Map<String, dynamic>> get allRecords => _allRecords;
  String _totalIncome = '0.00';
  String get totalIncome => _totalIncome;


  Future<void> refreshData() async{

    double rawAmount = await DBHelper.getTotalIncome();
    _totalIncome = rawAmount.toStringAsFixed(2);
    _allRecords = await DBHelper.getAllRecords();

    notifyListeners();

  }

  Future<void> addIncomeAndRefresh(double amount, String date, String notes) async {
    // 1. Database mein insert karega
    await DBHelper.insertIncome(amount, date, notes);


    await refreshData();
    notifyListeners();

  }



}


class incomedata with ChangeNotifier{

  String _balance = '00.00';
  String _Income = '00.00';
  String _expence = '00.00';
  String _todayexpense = '00.00';
  String _totalIncome = '0.00';
  List<Map<String,dynamic>> _allRecords = [];
  List<Map<String, dynamic>> get allRecords => _allRecords;


  String get totalIncome => _totalIncome;
  String get todayexpense => _todayexpense;

  String get balance  => _balance;
  String get income  => _balance;
  String get expence  => _balance;


  Future<void> refreshData() async{

    double rawAmount = await DBHelper2.getTotalIncome();
    _totalIncome = rawAmount.toStringAsFixed(2);
    _allRecords = await DBHelper2.getAllRecords();
    double rawtodayExpence = await DBHelper2.getTotalIncomeForToday();
    _todayexpense = rawtodayExpence.toStringAsFixed(2);

    notifyListeners();

  }




  Future<void> addIncomeAndRefresh(double amount, String date, String category, String note) async {
    // 1. Database mein insert karega
    await DBHelper2.insertIncome(amount, date, category, note);

    // 2. Apne aap live data aur total ko refresh karega
    await refreshData();
    notifyListeners();

  }


















}



class DataExpenceProvider with ChangeNotifier{







}








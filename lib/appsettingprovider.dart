import 'dart:ffi';

import 'package:flutter/material.dart';


class sidebardata with ChangeNotifier{

  String _mode = "Light Mode";
  String _noti = "Notification off";
  String _backup = "Backup & Restore off";

  bool _isdark = false;
  bool _isnotiOn = false;
  bool _isbackupOn = false;

  String get mode => _mode;
  String get noti => _noti;
  String get backup => _backup;

  bool get isdark => _isdark;
  bool get isnotiOn => _isnotiOn;
  bool get isbachupOn => _isbackupOn;




  void Mode(bool value){
    _isdark = value;
    if(value){
      _mode = "Dark Mode";
    }
    else{
      _mode ="Light Mode";
    }
    notifyListeners();

  }


  void Noti(bool value){
    _isnotiOn = value;
    if(value){
      _noti = "Notification ON";
    }
    else{
      _noti ="Notification OFF";
    }
    notifyListeners();

  }

  void Backu(bool value){
    _isbackupOn = value;
    if(value){
      _backup = "Backup & Restore ON";
    }
    else{
      _backup ="Backup & Restore OFF";
    }
    notifyListeners();

  }



}
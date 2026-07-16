import 'dart:ffi';

import 'package:flutter/material.dart';


class sidebardata with ChangeNotifier{

  String _mode = "Light Mode";
  String _noti = "Notification off";
  String _backup = "Backup & Restore off";

  bool _isdark = false;
  bool _isnotiOn = false;
  bool _isbackupOn = false;

  IconData _thememode = Icons.dark_mode_outlined;
  IconData _notiIco = Icons.notifications_off_outlined;
  IconData _backypIco = Icons.backup_outlined;

  IconData get thememode => _thememode;
  IconData get notiIco => _notiIco;
  IconData get backupIco => _backypIco;

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
      _thememode = Icons.dark_mode;
    }
    else{
      _mode ="Light Mode";
      _thememode = Icons.dark_mode_outlined;
    }
    notifyListeners();

  }


  void Noti(bool value){
    _isnotiOn = value;
    if(value){
      _noti = "Notification ON";
      _notiIco = Icons.notifications_none;
    }
    else{
      _noti ="Notification OFF";
      _notiIco = Icons.notifications_off_outlined;
    }
    notifyListeners();

  }

  void Backu(bool value){
    _isbackupOn = value;
    if(value){
      _backup = "Backup & Restore ON";
      _backypIco = Icons.backup;
    }
    else{
      _backup ="Backup & Restore OFF";
      _backypIco = Icons.backup_outlined;
    }
    notifyListeners();

  }



}
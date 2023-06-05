import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar{
   setStatusBarDark(){
     SystemChrome.setSystemUIOverlayStyle(
         const SystemUiOverlayStyle(
           statusBarColor: Colors.transparent,
           statusBarIconBrightness: Brightness.dark,
         )
     );
   }
   setStatusBarLight(){
     SystemChrome.setSystemUIOverlayStyle(
         const SystemUiOverlayStyle(
           statusBarColor: Colors.transparent,
           statusBarIconBrightness: Brightness.light,
         )
     );
   }
}
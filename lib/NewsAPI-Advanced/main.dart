import 'package:flutter/material.dart';

import 'Pages/home.dart';


void main(){
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.white
    ),

    home: const HomeNews(),
  ));
}





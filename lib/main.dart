import 'package:flutter/material.dart';
import 'ui/welcome_ui.dart';
void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Scaffold Test",
    home: new BMI(),
  ));
}
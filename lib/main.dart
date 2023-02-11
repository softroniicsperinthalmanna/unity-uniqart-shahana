import 'package:flutter/material.dart';
import 'package:uniqart/Screens/artList.dart';
import 'package:uniqart/Screens/bagList.dart';
import 'package:uniqart/Screens/clothes.dart';
import 'package:uniqart/Screens/donatedescp1.dart';
import 'package:uniqart/Screens/foodList.dart';
import 'package:uniqart/Screens/login.dart';
import 'package:uniqart/Screens/plantList.dart';

import 'Screens/donate.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bagList(),
    );

  }
}

import 'package:flutter/material.dart';
import 'package:uniqart2app/screens/Fashion/fashionDetailPage.dart';
import 'package:uniqart2app/screens/Purchase/purchaseHome.dart';
import 'package:uniqart2app/screens/home.dart';

import 'fashion.dart';
import 'screens/Art/demoDetailpage.dart';
void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home (),
    );
  }
}

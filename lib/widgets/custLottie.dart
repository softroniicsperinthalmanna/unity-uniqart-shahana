import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget lottieNothing(){
  return Center(
child: Container(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Lottie.asset(
'assets/lottie1.json',
height: 150,
width: 150,
),
Text('Nothing to show')
],
),
),
);
}
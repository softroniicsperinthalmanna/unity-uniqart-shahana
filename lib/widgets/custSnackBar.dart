import 'dart:ui';

import 'package:flutter/material.dart';

SnackBar snackMsg(String msg){
  return SnackBar(content: Text(msg,
    style: TextStyle(fontSize: 20,color: Colors.white),),
    backgroundColor:  Color(
        0xfa8f7805),);
}
SnackBar errorSnackMsg(String msg){
  return SnackBar(content: Text(msg,
    style: TextStyle(fontSize: 20,color: Colors.white),),
    backgroundColor:  Color(
        0xfacb1f08),);
}
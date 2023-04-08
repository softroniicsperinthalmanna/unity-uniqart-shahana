

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/myPurchase/cart/cart.dart';

var heading1=GoogleFonts.alike(fontSize: 25,fontWeight: FontWeight.bold);
var descStyle=GoogleFonts.alike(fontSize: 20 );
var catStyle=GoogleFonts.russoOne(fontSize: 15 );
var dashStyle=GoogleFonts.russoOne(fontSize: 28,color: Colors.blue ,fontWeight: FontWeight.bold);
var color=Color(0xffAF5DA2);
var subHead=GoogleFonts.alike(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white);
var authHead=GoogleFonts.russoOne(color: Colors.amber,fontSize: 35);
OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
  return OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color:Colors.redAccent,
        width: 3,
      )
  );
}

OutlineInputBorder myfocusborder(){
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color:Colors.greenAccent,
        width: 3,
      )
  );
}
InputDecoration dec(String labelname){
  return  InputDecoration(
    labelText: labelname,
    // border: myinputborder(), //normal border
    // enabledBorder: myinputborder(), //enabled border
    // focusedBorder: myfocusborder(), //focused border
    // set more border style like disabledBorder
  );
}
var authBtn=GoogleFonts.russoOne(color: Colors.amber,fontSize: 25);
var tealauthBtn=GoogleFonts.russoOne(color: Colors.teal,fontSize: 20);
var tealNormalauthBtn=GoogleFonts.russoOne(color: Colors.teal,fontSize: 15);
var redauthBtn=GoogleFonts.russoOne(color: Colors.red,fontSize: 15);
var errortext=GoogleFonts.russoOne(color: Colors.amber,fontSize: 25);
var snackText=TextStyle(fontSize: 20,color: Colors.white);

var tealBlue=Color(0xff458F9D);
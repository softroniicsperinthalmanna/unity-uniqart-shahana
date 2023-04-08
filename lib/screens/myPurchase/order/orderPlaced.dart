import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../connection/connect.dart';
import '../../../styles/style.dart';
class OrderPlaced extends StatefulWidget {


  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff458F9D),

       // leading: Icon(Icons.menu),
        //title: Text('CALLIGRAPHY'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){},  icon: Icon(Icons.home)),
          )
        ],

      ),
      body:          Container(
        height: double.infinity,
        width: double.infinity,


           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/images/order/tick2.gif'),
               fit: BoxFit.fill
             )
           ),
           // child: Center(child: Text('Order Placed Successfully\n\n Continue Shopping\n\n ThankYou...',style:heading1))
            child: Center(child: Text('Request Sent',style:subHead))

      )
    );
  }
}

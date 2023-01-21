import 'package:clgapp/Screens/Needy/alertNeedy.dart';
import 'package:clgapp/Screens/Needy/alertNeedy2.dart';
import 'package:clgapp/Screens/Needy/bookNeedy.dart';
import 'package:clgapp/Screens/Needy/uniformNeedy.dart';
import 'package:clgapp/Screens/rentalPurchase/pitempage.dart';
import 'package:clgapp/Screens/rentalSale/DressList.dart';
import 'package:clgapp/Screens/rentalSale/description.dart';
import 'package:clgapp/Screens/rentalSale/jewelleryList.dart';
import 'package:clgapp/Screens/rentalSale/rentalCategory.dart';
import 'package:clgapp/models/DressListModel.dart';
import 'package:clgapp/models/pitempageModel.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  PurchaseItem() ,
    );
  }
}

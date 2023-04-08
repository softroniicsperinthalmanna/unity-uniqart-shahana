import 'package:flutter/material.dart';
import 'package:uniqartapp/screens/auth/login.dart';
import 'package:uniqartapp/screens/myPurchase/purchaseHome.dart';
import 'package:uniqartapp/screens/mySale/Dashboard/categories.dart';
import 'package:uniqartapp/screens/mySale/saleCatelog.dart';
import 'package:uniqartapp/screens/mySale/sellerHome.dart';
import 'package:uniqartapp/screens/needy/needyBook.dart';
import 'package:uniqartapp/screens/needy/needyUniform.dart';
import 'package:uniqartapp/screens/toLease/Dashboard/rentalCatelogsHome.dart';
import 'package:uniqartapp/screens/toLease/rentalsaleCatelog.dart';
import 'package:uniqartapp/screens/toLease/Dashboard/products/add/toLeaseIndividualCategory.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SignIn(),
    );
  }
}
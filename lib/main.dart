import 'package:flutter/material.dart';
import 'package:uniqart_app/screens/auth/login.dart';
import 'package:uniqart_app/screens/auth/register.dart';
import 'package:uniqart_app/screens/donor/addUniform.dart';
import 'package:uniqart_app/screens/donor/donateCategory.dart';
import 'package:uniqart_app/screens/myPurchase/art/artCatelog.dart';
import 'package:uniqart_app/screens/myPurchase/art/artDetailPage.dart';
import 'package:uniqart_app/screens/myPurchase/art/artSingleCategoryPage.dart';
import 'package:uniqart_app/screens/myPurchase/cart/cart.dart';
import 'package:uniqart_app/screens/myPurchase/order/orderPlaced.dart';
import 'package:uniqart_app/screens/myPurchase/purchaseCatelog.dart';
import 'package:uniqart_app/screens/myPurchase/purchaseHome.dart';
import 'package:uniqart_app/screens/mySale/Dashboard/myCategories.dart';
import 'package:uniqart_app/screens/mySale/Dashboard/users.dart';
import 'package:uniqart_app/screens/mySale/fashion/fashionCatelog.dart';
import 'package:uniqart_app/screens/mySale/saleCatelog.dart';
import 'package:uniqart_app/screens/mySale/sellerHome.dart';
import 'package:uniqart_app/screens/needy/needyCatelog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SignIn(),
    );
  }
}

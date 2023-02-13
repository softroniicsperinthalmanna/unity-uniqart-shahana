import 'package:flutter/material.dart';
// import 'package:uniqart_test/demoScreens/Demo_s_grid.dart';
import 'package:uniqart_app/models/catelogModel.dart';
import 'package:uniqart_app/screens/myPurchase/art/artCatelog.dart';
import 'package:uniqart_app/screens/myPurchase/book/bookCatelog.dart';
import 'package:uniqart_app/screens/myPurchase/purchaseCatelog.dart';
import 'package:uniqart_app/screens/mySale/art/artSaleCatelog.dart';
import 'package:uniqart_app/screens/mySale/book/bookSaleCatelog.dart';
import 'package:uniqart_app/screens/mySale/saleCatelog.dart';
import 'package:uniqart_app/styles/style.dart';

class MyAppServices extends StatefulWidget {
  const MyAppServices({Key? key}) : super(key: key);

  @override
  State<MyAppServices> createState() => _MyAppServicesState();
}

class _MyAppServicesState extends State<MyAppServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black,

                Colors.blue.shade200,
                Colors.red.shade200,



                Colors.blue,
                Colors.white70,
              ],
            )
        ),
        child: Center(
          child: Container(

           // height: 660,
            child: GridView(

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1
                ),
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SaleCatelog()));

                    },
                    child: Card(
                      elevation:30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200),
                        //set border radius more than 50% of height and width to make circle
                      ),
                      shadowColor: Colors.blue,
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.5,

                        width: 150,

                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/sale.png"),fit: BoxFit.fill
                          )
                        ),

                        child: Center(child: Text('SALE',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),

                      ),

                    ),
                  ),
                  InkWell(
                    onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>PurchaseCatelog()));

                    },
                    child: Card(
                      elevation:30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200),
                        //set border radius more than 50% of height and width to make circle
                      ),
                      shadowColor: Colors.blue,
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.5,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/purchase.png"),fit: BoxFit.fill
                            )
                        ),

                        child: Center(child: Text('PURCHASE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),

                      ),

                    ),
                  ),

                ],

                ),
          ),
        ),
      ),
    );
  }
}

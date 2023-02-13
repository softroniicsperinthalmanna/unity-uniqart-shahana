import 'package:flutter/material.dart';
// import 'package:uniqart_app/demoScreens/Demo_s_grid.dart';
import 'package:uniqart_app/models/catelogModel.dart';
import 'package:uniqart_app/screens/myPurchase/art/artCatelog.dart';
import 'package:uniqart_app/screens/myPurchase/book/bookCatelog.dart';
import 'package:uniqart_app/screens/myPurchase/fashion/bag/bagSinglePage.dart';
import 'package:uniqart_app/screens/myPurchase/fashion/cloth/clothCatelog.dart';
import 'package:uniqart_app/screens/myPurchase/plants/plantCatelog.dart';
import 'package:uniqart_app/styles/style.dart';

import 'fashion/fashionCatelog.dart';
class PurchaseCatelog extends StatefulWidget {
   PurchaseCatelog({Key? key,this.logID}) : super(key: key);
var logID;
  @override
  State<PurchaseCatelog> createState() => _PurchaseCatelogState();
}


class _PurchaseCatelogState extends State<PurchaseCatelog> {
var ID;


  @override
  void initState(){
    super.initState();
    ID=widget.logID;
    print("My ID : "+ID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     Colors.black,
            //
            //     Colors.blue.shade200,
            //     Colors.red.shade200,
            //
            //
            //
            //     Colors.blue,
            //     Colors.white70,
            //   ],
            // )
        ),

        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Center(child: Text('Categories',style:authHead)),
              SizedBox(height: 40,),

                     Container(
                       height: 660,
                       child: GridView.builder(
                         itemCount: catelogModel.length,
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2
                           ),
                           itemBuilder: (context,index){
                             return InkWell(
                               onTap: (){

                                 switch(index){
                                   case 0:Navigator.push(context, MaterialPageRoute(builder: (context)=>ClothCatelog(
                                          logID: ID,
                                   )));break;
                                   case 1:Navigator.push(context, MaterialPageRoute(builder: (context)=>BagSinglePage()));break;
                                   case 2:Navigator.push(context, MaterialPageRoute(builder: (context)=>BookCatelog()));break;
                                   case 3:Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtCatelog()));break;
                                case 4:Navigator.push(context, MaterialPageRoute(builder: (context)=>PlantPurchaseCatelog()));break;
              //                       default:Navigator.push(context, MaterialPageRoute(builder: (context)=>OtherCatelog()));break;
                                 }
                               },
                               child: Container(
                                 height: 300,
                                 width: 300,


                                 child: Column(
                                   children: [
                                     ClipOval(

                                       child: Container(
                                         height: 100,
                                         width: 100,
                                         decoration: BoxDecoration(
                                             image: DecorationImage(
                                                 image: AssetImage("assets/images/catelog/"+catelogModel[index]['image']),fit: BoxFit.fill
                                             )
                                         ),
                                       ),
                                     ),


                                     Center(child: Text(catelogModel[index]['name'].toUpperCase(),style: catStyle,)),
                                   ],
                                 ),

                               ),
                             );
                           }),
                     ),


            ],
          ),
        )

      ),
    );
  }
}

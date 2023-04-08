import 'package:flutter/material.dart';
// import 'package:uniqart_test/demoScreens/Demo_s_grid.dart';
import 'package:uniqartapp/models/catelogModel.dart';
import 'package:uniqartapp/screens/myPurchase/art/artCatelog.dart';
import 'package:uniqartapp/screens/myPurchase/book/bookCatelog.dart';
import 'package:uniqartapp/screens/mySale/art/artSaleCatelog.dart';
import 'package:uniqartapp/screens/mySale/book/bookSaleCatelog.dart';
import 'package:uniqartapp/screens/mySale/fashion/bag/addBagDetail.dart';
import 'package:uniqartapp/screens/mySale/fashion/cloth/clothSaleCatelog.dart';
import 'package:uniqartapp/screens/mySale/plant/plantSaleCatelog.dart';
import 'package:uniqartapp/styles/style.dart';

import 'fashion/fashionCatelog.dart';
class SaleCatelog extends StatefulWidget {
   SaleCatelog({Key? key,required this.vid}) : super(key: key);
var vid;
  @override
  State<SaleCatelog> createState() => _SaleCatelogState();
}

class _SaleCatelogState extends State<SaleCatelog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //
            //     Colors.blueAccent,
            //     Colors.white60,
            //     Colors.amber,
            //     Colors.pinkAccent,
            //     Colors.white38,
            //     Colors.blueAccent,
            //   ],
            // )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Center(child: Text('Categories',style: authHead,)),
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
                            case 0:Navigator.push(context, MaterialPageRoute(builder: (context)=>ClothSaleCatelog(
                              vid: widget.vid,
                            )));break;
                            case 1:Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBagDetails(
                              vid: widget.vid,
                            )));break;
                            case 2:Navigator.push(context, MaterialPageRoute(builder: (context)=>BookSaleCatelog(
                              vid: widget.vid,
                            )));break;
                            case 3:Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtSaleCatelog(
                              vid: widget.vid,
                            )));break;
                      case 4:Navigator.push(context, MaterialPageRoute(builder: (context)=>PlantSaleCatelog(
                        vid: widget.vid,
                      )));break;
                           //  default:Navigator.push(context, MaterialPageRoute(builder: (context)=>OtherCatelog()));break;
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
        ),
      ),
    );
  }
}

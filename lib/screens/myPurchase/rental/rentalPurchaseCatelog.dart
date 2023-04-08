import 'package:flutter/material.dart';
import 'package:uniqartapp/screens/myPurchase/rental/dress/dressCatelog.dart';

import '../../../models/rentalCategory.dart';
import 'jewellery/jewelleryCatelog.dart';
class RentalPurchaseHome extends StatefulWidget {
   RentalPurchaseHome({Key? key,required this.logID}) : super(key: key);
var logID;

  @override
  State<RentalPurchaseHome> createState() => _RentalPurchaseHomeState();
}

class _RentalPurchaseHomeState extends State<RentalPurchaseHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff456F64),
        title: Text("UNIQART"),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,

        child: ListView.builder(
            itemCount: rentalCategory.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  if(index==0){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>JewelleryCatelog(
                      logID:widget.logID
                    )));

                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DressCatelog(logID: widget.logID,
                    )));
                    }



                },
                child: Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(

                      image: AssetImage(
                        "assets/images/rent/" +rentalCategory [index]['img'],),
                      fit: BoxFit.cover,),

                  ),



                  //child: Align(
                  //alignment: Alignment.bottomCenter,
                  //child: Container(
                  // height: 50,
                  //width: 350,

                  child:
                  Center(
                    child: Text(rentalCategory[index]['name'],
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,fontSize: 30),),),

                ),
              );
            }
        ),
      ),
    );




  }
}



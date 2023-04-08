import 'package:flutter/material.dart';
import 'package:uniqartapp/models/dressModel.dart';
import 'package:uniqartapp/models/jewelleryModel.dart';
import 'package:uniqartapp/screens/myPurchase/fashion/bag/bagSinglePage.dart';
import 'package:uniqartapp/screens/myPurchase/rental/dress/dressSinglePage.dart';
import 'package:uniqartapp/screens/myPurchase/rental/jewellery/jewellerySinglePage.dart';

import '../../../../models/artmodel.dart';
import '../../../../models/clothesmodel.dart';
class JewelleryCatelog extends StatefulWidget {
  JewelleryCatelog({Key? key,required this.logID}) : super(key: key);
 var logID;

  @override
  State<JewelleryCatelog> createState() => _JewelleryCatelogState();
}

class _JewelleryCatelogState extends State<JewelleryCatelog> {
 // var ID;

  @override
  Widget build(BuildContext context) {
    // ID=widget.logID;
    // print("My ID in cloth category : "+ID);
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff458F9D),

        leading: Icon(Icons.menu),
        title: Text('UNIQART'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){},  icon: Icon(Icons.home)),
          )
        ],

      ),

      body: CustomScrollView(
        // floatHeaderSlivers: true,
          slivers:<Widget>    [
            SliverList(

              delegate: SliverChildBuilderDelegate(
                childCount:jewelleryModel.length,
                    (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>JewellerySinglePage(
                          indexNo: index,logID: widget.logID,
                       //   logID: ID,
                        )));
                      },
                      child: Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(

                            image: AssetImage(
                              "assets/images/rent/"+ jewelleryModel[index]['img'],),
                            fit: BoxFit.fitWidth,
                            // opacity: 0.4
                          ),

                        ),
                        child:
                        Center(
                          child: Text(
                            jewelleryModel[index]['name'],
                            style: TextStyle(color:Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 30),),),

                      ),
                    ),
                  );
                },
              ),
            ),

            // ListView.builder(
            //   padding: const EdgeInsets.all(8),
            //   itemCount: 30,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Container(
            //       height: 50,
            //       child: Center(child: Text('Item $index')),
            //     );
            //   },
            // ),
          ]
      ),

    );
  }
}

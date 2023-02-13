import 'package:flutter/material.dart';
import 'package:uniqart_app/models/bookModel.dart';
import 'package:uniqart_app/screens/myPurchase/art/artSingleCategoryPage.dart';
import 'package:uniqart_app/screens/myPurchase/fashion/bag/bagSinglePage.dart';
import 'package:uniqart_app/screens/myPurchase/plants/plantSinglePage.dart';
import 'package:uniqart_app/screens/mySale/art/addArt.dart';
import 'package:uniqart_app/screens/mySale/book/addBookDetails.dart';
import 'package:uniqart_app/screens/mySale/fashion/bag/addBagDetail.dart';

import '../../../models/artmodel.dart';
import '../../../models/plantmodel.dart';
class PlantPurchaseCatelog extends StatefulWidget {
  const PlantPurchaseCatelog({Key? key}) : super(key: key);

  @override
  State<PlantPurchaseCatelog> createState() => _PlantPurchaseCatelogState();
}

class _PlantPurchaseCatelogState extends State<PlantPurchaseCatelog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff458F9D),

        leading: Icon(Icons.menu),
        title: Text('UN!QART'),
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
            SliverAppBar(
              backgroundColor:Color(0xff458F9D) ,
              flexibleSpace: FlexibleSpaceBar(

                background: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    // color: Color(0xff458F9D),
                    image: DecorationImage(
                      image: AssetImage("assets/images/plants/plantslogo.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child:                        Center(
                    child: Opacity(

                      opacity: 0.7,
                      child: Container(
                        height: 100,
                        width: 350,
                        color: Color(0xff012d01),
                        child: Center(
                          child: Text(
                            'PLANTS',

                            style: TextStyle(color:Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 30),),
                        ),
                      ),
                    ),),

                ),
              ),
              // title: const Text('Title'),
              floating: true,
              //  pinned: true,
              expandedHeight: 250.0,

              // bottom: AppBar(
              //   backgroundColor: Colors.red,
              //   toolbarHeight: 64.0,
              // ),
            ),
            SliverList(

              delegate: SliverChildBuilderDelegate(
                childCount:plantmodel.length,
                    (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12),
                    child: InkWell(
                      onTap: (){
                        print(index);
                        print("catelog pressed:index $index");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PlantSingleCategoryPage(
                          indexNo: index,
                        )));
                      },
                      child: Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(

                            image: AssetImage(
                              "assets/images/plants/"+ plantmodel[index]['image'],),
                            fit: BoxFit.fitWidth,
                            // opacity: 0.4
                          ),

                        ),
                        child:

                        Center(
                          child: Opacity(

                            opacity: 0.5,
                            child: Container(
                              height: 50,
                              width: 250,
                              color:Color(0xff034d03),
                              child: Center(
                                child: Text(
                                     plantmodel[index]['name'],

                                  style: TextStyle(color:Colors.white,
                                      fontWeight: FontWeight.bold,fontSize: 30),),
                              ),
                            ),
                          ),),



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

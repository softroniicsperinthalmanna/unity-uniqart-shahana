import 'package:flutter/material.dart';
import 'package:uniqart_app/models/bookModel.dart';
import 'package:uniqart_app/screens/myPurchase/art/artSingleCategoryPage.dart';
import 'package:uniqart_app/screens/mySale/art/addArt.dart';
import 'package:uniqart_app/screens/mySale/book/addBookDetails.dart';
import 'package:uniqart_app/screens/mySale/fashion/bag/addBagDetail.dart';

import '../../../models/artmodel.dart';
import 'cloth/clothSaleCatelog.dart';
class FashionSaleCatelog extends StatefulWidget {
  const FashionSaleCatelog({Key? key}) : super(key: key);

  @override
  State<FashionSaleCatelog> createState() => _FashionSaleCatelogState();
}

class _FashionSaleCatelogState extends State<FashionSaleCatelog> {
  @override
  Widget build(BuildContext context) {
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
            SliverAppBar(
              backgroundColor:Color(0xff458F9D) ,
              flexibleSpace: FlexibleSpaceBar(

                background: Container(
                  height: 200,
                  decoration:const BoxDecoration(
                    // color: Color(0xff458F9D),
                    image: DecorationImage(
                      image: AssetImage("assets/images/fashion.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  // child: Container(
                  //   padding:const EdgeInsets.all(16.0),
                  //   alignment: Alignment.centerLeft,
                  //   child:const Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Text(
                  //       'BOOKS',
                  //       style: TextStyle(color: Colors.white, fontSize: 36.0),
                  //     ),
                  //   ),
                  // ),
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
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12),
                    child: InkWell(
                      onTap: (){



                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ClothSaleCatelog(

                        )));
                      },
                      child: Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(

                            image: AssetImage(
                              "assets/images/clothes/clothes.jpg"),
                            fit: BoxFit.fitWidth,
                            // opacity: 0.4
                          ),

                        ),
                        child:

                        Center(
                          child: Opacity(

                            opacity: 0.7,
                            child: Container(
                              height: 50,
                              width: 350,
                              color: Color(0xffa0a7ad),
                              child: Center(
                                child: Text(
                                 'CLOTHING',
                                  style: TextStyle(color:Colors.black,
                                      fontWeight: FontWeight.bold,fontSize: 30),),
                              ),
                            ),
                          ),),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12),
                    child: InkWell(
                      onTap: (){



                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBagDetails(

                        )));
                      },
                      child: Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(

                            image: AssetImage(
                              "assets/images/bagggs/bag.jpg"),
                            fit: BoxFit.fitWidth,
                            // opacity: 0.4
                          ),

                        ),
                        child:

                        Center(
                          child: Opacity(

                            opacity: 0.7,
                            child: Container(
                              height: 50,
                              width: 350,
                              color: Color(0xffa0a7ad),
                              child: Center(
                                child: Text(
                                 'BAGGY',
                                  style: TextStyle(color:Colors.black,
                                      fontWeight: FontWeight.bold,fontSize: 30),),
                              ),
                            ),
                          ),),

                      ),
                    ),
                  )
                ],

              ),
            ),
            // SliverList(
            //
            //   delegate: SliverChildBuilderDelegate(
            //     childCount:bookModel.length,
            //         (BuildContext context, int index) {
            //       return Padding(
            //         padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12),
            //         child: InkWell(
            //           onTap: (){
            //             print(index);
            //             print('pressed book category');
            //
            //             Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBookDetails(
            //               indexNo: index,
            //             )));
            //           },
            //           child: Container(
            //             height: 170,
            //             width: MediaQuery.of(context).size.width,
            //             decoration: BoxDecoration(
            //               image: DecorationImage(
            //
            //                 image: AssetImage(
            //                   "assets/images/clothes/"+ bookModel[index]['image'],),
            //                 fit: BoxFit.fitWidth,
            //                 // opacity: 0.4
            //               ),
            //
            //             ),
            //             child:
            //
            //             Center(
            //               child: Opacity(
            //
            //                 opacity: 0.7,
            //                 child: Container(
            //                   height: 50,
            //                   width: 350,
            //                   color: Color(0xffa0a7ad),
            //                   child: Center(
            //                     child: Text(
            //                       bookModel[index]['name'],
            //                       style: TextStyle(color:Colors.black,
            //                           fontWeight: FontWeight.bold,fontSize: 30),),
            //                   ),
            //                 ),
            //               ),),
            //
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),

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
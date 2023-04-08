import 'package:flutter/material.dart';
import 'package:uniqartapp/connection/connect.dart';
import 'package:uniqartapp/models/bookModel.dart';
import 'package:uniqartapp/screens/myPurchase/art/artSingleCategoryPage.dart';
import 'package:uniqartapp/screens/mySale/art/addArt.dart';
import 'package:uniqartapp/screens/mySale/book/addBookDetails.dart';
import 'package:uniqartapp/screens/mySale/fashion/bag/addBagDetail.dart';
import 'package:uniqartapp/styles/style.dart';

import '../../../models/artmodel.dart';
import '../../models/donateModel.dart';
import 'addDonateBook.dart';
import 'addDonateUniform.dart';
class DonateCatelog extends StatefulWidget {
   DonateCatelog({Key? key,required this.did}) : super(key: key);
var did;
  @override
  State<DonateCatelog> createState() => _DonateCatelogState();
}

class _DonateCatelogState extends State<DonateCatelog> {
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
                        image: AssetImage("assets/images/donate/donateLogo.jpg"),
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
              SliverList(

                delegate: SliverChildBuilderDelegate(
                  childCount:donateModel.length,
                      (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12),
                      child: InkWell(
                        onTap: (){
                          print(index);
                          print('pressed book category');
                          if(index==0) {
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) =>
                                AddDonateUniformDetails(
                                  did: widget.did,
                               //   indexNo: index,
                                )));
                          }
                          else{
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) =>
                                AddDonateBookDetails(
                                  indexNo: index, did: widget.did,
                                )));

                          }

                        },
                        child: Container(
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(

                              image: AssetImage(
                                "assets/images/donate/"+ donateModel[index]['image'],),
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
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    donateModel[index]['name'],
                                    style: TextStyle(color:tealBlue,
                                        fontWeight: FontWeight.bold,fontSize: 20),),
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

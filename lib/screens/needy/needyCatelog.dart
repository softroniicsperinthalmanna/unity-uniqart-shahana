import 'package:flutter/material.dart';
import 'package:uniqartapp/connection/connect.dart';
import 'package:uniqartapp/models/bookModel.dart';
import 'package:uniqartapp/screens/auth/needyLogin.dart';
import 'package:uniqartapp/screens/myPurchase/art/artSingleCategoryPage.dart';
import 'package:uniqartapp/screens/mySale/art/addArt.dart';
import 'package:uniqartapp/screens/mySale/book/addBookDetails.dart';
import 'package:uniqartapp/screens/mySale/fashion/bag/addBagDetail.dart';
import 'package:uniqartapp/screens/needy/needyNotification.dart';
import 'package:uniqartapp/styles/style.dart';

import '../../../models/artmodel.dart';
import '../../models/donateModel.dart';
import 'needyBook.dart';
import 'needyUniform.dart';
class NeedyCatelog extends StatefulWidget {
   NeedyCatelog({Key? key,required this.nid}) : super(key: key);
var nid;
  @override
  State<NeedyCatelog> createState() => _NeedyCatelogState();
}

class _NeedyCatelogState extends State<NeedyCatelog> {
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
            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NeedyNotificaions(nid: widget.nid)));
            },  icon: Icon(Icons.notifications)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: Text('Un!Qart Needy LogOut'),
                  content: Text('Do you want to logout ?'),
                  actions: [
                    TextButton(onPressed:(){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>NeedyLogin()));

                    }, child: Text('LogOut')),
                    TextButton(onPressed:(){
                      Navigator.pop(context);
                    }, child: Text('Cancel')),
                  ],
                );
              });



            },  icon: Icon(Icons.logout)),
          ),
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
                      image: AssetImage("assets/images/needy.png"),
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

                        if(index==0){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DonatedUniform(
                            nid: widget.nid,
                          )));

                        }else
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DonatedBook(
                            nid: widget.nid,
                        )));
                        // if (index==0){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Calligraphy()));
                        // }
                        // if (index==1){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Paintings()));
                        // }
                        // if (index==2){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Gift()));
                        // }
                        // if (index==3){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SaveTheDate()));
                        // }
                        // if (index==4){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Mehandi()));
                        // }
                        // if (index==5){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Calligraphy()));
                        // }
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

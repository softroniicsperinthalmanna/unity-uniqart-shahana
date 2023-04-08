import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uniqartapp/screens/myPurchase/art/artDetailPage.dart';

import '../../../connection/connect.dart';
import '../../../widgets/custLottie.dart';
import 'bookDetailPage.dart';
class BookSinglePage extends StatefulWidget {
   BookSinglePage({Key? key,required this.indexNo,required this.logID}) : super(key: key);
var indexNo;
var logID;

  @override
  State<BookSinglePage> createState() => _BookSinglePageState();
}

class _BookSinglePageState extends State<BookSinglePage> {
  var category;
  var flag=0;
  Future viewBook() async {
    switch(widget.indexNo){
      case 0: category='academic';break;

      default: category='Other';break;
    }
    var data={

      'category':category
    };
   // var url = "http://192.168.180.139/uniqart_app/viewArt.php";
    var response = await http.post(Uri.parse("${Con.url}viewBook.php"),body: data);
    print(response.body);
    json.decode(response.body)[0]['result'] == 'success'
        ? flag = 1
        : flag = 0;
    print(flag);

    return json.decode(response.body);


  }
@override
 void initState(){
    super.initState();
    viewBook();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff458F9D),

        // leading: Icon(Icons.menu),
        title: Text(category.toUpperCase()),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){},  icon: Icon(Icons.home)),
          )
        ],

      ),
      body:             FutureBuilder(
          future: viewBook(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if (snapshot.hasError) print('Error ::${snapshot.error}');
            print('Inside builder ::${snapshot.hasData}');
            if (!snapshot.hasData) {
              return const Center(
                child: Center(child: Text('No Data')),
              );
            }            return flag==0?lottieNothing():GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 0.6,
              ),
              itemBuilder:(BuildContext context,int index) {

                  List list = snapshot.data;
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetailPage(
                        name: list[index]['name'],
                        rate: list[index]['rate'],
                        description: list[index]['des'],
                        stock:list[index]['stock'],
                        image:list[index]['image'],
                        author:list[index]['author'],
                        year:list[index]['publishYear'],
                        tagID:index,
                        logID: widget.logID,
                        pid: list[index]['pid'],
                        vid: list[index]['vendor_id'],
                      )));
                    },
                    child: Hero(
                      tag: index,
                      child: Card(
                        // generate blues with random shades
                          color: Colors.amber[Random().nextInt(4) * 100],
                          child: Padding(
                            padding: const EdgeInsets.all( 12),
                            child: Container(
                              height: 250,
                              child: Column(
                                children: [
                                  Container(
                                    height: 240,
                                    width: MediaQuery.of(context).size.width,
                                    child: Image.network(
                                        "${Con.url}bookUploads/${list[index]['image']}",fit: BoxFit.fill,),
                                    // child:
                                    // Center(
                                    //   child: Text(
                                    //     artCatelog[index]['name'],
                                    //     style: TextStyle(color:Colors.white,
                                    //         fontWeight: FontWeight.bold,fontSize: 30),),),

                                  ),
                                  Container(
                                    height: 50,
                                    color: Colors.white,
                                    child:Center(
                                      child: Text('Rs '+
                                        list[index]['rate'],
                                        style: TextStyle(color: Color(0xff458F9D),
                                            fontWeight: FontWeight.bold,fontSize: 18),),),

                                  ),

                                ],
                              ),
                            ),
                          )
                      ),
                    ),
                  );
                },
              itemCount:(snapshot.hasData && snapshot.data!.length > 0) ?snapshot.data.length:0,


              );
         //   :Center(child: CircularProgressIndicator());



          }

      ),


      // body: CustomScrollView(
      //   // floatHeaderSlivers: true,
      //     slivers:<Widget>    [
      //       SliverAppBar(
      //         backgroundColor:Color(0xff458F9D) ,
      //         flexibleSpace: FlexibleSpaceBar(
      //
      //           background: Container(
      //             height: 200,
      //             decoration: BoxDecoration(
      //               // color: Color(0xff458F9D),
      //               image: DecorationImage(
      //                 image: AssetImage("assets/images/art/calligraphy.png"),
      //                 fit: BoxFit.fill,
      //               ),
      //             ),
      //             // child: Container(
      //             //   padding: EdgeInsets.all(16.0),
      //             //   alignment: Alignment.centerLeft,
      //             //   child: Text(
      //             //     'Title',
      //             //     style: TextStyle(color: Colors.white, fontSize: 36.0),
      //             //   ),
      //             // ),
      //           ),
      //         ),
      //         // title: const Text('Title'),
      //         floating: true,
      //         //  pinned: true,
      //         expandedHeight: 180.0,
      //
      //         // bottom: AppBar(
      //         //   backgroundColor: Colors.red,
      //         //   toolbarHeight: 64.0,
      //         // ),
      //       ),
      //       FutureBuilder<dynamic>(
      //         future: viewCalligraphy(),
      //         builder: (BuildContext context,AsyncSnapshot snapshot){
      //           if (snapshot.hasError) print(snapshot.error);
      //           return snapshot.hasData?SliverGrid(
      //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               mainAxisSpacing: 4,
      //               crossAxisSpacing: 4,
      //               childAspectRatio: 0.6,
      //             ),
      //             delegate: SliverChildBuilderDelegate(
      //
      //                   (BuildContext context,int index) {
      //
      //                     List list = snapshot.data;
      //                 return Card(
      //                   // generate blues with random shades
      //                     color: Colors.amber[Random().nextInt(4) * 100],
      //                     child: Padding(
      //                       padding: const EdgeInsets.all( 12),
      //                       child: Container(
      //                         height: 250,
      //                         child: Column(
      //                           children: [
      //                             Container(
      //                               height: 240,
      //                               width: MediaQuery.of(context).size.width,
      //                               // child: Image.network(
      //                               //     "${Con.url}artUploads/${list[index]['image']}",fit: BoxFit.cover,),
      //                               // child:
      //                               // Center(
      //                               //   child: Text(
      //                               //     artCatelog[index]['name'],
      //                               //     style: TextStyle(color:Colors.white,
      //                               //         fontWeight: FontWeight.bold,fontSize: 30),),),
      //
      //                             ),
      //                             Container(
      //                               height: 50,
      //                               color: Colors.white,
      //                               child:Center(
      //                                 child: Text(
      //                                   'ID204',
      //                                   style: TextStyle(color: Color(0xff458F9D),
      //                                       fontWeight: FontWeight.bold,fontSize: 18),),),
      //
      //                             ),
      //
      //                           ],
      //                         ),
      //                       ),
      //                     )
      //                 );
      //               },
      //               childCount:snapshot.data.length,
      //
      //
      //             ),
      //           ):Center(child: CircularProgressIndicator());
      //
      //
      //
      //         }
      //
      //       ),
      //       // SliverList(
      //       //
      //       //   delegate: SliverChildBuilderDelegate(
      //       //     childCount:artCatelog.length,
      //       //         (BuildContext context, int index) {
      //       //       return Padding(
      //       //         padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12),
      //       //         child: Container(
      //       //           height: 170,
      //       //           width: MediaQuery.of(context).size.width,
      //       //           decoration: BoxDecoration(
      //       //             image: DecorationImage(
      //       //
      //       //               image: AssetImage(
      //       //                 "assets/images/art/"+ artCatelog[index]['image'],),
      //       //               fit: BoxFit.fitWidth,
      //       //               // opacity: 0.4
      //       //             ),
      //       //
      //       //           ),
      //       //           child:
      //       //           Center(
      //       //             child: Text(
      //       //               artCatelog[index]['name'],
      //       //               style: TextStyle(color:Colors.white,
      //       //                   fontWeight: FontWeight.bold,fontSize: 30),),),
      //       //
      //       //         ),
      //       //       );
      //       //     },
      //       //   ),
      //       // ),
      //
      //       // ListView.builder(
      //       //   padding: const EdgeInsets.all(8),
      //       //   itemCount: 30,
      //       //   itemBuilder: (BuildContext context, int index) {
      //       //     return Container(
      //       //       height: 50,
      //       //       child: Center(child: Text('Item $index')),
      //       //     );
      //       //   },
      //       // ),
      //     ]
      // ),

    );
  }
}

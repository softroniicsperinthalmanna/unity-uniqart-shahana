import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uniqartapp/screens/myPurchase/art/artDetailPage.dart';
import 'package:uniqartapp/screens/myPurchase/fashion/bag/bagDetailPage.dart';

import '../../../../connection/connect.dart';
import '../../../../widgets/custLottie.dart';
class BagSinglePage extends StatefulWidget {
   BagSinglePage({Key? key,required this.logID}) : super(key: key);
var logID;
  @override
  State<BagSinglePage> createState() => _BagSinglePageState();
}

class _BagSinglePageState extends State<BagSinglePage> {
var flag=0;
  Future<void> viewBag()  async {

   // var url = "http://192.168.180.139/uniqart_app/viewArt.php";
    var response = await http.get(Uri.parse("${Con.url}viewBag.php"));
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
    viewBag();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff458F9D),

        leading: Icon(Icons.menu),
        title: Text('BAGS'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){},  icon: Icon(Icons.home)),
          )
        ],

      ),
      body:             FutureBuilder(
          future: viewBag(),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BagDetailPage(

                        name: list[index]['name'],
                        rate: list[index]['rate'],
                        size: list[index]['size'],
                        material: list[index]['material'],
                        description: list[index]['des'],
                        stock:list[index]['stock'],
                        image:list[index]['image'],
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
                                        "${Con.url}bagUploads/${list[index]['image']}",fit: BoxFit.cover,),
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
           // :Center(child: CircularProgressIndicator());



          }

      ),



    );
  }
}

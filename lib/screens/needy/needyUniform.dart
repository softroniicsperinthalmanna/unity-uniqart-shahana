import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:uniqartapp/screens/needy/needyUniformDetailPage.dart';

import '../../connection/connect.dart';
import '../../widgets/custLottie.dart';
class DonatedUniform extends StatefulWidget {
   DonatedUniform({Key? key,required this.nid}) : super(key: key);
  var nid;
  @override
  State<DonatedUniform> createState() => _DonatedUniformState();
}

class _DonatedUniformState extends State<DonatedUniform> {
  var flag=0;

  Future<dynamic> getUniform()  async {
// var data={
//   'clothType':'coat'
// };

    // var url = "http://192.168.180.139/uniqart_app/viewArt.php";
    var response = await http.get(Uri.parse("${Con.url}viewDonateUniform.php"),);
    print(response.body);
    print(response.body);json.decode(response.body)[0]['result'] == 'success'
        ? flag = 1
        : flag = 0;
    print(flag);

    return json.decode(response.body);


  }

  @override
  Widget build(BuildContext context) {
    //var uniform;
    return Scaffold(
      // drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff456F64),
        title:const Text("UNIQART"),

        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){},  icon: Icon(Icons.home)),
          )
        ],
      ),
      body:   FutureBuilder(
          future: getUniform(),
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
                    print('productID:${list[index]['pid']}');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NeedyUniformDetailPage(

                        pid: list[index]['pid'],
                        size: list[index]['size'],
                        sub: list[index]['sub'],
                        description: list[index]['des'],
                        stock:list[index]['stock'],
                        image:list[index]['image'],
                      donorID:list[index]['donor_id'],
                        tagID:index,
                      nid: widget.nid,
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
                                   child: Image(image: NetworkImage("${Con.url}donateclothUploads/${list[index]['image']}",),fit: BoxFit.cover,),
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
                                    child: Text(
                                      list[index]['size'],
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


      // Container(
      //     height: double.infinity,
      //     width: double.infinity,
      //     child: FutureBuilder(
      //       future: getUniform(),
      //       builder: (context, snapshot) {
      //         if (snapshot.hasError) print(snapshot.error);
      //         print(snapshot.hasData);
      //         if (!snapshot.hasData) {
      //           return const Center(
      //             child: CircularProgressIndicator(),
      //           );
      //         }
      //
      //         if (snapshot.hasData && snapshot.data!.length == 0) {
      //           return const Center(
      //             child: Text('No Data Found'),
      //           );
      //         }
      //         return GridView.builder(
      //             itemCount: snapshot.data.length,
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 2,
      //                 crossAxisSpacing: 2,
      //                 mainAxisSpacing: 2
      //             ),
      //             itemBuilder: (context,index){
      //               List list = snapshot.data;
      //               return Stack(
      //                   children: [
      //
      //                     Container(
      //                       height: 250,
      //                       width: 350,
      //
      //                       child: Image(image: NetworkImage("${Con.url}donateclothUploads/${list[index]['image']}",),fit: BoxFit.cover,),
      //                     ),
      //                     Align(
      //                       alignment: Alignment.bottomCenter,
      //                       child: Container(
      //                         height: 50,
      //                         width: 350,
      //                         color: Color(0xff456F64),
      //                         child: Center(child: Text(list[index]['size'],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)),
      //
      //                       ),
      //                     )
      //                   ]
      //               );
      //             });
      //       }
      //     )
      // ),

    );
  }
}
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../../../../connection/connect.dart';
import '../../../../widgets/custLottie.dart';
import 'dressDetailPage.dart';
class DressSinglePage extends StatefulWidget {
  DressSinglePage({Key? key,required this.indexNo,required this.logID}) : super(key: key);
  var indexNo,logID;


  @override
  State<DressSinglePage> createState() => _DressSinglePageState();
}

class _DressSinglePageState extends State<DressSinglePage> {

var flag=0;
  var category1;



  Future viewClothes() async {
    switch(widget.indexNo){
      case 0: category1='Lehanga';
      break;
      case 1: category1='Ethnic Wear';
      break;
      case 2: category1='Pants';
      break;
      case 3: category1='Saree';
      break;
      case 4: category1='Gown';
      break;
      case 5: category1='Sharara';
      break;
      case 6: category1='Other';
      break;
    }
    var data={

      'category':category1,
    };
    // var url = "http://192.168.180.139/uniqart_app/viewArt.php";
    var response = await http.post(Uri.parse("${Con.url}viewDress.php"),body: data);
    print(response.body);
    if(response.statusCode==200){
      print('loading data');
      json.decode(response.body)[0]['result'] == 'success'
          ? flag = 1
          : flag = 0;
      print(flag);
    }
    else
      throw Exception('Failed to load..');
    return json.decode(response.body);


  }
  @override
  void initState(){
    super.initState();
    setState((){
      viewClothes();
    }

    );
   // ID=widget.logID;
  //  print("my id in single cloth page: "+ID);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff458F9D),

        // leading: Icon(Icons.menu),
        title: Text(category1),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){},  icon: Icon(Icons.home)),
          )
        ],

      ),
      body:             FutureBuilder(
          future: viewClothes(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if (snapshot.hasError) print('Error ::${snapshot.error}');
            print('Inside builder ::${snapshot.hasData}');
            if (!snapshot.hasData) {
              return const Center(
                child: Center(child: Text('No Data')),
              );
            }            return flag==0?lottieNothing():


            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 0.6,
              ),
              itemBuilder:(context,index) {

                List list = snapshot.data;
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DressDetailPage(
                      rent: list[index]['rent'],
                      name: list[index]['name'],
                      size: list[index]['size'],
                      material: list[index]['material'],
                      description: list[index]['desc'],
                      stock:list[index]['stock'],
                      image:list[index]['image'],
                      tagID:index,
                      logID: widget.logID,
                      pid:list[index]['pid'] ,
                      rid:list[index]['rid'] ,
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
                                  child:list[index]['image']==''?Center(child: Text('Image not found..')) :Image.network(
                                    "${Con.url}dressUploads/${list[index]['image']}",fit: BoxFit.cover,),
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
                                        list[index]['rent'],
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



          }

      ),



    );
  }
}

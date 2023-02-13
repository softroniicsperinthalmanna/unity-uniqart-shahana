import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uniqart_app/screens/myPurchase/plants/plantDetailPage.dart';

import '../../../connection/connect.dart';
class PlantSingleCategoryPage extends StatefulWidget {
  PlantSingleCategoryPage({Key? key,required this.indexNo}) : super(key: key);
  var indexNo;
  @override
  State<PlantSingleCategoryPage> createState() => _PlantSingleCategoryPageState();
}

class _PlantSingleCategoryPageState extends State<PlantSingleCategoryPage> {
  var category;
  //display data
  Future viewPlant() async {

    var data={

      'category':category
    };
    var response = await http.post(Uri.parse("${Con.url}viewPlant.php"),body: data);
    print(response.body);

    return json.decode(response.body);


  }
  @override
  void initState(){
    super.initState();
    print(widget.indexNo);

    switch(widget.indexNo){
      case 0: category='Indoor';break;
      case 1: category='Outdoor';break;
      case 2: category='Seed';break;
      case 3: category='Vegetation';break;
      default: category='Other';break;
    }
    print(category);
    viewPlant();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff458F9D),

        leading: Icon(Icons.menu),
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
          future: viewPlant(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData?GridView.builder(
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PlantDetailPage(
                        rate: list[index]['rate'],
                        description: list[index]['description'],
                        stock:list[index]['noOfStock'],
                        image:list[index]['image'],
                        size:list[index]['size'],
                        name:list[index]['name'],
                      tagID:index
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
                                    "${Con.url}plantUploads/${list[index]['image']}",fit: BoxFit.cover,),
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
              itemCount:snapshot.data.length,


            )
                :Center(child: CircularProgressIndicator());



          }

      ),



    );
  }
}

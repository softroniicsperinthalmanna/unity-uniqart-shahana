import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:uniqart_app/demoScreens/Demo_s_grid.dart';
import 'package:uniqartapp/models/catelogModel.dart';
import 'package:uniqartapp/screens/myPurchase/art/artCatelog.dart';
import 'package:uniqartapp/screens/myPurchase/book/bookCatelog.dart';
import 'package:uniqartapp/screens/myPurchase/fashion/bag/bagSinglePage.dart';
import 'package:uniqartapp/screens/myPurchase/fashion/cloth/clothCatelog.dart';
import 'package:uniqartapp/screens/myPurchase/plants/plantCatelog.dart';
import 'package:uniqartapp/styles/style.dart';

import '../../connection/connect.dart';
import 'fashion/fashionCatelog.dart';
class PurchaseCatelog extends StatefulWidget {
   PurchaseCatelog({Key? key,this.logID}) : super(key: key);
var logID;
  @override
  State<PurchaseCatelog> createState() => _PurchaseCatelogState();
}


class _PurchaseCatelogState extends State<PurchaseCatelog> {

 Future <void> sendSuggestion()async{
    var data={
      'sendDate':DateTime.now().toString(),
      'msg':suggest.text,
      'logID':widget.logID
    };
    var response=await post(Uri.parse('${Con.url}addSuggestion.php'),body: data);
    print(response.body);
   return jsonDecode(response.body);
  }

  var suggest=TextEditingController();
var ID;


  @override
  void initState(){
    super.initState();
    ID=widget.logID;
    print("My ID : "+ID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     Colors.black,
            //
            //     Colors.blue.shade200,
            //     Colors.red.shade200,
            //
            //
            //
            //     Colors.blue,
            //     Colors.white70,
            //   ],
            // )
        ),

        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Center(child: Text('Categories',style:authHead)),
              SizedBox(height: 40,),

                     Container(
                       height: 660,
                       child: GridView.builder(
                         itemCount: catelogModel.length,
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2
                           ),
                           itemBuilder: (context,index){
                             return InkWell(
                               onTap: (){
                                if(index==5){
                                  showDialog(
                                      context: context,
                                      builder: (context){
                                        return AlertDialog(
                                          icon: Icon(Icons.warning_outlined),
                                          title: Text('Drop your suggestions to add categories'),
                                          content: TextFormField(
                                                  controller: suggest,
                                            keyboardType: TextInputType.text,

                                          ),
                                          actions: [
                                            OutlinedButton(onPressed: (){
                                              setState(() {
                                                if(suggest.text!=''){
                                                  sendSuggestion();
                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                    content: Text(
                                                      'You entered : ${suggest.text}',
                                                      style: TextStyle(fontSize: 20, color: Colors.red),
                                                    ),
                                                    backgroundColor: Color(0xfa8f7805),
                                                  ));
                                                  Navigator.pop(context);

                                                }
                                                else{
                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                    content: Text(
                                                      'All fields required ...',
                                                      style: TextStyle(fontSize: 20, color: Colors.red),
                                                    ),
                                                    backgroundColor: Color(0xfa8f7805),
                                                  ));
                                                  Navigator.pop(context);
                                                }
                                              });
                                            }, child: Text('Send')),
                                            OutlinedButton(onPressed: (){
                                              Navigator.pop(context);
                                            }, child: Text('Cancel')),
                                          ],
                                        );
                                      }

                                  );

                                }
                                 switch(index){
                                   case 0:Navigator.push(context, MaterialPageRoute(builder: (context)=>ClothCatelog(
                                          logID: ID,
                                   )));break;
                                   case 1:Navigator.push(context, MaterialPageRoute(builder: (context)=>BagSinglePage(
                                     logID: ID,
                                   )));break;
                                   case 2:Navigator.push(context, MaterialPageRoute(builder: (context)=>BookCatelog(
                                     logID: ID,
                                   )));break;
                                   case 3:Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtCatelog(
                                     logID: ID,
                                   )));break;
                                case 4:Navigator.push(context, MaterialPageRoute(builder: (context)=>PlantPurchaseCatelog(
                                  logID: ID,
                                )));break;
              //                       default:Navigator.push(context, MaterialPageRoute(builder: (context)=>OtherCatelog()));break;
                                 }
                               },
                               child: Container(
                                 height: 300,
                                 width: 300,


                                 child: Column(
                                   children: [
                                     ClipOval(

                                       child: Container(
                                         height: 100,
                                         width: 100,
                                         decoration: BoxDecoration(
                                             image: DecorationImage(
                                                 image: AssetImage("assets/images/catelog/"+catelogModel[index]['image']),fit: BoxFit.fill
                                             )
                                         ),
                                       ),
                                     ),


                                     Center(child: Text(catelogModel[index]['name'].toUpperCase(),style: catStyle,)),
                                   ],
                                 ),

                               ),
                             );
                           }),
                     ),


            ],
          ),
        )

      ),
    );
  }
}

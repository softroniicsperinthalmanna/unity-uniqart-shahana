import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uniqartapp/screens/auth/register.dart';
import 'package:uniqartapp/screens/auth/sellerLogin.dart';
import 'package:uniqartapp/screens/donate/Dashboard/donorOrders.dart';
import 'package:uniqartapp/screens/donate/donateCategory.dart';
import 'package:uniqartapp/screens/mySale/Dashboard/myCategories.dart';
import 'package:uniqartapp/screens/mySale/Dashboard/products.dart';
import 'package:uniqartapp/screens/mySale/Dashboard/users.dart';
import 'package:uniqartapp/screens/toLease/rentalOrderPage.dart';
import 'package:uniqartapp/widgets/custDrawer.dart';

import '../../connection/connect.dart';
import '../../styles/style.dart';
import '../auth/donorLogin.dart';
import '../auth/renterLogin.dart';
class DonorIndexHome extends StatefulWidget {
  DonorIndexHome({Key? key,required this.logId}) : super(key: key);
  var logId;
  @override
  State<DonorIndexHome> createState() => _DonorIndexHomeState();
}



class _DonorIndexHomeState extends State<DonorIndexHome> {
  var categoryCount;
  var orders,users,pdts;
  var data1;
//var logID=TextEditingController();

  Future<void> getData() async {
    var data={
      'vid':widget.logId
    };
    print(data);
    var response=await post(Uri.parse("${Con.url}getMyCategory.php"),body: data);
    print(response.body);
    print(response.statusCode);
    // categoryCount=jsonDecode(response.body)['catCount'];
    // orders=jsonDecode(response.body)['ordercount'];
    // users=jsonDecode(response.body)['usercount'];
    // pdts=jsonDecode(response.body)['productcount'];
    // print(orders);
    // print(users);
    // print(pdts);

    return jsonDecode(response.body);
  }
  @override
  void initState(){
    super.initState();
    data1=widget.logId;
//    logID.text=widget.logId;
    getData();

  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        //drawerScrimColor:Colors.red,
        // drawer:custDrawer(),
        appBar: AppBar(
          iconTheme:IconThemeData(color: Colors.blue) ,
          title: Text('Dashboard',style: authHead,),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: Text('Un!Qart Donor LogOut'),
                  content: Text('Do you want to logout ?'),
                  actions: [
                    TextButton(onPressed:(){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>DonorLogin()));

                    }, child: Text('LogOut')),
                    TextButton(onPressed:(){
                      Navigator.pop(context);
                    }, child: Text('Cancel')),
                  ],
                );
              });


            }, child: Text('LogOut',style: catStyle,))
          ],

        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: ListView(
            children: [
              // Visibility(
              //   visible: false,
              //   child: TextField(
              //     controller: logID,
              //   ),
              // ),
              // InkWell(
              //   onTap: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>DonorOrders(did: widget.logId,
              //
              //     )));
              //   },
              //   child: Container(
              //     height: 130,
              //
              //     decoration: BoxDecoration(
              //         color: Color(math.Random().nextInt(0xffffffff)),
              //         borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),topRight: Radius.circular(20))
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text('Orders',style: dashStyle,),
              //      //   Text(orders,style: dashStyle,),
              //       ],
              //     ),
              //   ),
              // ),
              Divider(),

              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DonateCatelog(
                        did: widget.logId,
                      )));

                },
                child: Container(
                  height: 130,

                  decoration: BoxDecoration(
                      color: Color(math.Random().nextInt(0xffffffff)),
                      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),topRight: Radius.circular(20))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Donate',style: dashStyle,),
                    //  Text(pdts,style: dashStyle,),
                    ],
                  ),
                ),
              ),
              Divider(),
              // InkWell(
              //   onTap: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCategories(
              //       logId: widget.logId.toString(),
              //     )));
              //   },
              //   child: Container(
              //     height: 130,
              //
              //     decoration: BoxDecoration(
              //       color: Color(math.Random().nextInt(0xffffffff)),
              //       borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),topRight: Radius.circular(20))
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text('Categories',style: dashStyle,),
              //      // Text(
              //      //   categoryCount==null?0:
              //      //   categoryCount,style: dashStyle,),
              //       ],
              //     ),
              //   ),
              // ),
              // Divider(),

            ],
          ),
        ),
      ),
    );
  }
}

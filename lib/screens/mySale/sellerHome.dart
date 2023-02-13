import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uniqart_app/screens/auth/register.dart';
import 'package:uniqart_app/screens/mySale/Dashboard/myCategories.dart';
import 'package:uniqart_app/screens/mySale/Dashboard/products.dart';
import 'package:uniqart_app/screens/mySale/Dashboard/users.dart';
import 'package:uniqart_app/widgets/custDrawer.dart';

import '../../connection/connect.dart';
import '../../styles/style.dart';
import 'Dashboard/orders.dart';
class SellerHome extends StatefulWidget {
   SellerHome({Key? key,required this.logId}) : super(key: key);
var logId;
  @override
  State<SellerHome> createState() => _SellerHomeState();
}



class _SellerHomeState extends State<SellerHome> {
  var categoryCount;
var data1;
var logID=TextEditingController();

  Future<void> getData() async {
    var data={
      'log_id':widget.logId.toString()
    };
print(data);
    var response=await post(Uri.parse("${Con.url}getMyCategory.php"),body: data);
    print(response.body);
    print(response.statusCode);
     categoryCount=jsonDecode(response.body)['catCount'];
     print(categoryCount);

    return jsonDecode(response.body);
  }
  @override
  void initState(){
    super.initState();
    data1=widget.logId;
    logID.text=widget.logId;
    getData();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //drawerScrimColor:Colors.red,
      drawer:custDrawer(),
      appBar: AppBar(
        iconTheme:IconThemeData(color: Colors.blue) ,
        title: Text('Dashboard',style: authHead,),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(onPressed: (){}, child: Text('LogOut',style: catStyle,))
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ListView(
          children: [
            Visibility(
              visible: true,
              child: TextField(
                controller: logID,
              ),
            ),
            InkWell(
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage()));
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
                    Text('Orders',style: dashStyle,),
                    Text('5',style: dashStyle,),
                  ],
                ),
              ),
            ),
            Divider(),

            InkWell(
              onTap:() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UsersPage()));
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
                    Text('Users',style: dashStyle,),
                    Text('31',style: dashStyle,),
                  ],
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductsPage()));

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
                    Text('Products',style: dashStyle,),
                    Text('5',style: dashStyle,),
                  ],
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCategories(
                  logId: widget.logId.toString(),
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
                    Text('Categories',style: dashStyle,),
                 Text(
                   categoryCount==0?0:
                   categoryCount,style: dashStyle,),
                  ],
                ),
              ),
            ),
            Divider(),

          ],
        ),
      ),
    );
  }
}

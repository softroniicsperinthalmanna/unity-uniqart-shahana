import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uniqartapp/widgets/custSnackBar.dart';

import '../../../connection/connect.dart';
import '../../../widgets/custLottie.dart';
class NeedyNotificaions extends StatefulWidget {
  NeedyNotificaions({Key? key,required this.nid}) : super(key: key);
  var nid;
  @override
  State<NeedyNotificaions> createState() => _NeedyNotificaionsState();
}

class _NeedyNotificaionsState extends State<NeedyNotificaions> {
  var cartID;
  var flag;
  Future<dynamic> getData() async {
    var data={
      'nid':widget.nid
    };
    var response=await post(Uri.parse('${Con.url}needyNotification.php'),body:data);
    print(response.body);
    print(response.statusCode);
    (jsonDecode(response.body)[0]['result'] == 'success')
        ? flag = 1
        : flag = 0;
    print(flag);
    return json.decode(response.body
    );

  }
  // Future<dynamic> getMyCart() async {
  //   var data={
  //     'cartID':cartID.toString()
  //   };
  //   var response=await post(Uri.parse('${Con.url}getMyCart.php'),body:data);
  //   print(response.body);
  //   print(response.statusCode);
  //
  //   cartID=jsonDecode(response.body)[0]['cart_id'];
  //
  //   (jsonDecode(response.body)[0]['result'] == 'success')
  //       ? flag = 1
  //       : flag = 0;
  //   print(flag);
  //   return json.decode(response.body
  //   );
  //
  //
  //
  //
  // }



  @override
  void initState(){
    super.initState();
    getData();
    // getMyCart();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff458F9D),

          title: Text('Notifications'),
          centerTitle: true,
        ),

        body:
        FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print('Error ::${snapshot.error}');
              print('Inside builder ::${snapshot.hasData}');
              if (!snapshot.hasData) {
                return const Center(
                  child: Center(child: Text('No Data')),
                );
              }

              return flag==0?lottieNothing():
              ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child:

                      ListTile(
                        title:Text('Your Order (orderID: #${snapshot.data[index]['oid']}) dated on ${snapshot.data[index]['date'].toString()} has been Approved.'),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ProductID :#${snapshot.data[index]['pid'].toString()}'),

                            Divider(),
                            Text('Visit College store on : ${snapshot.data[index]['pickdate'].toString()}'),
                            // Text('For Queries contact on : ${snapshot.data[index]['phone'].toString()}'),
                            Divider()
                          ],
                        ),
                        // trailing: IconButton(
                        //   icon: Icon(Icons.add_shopping_cart),
                        //   onPressed: () {
                        //
                        //
                        //     // addItemToCart(item);
                        //     Navigator.pop(context);
                        //   },
                        // ),
                      ),
                    );
                  });
            }
        ),


      ),
    );
  }
}

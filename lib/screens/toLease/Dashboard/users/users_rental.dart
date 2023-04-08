import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../../connection/connect.dart';
import '../../../../styles/style.dart';
import '../../../../widgets/custLottie.dart';
import '../../../../widgets/custSnackBar.dart';


class UsersPage_rental extends StatefulWidget {
  UsersPage_rental({Key? key,required this.rid}) : super(key: key);
  var rid;
  @override
  State<UsersPage_rental> createState() => _UsersPage_rentalState();
}

class _UsersPage_rentalState extends State<UsersPage_rental> {
  var flag=0;
  var status;
  var orderid;

  Future<dynamic> getData() async {
    var data = {
      'rid': widget.rid
    };

    var response =
    await post(Uri.parse('${Con.url}viewUsersByRenter.php'), body: data);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      jsonDecode(response.body)[0]['result'] == 'success'
          ? flag = 1
          : flag = 0;
      print(flag);
      return json.decode(response.body);
    } else
      throw Exception('Error returned');
  }
  Future<dynamic> sendData() async {
    var data = {
      'oid': orderid,
      'status':status,



    };

    var response =
    await post(Uri.parse('${Con.url}updateCompletedStatus_rental.php'), body: data);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['result'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
            snackMsg('Updated User Status: (${status})....'));

        return json.decode(response.body);
      } else
        throw Exception('Error returned');
    }
  }

  @override
  void initState(){
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Users',style: authHead,),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){},icon: Icon(Icons.home),)
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print('Error ::${snapshot.error}');
              print('Inside builder ::${snapshot.hasData}');
              if (!snapshot.hasData) {
                return const Center(
                  child: Center(child: Text('No Data')),
                );
              }            return flag==0?lottieNothing():

              ListView.separated(
                separatorBuilder: (context,index){
                  return Divider();
                },
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  return Container(
                    height: 200,
                    child: SingleChildScrollView(
                      child: Column(
                        //shrinkWrap: true,
                          children:[
                            ListTile(
                              tileColor: Colors.grey,
                              title: Text('UserID :#${snapshot.data[index]['cid']} ',style: descStyle,),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ProductID :#${snapshot.data[index]['pid']} '),
                                  Text('Duration :#${snapshot.data[index]['duration']} '),
                                ],
                              ),

                              trailing:Container(
                                  color: Colors.red,
                                  width: 150,
                                  height: 100,

                                  child: Text('Pickup Date : ${snapshot.data[index]['pickdate'].toString()}',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
                            ),

                            ListTile(
                              tileColor: Colors.grey,

                              title: Text('Total'),
                              trailing: Container(
                                  color: Colors.white,
                                  width: 80,
                                  height: 30,

                                  child: Center(child: Text('Rs ${snapshot.data[index]['tot']}'))),
                            ),
                            ButtonBar(
                              children: [
                                OutlinedButton(onPressed: (){
                                  status='completed';
                                  orderid=snapshot.data[index]['oid'];

                                  setState(() {
                                    sendData();
                                  });
                                }, child: Text('Order Complete'))
                              ],
                            )

                          ]
                      ),
                    ),
                  );
                },

              );
            }
        ),
      ),
    );
  }
}

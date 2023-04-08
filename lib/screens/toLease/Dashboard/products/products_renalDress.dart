import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../../connection/connect.dart';
import '../../../../styles/style.dart';
import '../../../../widgets/custLottie.dart';
import '../../../../widgets/custSnackBar.dart';


class ProductsPage_dress extends StatefulWidget {
  ProductsPage_dress({Key? key,required this.rid,required this.cat}) : super(key: key);
  var rid;

  var cat;
  @override
  State<ProductsPage_dress> createState() => _ProductsPage_dressState();
}

class _ProductsPage_dressState extends State<ProductsPage_dress> {
  var flag;
  var pid;
  var rate=TextEditingController();
  var stock=TextEditingController();
  Future<dynamic> getData() async {
    var data = {
      'rid': widget.rid,
      'cat': widget.cat,

    };

    var response =
    await post(Uri.parse('${Con.url}viewMyProducts_renter.php'), body: data);
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
  Future<dynamic> deleteData() async {
    var data = {
      'pid': pid,

    };

    var response =
    await post(Uri.parse('${Con.url}deleteProduct_rental.php'), body: data);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      if(jsonDecode(response.body)['result'] == 'success'){
        setState(() {

        });
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            snackMsg('Deleted Successfully ...'));

        print(flag);
        // return json.decode(response.body);

      }
      else{
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            snackMsg('Failed to delete ...'));

        print(flag);

      }

    } else
      throw Exception('Error returned');
  }
  Future<dynamic> editData() async {
    var data = {
      'pid': pid,
      'rate':rate.text,
      'stock':stock.text,

    };

    var response =
    await post(Uri.parse('${Con.url}editOther_rental.php'), body: data);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      if(jsonDecode(response.body)['result'] == 'success'){
        setState(() {

        });
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            snackMsg('Edited Successfully ...'));

        print(flag);
        // return json.decode(response.body);

      }
      else{
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            snackMsg('Failed to edit ...'));

        print(flag);

      }
    } else
      throw Exception('Error returned');
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Products',style: authHead,),
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
                  return   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 800,
                      width: MediaQuery.of(context).size.width,

                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 400,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xffa2e7ef),
                                  child: Image.network(
                                    '${Con.url}dressUploads/${snapshot.data[index]['image']}',
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${snapshot.data[index]['name']}',
                                style: heading1,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Rs ${snapshot.data[index]['rent']}',
                                //   style: heading1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${snapshot.data[index]['stock']} ',
                                // style: heading1,
                              ),
                            ), Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${snapshot.data[index]['size']}',
                                //   style: heading1,
                              ),
                            ), Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${snapshot.data[index]['material']}',
                                //  style: heading1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${snapshot.data[index]['des']}',
                                // style: descStyle,
                              ),
                            ),
                            //  Spacer(),
                            ButtonBar(
                              children: [
                                // ElevatedButton(
                                //     onPressed: () {
                                //       print(widget.type);
                                //       setState(() {
                                //     //    addToCart();
                                //       });
                                //     },
                                //     child: Text('Add to Cart')),
                                ButtonBar(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          rate.text=snapshot.data[index]['rent'];
                                          stock.text=snapshot.data[index]['stock'];
                                          showDialog(context: context, builder: (context){
                                            return AlertDialog(
                                              title: Text('Edit Details'),
                                              content: Container(
                                                height: 250,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    TextFormField(
                                                      keyboardType: TextInputType.text,
                                                      controller: rate,
                                                      decoration: InputDecoration(
                                                          label: Text('New Rent')
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      keyboardType: TextInputType.text,
                                                      controller: stock,
                                                      decoration: InputDecoration(
                                                          label: Text('Stock available/unavailable')
                                                      ),



                                                    )
                                                  ],
                                                ),
                                              ),






                                              actions: [
                                                TextButton(onPressed: (){
                                                  pid=snapshot.data[index]['pid'];
                                                  editData();
                                                }, child: Text('Edit')),
                                                TextButton(onPressed: (){
                                                  Navigator.pop(context);
                                                }, child: Text('Cancel')),
                                              ],
                                            );
                                          });



                                        },
                                        child: Text('Edit')),ElevatedButton(
                                        onPressed: () {
                                          showDialog(context: context, builder: (context){
                                            return AlertDialog(
                                              title: Text('Delete Product'),
                                              content: Text('Are you sure?'),
                                              actions: [
                                                TextButton(onPressed: (){
                                                  pid=snapshot.data[index]['pid'];
                                                  deleteData();
                                                }, child: Text('Yes')),
                                                TextButton(onPressed: (){
                                                  Navigator.pop(context);
                                                }, child: Text('No')),
                                              ],
                                            );
                                          });
                                        },
                                        child: Text('Delete')),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
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

import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uniqartapp/screens/mySale/Dashboard/products.dart';
import 'package:uniqartapp/screens/mySale/Dashboard/products_art.dart';
import 'package:uniqartapp/screens/mySale/Dashboard/products_bag.dart';
import 'package:uniqartapp/screens/mySale/Dashboard/products_book.dart';
import 'package:uniqartapp/screens/mySale/Dashboard/products_cloth.dart';
import 'package:uniqartapp/screens/mySale/Dashboard/products_plant.dart';
import 'package:uniqartapp/screens/toLease/Dashboard/products/products_jewel.dart';
import 'package:uniqartapp/screens/toLease/Dashboard/products/products_renalDress.dart';

import '../../../../connection/connect.dart';
import '../../../../styles/style.dart';
import '../../../../widgets/custLottie.dart';
import '../rentalCatelogsHome.dart';

class CategoryPage_rental extends StatefulWidget {
  CategoryPage_rental({Key? key, required this.rid}) : super(key: key);
  var rid;
  @override
  State<CategoryPage_rental> createState() => _CategoryPage_rentalState();
}

class _CategoryPage_rentalState extends State<CategoryPage_rental> {
  var flag;
  Future<dynamic> getData() async {
    var data = {'rid': widget.rid};

    var response =
    await post(Uri.parse('${Con.url}viewCategory_renter.php'), body: data);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;
      print(flag);
      return json.decode(response.body);
    } else
      throw Exception('Error returned');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: authHead,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
          )
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
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListView(shrinkWrap: true, children: [
                    ListTile(
                        tileColor: Colors.grey,
                        title: Text(
                          '${snapshot.data[index]['cat']}',
                          style: descStyle,
                        ),
                        onTap: () {
                          switch (snapshot.data[index]['cat']) {
                            case 'rentalDress':
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductsPage_dress(
                                        rid: widget.rid,
                                        cat: snapshot.data[index]['cat'],
                                      )));
                              break;
                            case 'jewellery':
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductsPage_jewel(
                                        rid: widget.rid,
                                        cat: snapshot.data[index]['cat'],
                                      )));
                              break;

                          }
                        }),
                  ]);
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RentalCatelogsHome(
                    rid: widget.rid,
                  )));
        },
        tooltip: 'Click to Add Products',
        child: Icon(Icons.add),
      ),
    );
  }
}
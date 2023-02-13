import 'package:flutter/material.dart';
import 'package:uniqart_app/models/clothesmodel.dart';
import 'package:uniqart_app/screens/myPurchase/art/artSingleCategoryPage.dart';
import 'package:uniqart_app/screens/mySale/art/addArt.dart';
import 'package:uniqart_app/screens/mySale/book/addBookDetails.dart';

import '../../../../styles/style.dart';
import 'addClothDetail.dart';

class ClothSaleCatelog extends StatefulWidget {
  const ClothSaleCatelog({Key? key}) : super(key: key);

  @override
  State<ClothSaleCatelog> createState() => _ClothSaleCatelogState();
}

class _ClothSaleCatelogState extends State<ClothSaleCatelog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff458F9D),
        title: Text('UNIQART'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          )
        ],
      ),
      body: CustomScrollView(
          // floatHeaderSlivers: true,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xff458F9D),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'CLOTHING',
                  style: subHead,
                ),
                background: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    // color: Color(0xff458F9D),
                    image: DecorationImage(
                       image: AssetImage("assets/images/clothes/clothes.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.centerLeft,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              // title: const Text('Title'),
              floating: true,
              //  pinned: true,
              expandedHeight: 250.0,

              // bottom: AppBar(
              //   backgroundColor: Colors.red,
              //   toolbarHeight: 64.0,
              // ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(childCount: cloth.length,
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddClothDetails(
                                          indexNo: index,
                                        )));
                          },
                          child: ClipOval(
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/clothes/" +
                                            cloth[index]['image'],
                                      ),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                          cloth[index]['name'].toUpperCase(),
                          style: catStyle,
                        )),
                      ],
                    ),
                  ),
                );
              }),
            )
          ]),
    );
  }
}

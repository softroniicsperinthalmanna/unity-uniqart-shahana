import 'package:flutter/material.dart';
import 'package:uniqartapp/screens/myPurchase/art/artSingleCategoryPage.dart';

import '../../../models/artmodel.dart';
class ArtCatelog extends StatefulWidget {
   ArtCatelog({Key? key,required this.logID}) : super(key: key);
var logID;
  @override
  State<ArtCatelog> createState() => _ArtCatelogState();
}

class _ArtCatelogState extends State<ArtCatelog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff458F9D),

        leading: Icon(Icons.menu),
        title: Text('UNIQART'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){},  icon: Icon(Icons.home)),
          )
        ],

      ),

      body: CustomScrollView(
        // floatHeaderSlivers: true,
          slivers:<Widget>    [
            SliverAppBar(
              backgroundColor:Color(0xff458F9D) ,
              flexibleSpace: FlexibleSpaceBar(

                background: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    // color: Color(0xff458F9D),
                    image: DecorationImage(
                      image: AssetImage("assets/images/art/artlogo.jpg"),
                      fit: BoxFit.fill,
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
            SliverList(

              delegate: SliverChildBuilderDelegate(
                childCount:artCatelog.length,
                    (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12),
                    child: InkWell(
                      onTap: (){
                        print('one:$index');
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtSingleCategoryPage(
                          indexNo: index,
                          type:'art', logID: widget.logID,

                        )));
                      },
                      child: Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(

                            image: AssetImage(
                              "assets/images/art/"+ artCatelog[index]['image'],),
                            fit: BoxFit.fitWidth,
                            // opacity: 0.4
                          ),

                        ),
                        child:
                        Center(
                          child: Text(
                            artCatelog[index]['name'],
                            style: TextStyle(color:Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 30),),),

                      ),
                    ),
                  );
                },
              ),
            ),

          ]
      ),

    );
  }
}

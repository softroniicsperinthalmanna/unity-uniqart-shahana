import 'package:flutter/material.dart';
import 'package:uniqartapp/screens/myPurchase/fashion/bag/bagSinglePage.dart';
import 'package:uniqartapp/styles/style.dart';

import '../../../models/artmodel.dart';
import '../../../models/bookModel.dart';
import 'BookSinglePage.dart';
class BookCatelog extends StatefulWidget {
   BookCatelog({Key? key,required this.logID}) : super(key: key);
var logID;

  @override
  State<BookCatelog> createState() => _BookCatelogState();
}

class _BookCatelogState extends State<BookCatelog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: tealBlue,

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
                      image: AssetImage("assets/images/book/booklogo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.centerLeft,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'BOOKS',
                        style: TextStyle(color: Colors.white, fontSize: 36.0),
                      ),
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
              childCount:bookModel.length,
                  (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BookSinglePage(
                        indexNo: index,
                        logID: widget.logID,
                      )));
                    // if (index==0){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Calligraphy()));
                    // }
                    // if (index==1){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Paintings()));
                    // }
                    // if (index==2){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Gift()));
                    // }
                    // if (index==3){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SaveTheDate()));
                    // }
                    // if (index==4){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Mehandi()));
                    // }
                    // if (index==5){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Calligraphy()));
                    // }
                    },
                    child: Container(
                      height: 170,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(

                          image: AssetImage(
                            "assets/images/book/"+ bookModel[index]['image'],),
                          fit: BoxFit.fitWidth,
                       // opacity: 0.4
                        ),

                      ),
                      child:
                      Center(
                        child: Opacity(

                          opacity: 0.7,
                          child: Container(
                            height: 50,
                            width: 350,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                bookModel[index]['name'],
                                style: TextStyle(color:tealBlue,
                                    fontWeight: FontWeight.bold,fontSize: 20),),
                            ),
                          ),
                        ),),

                    ),
                  ),
                );
              },
            ),
          ),

        // ListView.builder(
        //   padding: const EdgeInsets.all(8),
        //   itemCount: 30,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       height: 50,
        //       child: Center(child: Text('Item $index')),
        //     );
        //   },
        // ),
    ]
      ),

    );
  }
}

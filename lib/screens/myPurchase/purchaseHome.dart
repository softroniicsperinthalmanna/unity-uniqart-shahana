import 'package:flutter/material.dart';
import 'package:uniqart_app/screens/donor/donateCategory.dart';
import 'package:uniqart_app/screens/myPurchase/plants/plantCatelog.dart';
import 'package:uniqart_app/screens/myPurchase/purchaseCatelog.dart';
import 'package:uniqart_app/screens/mySale/sellerHome.dart';
import 'package:uniqart_app/styles/style.dart';

import '../../models/catelogModel.dart';
import 'art/artCatelog.dart';
import 'book/bookCatelog.dart';
import 'fashion/bag/bagSinglePage.dart';
import 'fashion/cloth/clothCatelog.dart';
class PurchaseHome extends StatefulWidget {
   PurchaseHome({Key? key,required this.logID}) : super(key: key);
var logID;
  @override
  State<PurchaseHome> createState() => _PurchaseHomeState();
}

class _PurchaseHomeState extends State<PurchaseHome> {
var ID;
late bool listVisibility;
  void initState(){
    super.initState();
    ID=widget.logID;
    listVisibility=false;
    print("my id in Purchase Home: "+ID);

  }

  List<dynamic> services=['bride.webp','jwls.jpg','tops.jpg','plants.jpg','clothes.jpg','fashion.png','bag.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: CircleAvatar(
              backgroundColor:Color(0xff458F9D) ,
              radius: 60,
              child: Icon(Icons.person,size: 50,),
            )),
            OutlinedButton(onPressed: (){}, child: Text('Edit Profile',style: tealNormalauthBtn,)),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(onPressed: (){}, child: Text('FeedBack',style: tealNormalauthBtn,)),
    //               PopupMenuButton(
    //                   itemBuilder: (context){
    //                 return [
    //                   PopupMenuItem(child: TextButton(onPressed: (){},child: Text('Sell',style: tealNormalauthBtn,),)),
    //                   PopupMenuItem(child: TextButton(onPressed: (){},child: Text('Donate',style: tealNormalauthBtn,),)),
    //                   PopupMenuItem(child: TextButton(onPressed: (){},child: Text('Help Needy',style: tealNormalauthBtn,),))
    //                 ];
    //
    // }
    //
    //               ),
                  TextButton(onPressed: (){
                    setState(() {
                      listVisibility=!(listVisibility);

                    });
                    print(listVisibility);
                  }, child: Text('Services',style: tealNormalauthBtn,)),

                  Visibility(
                    visible:listVisibility ,
                    child: Container(
                      height: 150,
                      child: ListView(
                        children: [

                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerHome(logId: ID,)));
                          }, child: Text('Sell',style: tealNormalauthBtn,)),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DonateCatelog()));

                          },
                              child: Text('Donate',style: tealNormalauthBtn,)),

                          TextButton(onPressed: (){

                          }, 
                              child: Text('For Needy',style: tealNormalauthBtn,)),


                        ],
                      ),
                    ),
                  ),

                  TextButton(onPressed: (){}, child: Text('LogOut',style: tealNormalauthBtn,)),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: Color(0xff458F9D),

          title: Text('UNIQART'),
          centerTitle:true

      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/college.jpg"),
                        fit: BoxFit.fill
                    )
                ),

              ),
              SizedBox(height: 10,),
              ListTile(
                title:Text('Categories',
                  style: authBtn,
                  // textAlign: TextAlign.left,
                ),
                trailing:TextButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PurchaseCatelog(

                          logID: ID,
                        )));
                  },
                  child: Text('View All',
                    style: redauthBtn,
                    // textAlign: TextAlign.left,
                  ),
                )
              ),


              SizedBox(height: 10,),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: catelogModel.length,

                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){

                          switch(index){
                            case 0:Navigator.push(context, MaterialPageRoute(builder: (context)=>ClothCatelog(
                              logID: ID,
                            )));break;
                            case 1:Navigator.push(context, MaterialPageRoute(builder: (context)=>BagSinglePage()));break;
                            case 2:Navigator.push(context, MaterialPageRoute(builder: (context)=>BookCatelog()));break;
                            case 3:Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtCatelog()));break;
                            case 4:Navigator.push(context, MaterialPageRoute(builder: (context)=>PlantPurchaseCatelog()));break;
                          //                       default:Navigator.push(context, MaterialPageRoute(builder: (context)=>OtherCatelog()));break;
                          }
                        },
                        child: Container(
                          height: 30,
                          width: 100,


                          child: Column(
                            children: [
                              ClipOval(

                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/images/catelog/"+catelogModel[index]['image']),fit: BoxFit.fill
                                      )
                                  ),
                                ),
                              ),


                              // Center(child: Text(catelogModel[index]['name'].toUpperCase(),style: catStyle,)),
                            ],
                          ),

                        ),
                      );
                    }),
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.90,
                width: MediaQuery.of(context).size.width * 0.90,
                child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3

                    ),
                    itemBuilder: (context,index){
                      return Container(
                        // height: 400,
                        // width: 200,
                        height: MediaQuery.of(context).size.width * 0.1,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Image(image: AssetImage("assets/images/"+services[index]),fit: BoxFit.fill,),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.90,
                width: MediaQuery.of(context).size.width * 0.90,
                child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3

                    ),
                    itemBuilder: (context,index){
                      return Container(
                        // height: 400,
                        // width: 200,
                        height: MediaQuery.of(context).size.width * 0.1,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Image(image: AssetImage("assets/images/"+services[index]),fit: BoxFit.fill,),
                      );
                    }),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:uniqartapp/screens/auth/donorLogin.dart';
import 'package:uniqartapp/screens/auth/login.dart';
import 'package:uniqartapp/screens/auth/needyLogin.dart';
import 'package:uniqartapp/screens/auth/renterLogin.dart';
import 'package:uniqartapp/screens/auth/sellerLogin.dart';
import 'package:uniqartapp/screens/myPurchase/cart/cart.dart';
import 'package:uniqartapp/screens/myPurchase/individualPic.dart';
import 'package:uniqartapp/screens/myPurchase/myNotification.dart';
import 'package:uniqartapp/screens/myPurchase/plants/plantCatelog.dart';
import 'package:uniqartapp/screens/myPurchase/purchaseCatelog.dart';
import 'package:uniqartapp/screens/myPurchase/rental/rentalPurchaseCatelog.dart';
import 'package:uniqartapp/screens/mySale/sellerHome.dart';
import 'package:uniqartapp/screens/needy/needyCatelog.dart';
import 'package:uniqartapp/styles/style.dart';

import '../../models/catelogModel.dart';
import '../donate/donateCategory.dart';
import '../mySale/sellOrLease.dart';
import '../toLease/Dashboard/rentalCatelogsHome.dart';
import 'art/artCatelog.dart';
import 'book/bookCatelog.dart';
import 'fashion/bag/bagSinglePage.dart';
import 'fashion/cloth/clothCatelog.dart';
class PurchaseHome extends StatefulWidget {
   PurchaseHome({Key? key,required this.logID,required this.userType}) : super(key: key);
var logID;
var userType;

  @override
  State<PurchaseHome> createState() => _PurchaseHomeState();
}

class _PurchaseHomeState extends State<PurchaseHome> {
var ID;
var img;
late bool listVisibility;
  void initState(){
    super.initState();
    ID=widget.logID.toString();
    listVisibility=false;
    print("my id in Purchase Home: "+ID);

  }

  List<dynamic> services=['bride.webp','jwls.jpg','tops.jpg','plants.jpg','clothes.jpg','fashion.png','bag.jpg'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff458F9D),
          // leading: Icon(Icons.menu),
          title: Text('UNIQART'),
          centerTitle: true,
          actions: [
            // Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child:  IconButton(
            //       onPressed: () {
            //         Navigator.push(
            //             context, MaterialPageRoute(builder: (context) => myCart()));
            //       },
            //       icon: Icon(Icons.shopping_cart),
            //       iconSize: 25,
            //     )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MyNotificaions(logID: widget.logID)));
                },
                icon: Icon(Icons.notifications),
                iconSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:IconButton(
                onPressed: () {
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text('Un!Qart LogOut'),
                      content: Text('Do you want to logout ?'),
                      actions: [
                        TextButton(onPressed:(){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SignIn()));

                        }, child: Text('LogOut')),
                        TextButton(onPressed:(){
                          Navigator.pop(context);
                        }, child: Text('Cancel')),
                      ],
                    );
                  });

                },
                icon: Icon(Icons.logout),
                iconSize: 25,
              ),
            ),
          ],
        ),

        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child:
                // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Image(
                  //     image: AssetImage('assets/images/pic2.jpg'),
                  //     fit:BoxFit.cover ,
                  //   ),
                  // )

                  CircleAvatar(
                backgroundColor:Color(0xff458F9D) ,
                radius: 60,
                child: Icon(Icons.person,size: 50,),
              ),
              ),
              // OutlinedButton(onPressed: (){}, child: Text('Edit Profile',style: tealNormalauthBtn,)),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TextButton(onPressed: (){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>myCart()));
                    //
                    // }, child: Text('My Bag',style: tealNormalauthBtn,)),
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
                    Visibility(
                      visible: widget.userType!='Student'?false:true,

                      child: TextButton(onPressed: (){
                        setState(() {
                          listVisibility=!(listVisibility);

                        });
                        print(listVisibility);
                      }, child: Text('Services',style: tealNormalauthBtn,)),
                    ),

                    Visibility(
                      visible:listVisibility ,
                      child: Container(
                        height: 250,
                        child: ListView(
                          children: [

                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerLogin(
                               )));
                            }, child: Text('Sell',style: tealNormalauthBtn,)),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DonorLogin(

                              )));

                            },
                                child: Text('Donate',style: tealNormalauthBtn,)),

                            TextButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>NeedyLogin()));

      },


                                child: Text('For Needy',style: tealNormalauthBtn,)),
                            TextButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>RenterLogin()));

      },


                                child: Text('Rent',style: tealNormalauthBtn,)),


                          ],
                        ),
                      ),
                    ),

                    TextButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SignIn()));
                    }, child: Text('LogOut',style: tealNormalauthBtn,)),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Welcome ',style: GoogleFonts.russoOne(color: tealBlue,fontSize: 35),),
                ),
                SizedBox(height: 20,),

                CarouselSlider(
                  items: [
                  InkWell(
                    onTap: (){
                      img='college.jpg';
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualPicture(
                        image:img
                      )));

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/college/college.jpg"),
                              fit: BoxFit.fill
                          )
                      ),

                    ),
                  ),
                  InkWell(
                    onTap: (){
                      img='u11.jpg';
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualPicture(
                          image:img
                      )));

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/college/u11.jpg"),
                              fit: BoxFit.fill
                          )
                      ),

                    ),
                  ),
                  InkWell(
                    onTap: (){
                      img='u12.jpg';
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualPicture(
                          image:img
                      )));

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/college/u12.jpg"),
                              fit: BoxFit.fill
                          )
                      ),

                    ),
                  ),

                  ],
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16/9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1.0,
                  ),
                ),




                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: 200,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: AssetImage("assets/images/college/college.jpg"),
                //           fit: BoxFit.fill
                //       )
                //   ),
                //
                // ),
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
                              case 1:
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>BagSinglePage(
                                  logID: widget.logID,
                                )));
                                break;
                              case 2:Navigator.push(context, MaterialPageRoute(builder: (context)=>BookCatelog(
                                logID: widget.logID,
                              )));break;
                              case 3:Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtCatelog(
                                logID: widget.logID,
                              )));break;
                              case 4:Navigator.push(context, MaterialPageRoute(builder: (context)=>PlantPurchaseCatelog(
                                logID: widget.logID,
                              )));break;
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
                SizedBox(height: 5,),
                InkWell(
                  onTap: (){
                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>DonateCatelog()));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DonorLogin()));

                  },
                  child: Visibility(
                    visible: widget.userType!='Student'?false:true,
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/home/donate.jpg'),fit: BoxFit.fill,
                          )
                      ),

                      // child: Image(
                      //   image: AssetImage('assets/images/home/donate.jpg',),fit: BoxFit.fill,
                      // ),
                      child:                         Center(
                        child: Opacity(

                          opacity: 0.85,
                          child: Container(
                            height: 50,
                            width: 350,

                            color: Colors.white,
                            child: Center(
                              child: Text(
                               'Donate',
                                style: TextStyle(color:Color(0xff458F9D),
                                    fontWeight: FontWeight.bold,fontSize: 30),),
                            ),
                          ),
                        ),),

                    ),
                  ),
                ),
                SizedBox(height: 5,),
                InkWell(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>NeedyCatelog()));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NeedyLogin()));

                  },
                  child: Visibility(
                    visible: widget.userType!='Student'?false:true,
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/home/Needy1.png'),fit: BoxFit.fill,
                        )
                      ),
                      child:                         Center(
                        child: Opacity(

                          opacity: 0.85,
                          child: Container(
                            height: 50,
                            width: 350,

                            color: Colors.white,
                            child: Center(
                              child: Text(
                                'Needy',
                                style: TextStyle(color:Color(0xff458F9D),
                                    fontWeight: FontWeight.bold,fontSize: 30),),
                            ),
                          ),
                        ),),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
            Visibility(
              visible: widget.userType!='Student'?false:true,
              child: CarouselSlider(
                items: [
                 // Image.asset('assets/images/home/service2.jpg',fit: BoxFit.fill,),
                  InkWell(
                      onTap: (){
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>RentalHome()));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RenterLogin()));

                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset('assets/images/home/lease2.jpg',fit: BoxFit.fill))),
                   InkWell(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerLogin()));

                       },
                       child: Container(
                           width: MediaQuery.of(context).size.width,

                           child: Image.asset('assets/images/home/sell22.jpg',fit: BoxFit.fill))),
                ],
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16/9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
              ),
            ),

            // InkWell(
            //       onTap: (){
            //         Navigator.push(context, MaterialPageRoute(builder: (context)=>SellOrLease()));
            //
            //       } ,
            //       child: Container(
            //         height:185,
            //         width: MediaQuery.of(context).size.width,
            //         child: Image(
            //           image: AssetImage('assets/images/home/service2.jpg'),fit: BoxFit.fill,
            //         ),
            //       ),
            //     ),
                SizedBox(height: 5,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RentalPurchaseHome(
                        logID:widget.logID
                    )));

                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage("assets/images/college/college.jpg"),
                        //         fit: BoxFit.fill
                        //     )
                        // ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Image(
                                  image: (AssetImage("assets/images/rent/choker1.jpg")),fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Image(
                                  image: (AssetImage("assets/images/rent/rentjewel1.jpg")),fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),

                      ),
                    //   SizedBox(height: 50,),
                       Opacity(

                         opacity: 0.85,
                         child: Container(
                           height: 100,
                           width: 350,

                           color: Colors.white,
                           child: Center(
                             child: Text(
                               'Bridal Jewellery & Dresses',
                               style: TextStyle(color:Color(0xff458F9D),
                                   fontWeight: FontWeight.bold,fontSize: 30),
                             textAlign: TextAlign.center,
                             ),
                           ),
                         ),
                       ),

                    ],
                  ),
                ),
                SizedBox(height: 5,),


                // Container(
                //   height: MediaQuery.of(context).size.width * 0.90,
                //   width: MediaQuery.of(context).size.width * 0.90,
                //   child: GridView.builder(
                //       itemCount: 4,
                //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //           crossAxisCount: 2,
                //           mainAxisSpacing: 3,
                //           crossAxisSpacing: 3
                //
                //       ),
                //       itemBuilder: (context,index){
                //         return Container(
                //           // height: 400,
                //           // width: 200,
                //           height: MediaQuery.of(context).size.width * 0.1,
                //           width: MediaQuery.of(context).size.width * 0.1,
                //           child: Image(image: AssetImage("assets/images/"+services[index]),fit: BoxFit.fill,),
                //         );
                //       }),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Container(
                //   height: MediaQuery.of(context).size.width * 0.90,
                //   width: MediaQuery.of(context).size.width * 0.90,
                //   child: GridView.builder(
                //       itemCount: 4,
                //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //           crossAxisCount: 2,
                //           mainAxisSpacing: 3,
                //           crossAxisSpacing: 3
                //
                //       ),
                //       itemBuilder: (context,index){
                //         return Container(
                //           // height: 400,
                //           // width: 200,
                //           height: MediaQuery.of(context).size.width * 0.1,
                //           width: MediaQuery.of(context).size.width * 0.1,
                //           child: Image(image: AssetImage("assets/images/"+services[index]),fit: BoxFit.fill,),
                //         );
                //       }),
                // ),
              ],
            ),
          ),

        ),
      ),
    );
  }
// Widget cartBadge() {
//   return Badge(
//     //  position: BadgePosition.topEnd(),
//
//       textColor: Colors.amber,
//       //  label: Text('5'),
//       child: IconButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => myCart()));
//         },
//         icon: Icon(Icons.shopping_cart),
//         iconSize: 25,
//       ));
// }
// Badge notifyBadge() {
//   return Badge(
//     //  position: BadgePosition.topEnd(),
//
//       textColor: Colors.amber,
//       // label: Text('3'),
//       child: IconButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => myCart()));
//         },
//         icon: Icon(Icons.notifications),
//         iconSize: 25,
//       ));
// }


}
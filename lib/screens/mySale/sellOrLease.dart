// import 'package:flutter/material.dart';
// import 'package:uniqartapp/screens/myPurchase/rental/dress/dressCatelog.dart';
// import 'package:uniqartapp/screens/myPurchase/rental/rentalPurchaseCatelog.dart';
// import 'package:uniqartapp/screens/mySale/sellerHome.dart';
//
// import '../../../models/rentalCategory.dart';
// import '../../models/sl_model.dart';
// class SellOrLease extends StatelessWidget {
//   const SellOrLease({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(),
//       appBar: AppBar(
//         backgroundColor: Color(0xff456F64),
//         title: Text("UNIQART"),
//         centerTitle: true,
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//
//         child: ListView.builder(
//             itemCount: sl.length,
//             itemBuilder: (BuildContext context, int index) {
//               return InkWell(
//                 onTap: (){
//                   if(index==0){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>RentalPurchaseHome(
//                       logID: widget.,
//                     )));
//
//                   }else{
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerHome(logId: '1',
//                     )));
//                   }
//
//
//
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(60.0),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height*0.25,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//
//                         image: AssetImage(
//                           "assets/images/home/" +sl [index]['img'],),
//                         fit: BoxFit.fill,),
//
//                     ),
//
//
//
//                     //child: Align(
//                     //alignment: Alignment.bottomCenter,
//                     //child: Container(
//                     // height: 50,
//                     //width: 350,
//
//
//                   ),
//                 ),
//               );
//             }
//         ),
//       ),
//     );
//
//
//
//
//   }
// }
//
//

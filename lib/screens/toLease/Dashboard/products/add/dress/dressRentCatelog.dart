// import 'package:flutter/material.dart';
// import 'package:uniqartapp/models/dressModel.dart';
// import 'package:uniqartapp/screens/myPurchase/fashion/bag/bagSinglePage.dart';
// import 'package:uniqartapp/screens/myPurchase/rental/dress/dressSinglePage.dart';
// import 'package:uniqartapp/screens/toLease/dress/addDress.dart';
//
// import '../../../../models/artmodel.dart';
// import '../../../../models/clothesmodel.dart';
// class DressSaleCatelog extends StatefulWidget {
//   DressSaleCatelog({Key? key,required this.rid}) : super(key: key);
// var rid;
//
//   @override
//   State<DressSaleCatelog> createState() => _DressSaleCatelogState();
// }
//
// class _DressSaleCatelogState extends State<DressSaleCatelog> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     //  ID=widget.logID;
//     // print("My ID in cloth category : "+ID);
//     return Scaffold(
//       appBar:AppBar(
//         backgroundColor: Color(0xff458F9D),
//
//         leading: Icon(Icons.menu),
//         title: Text('UNIQART'),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(onPressed: (){},  icon: Icon(Icons.home)),
//           )
//         ],
//
//       ),
//
//       body: CustomScrollView(
//         // floatHeaderSlivers: true,
//           slivers:<Widget>    [
//             SliverList(
//
//               delegate: SliverChildBuilderDelegate(
//                 childCount:dressModel.length,
//                     (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12),
//                     child: InkWell(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDressDetails(
//                           indexNo: index,rid: widget.rid,
//                           // logID: ID,
//                         )));
//                         // if (index==0){
//                         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Calligraphy()));
//                         // }
//                         // if (index==1){
//                         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Paintings()));
//                         // }
//                         // if (index==2){
//                         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Gift()));
//                         // }
//                         // if (index==3){
//                         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SaveTheDate()));
//                         // }
//                         // if (index==4){
//                         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Mehandi()));
//                         // }
//                         // if (index==5){
//                         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Calligraphy()));
//                         // }
//                       },
//                       child: Container(
//                         height: 170,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//
//                             image: AssetImage(
//                               "assets/images/rent/"+ dressModel[index]['img'],),
//                             fit: BoxFit.fitWidth,
//                             // opacity: 0.4
//                           ),
//
//                         ),
//                         child:
//                         Center(
//                           child: Text(
//                             dressModel[index]['name'],
//                             style: TextStyle(color:Colors.white,
//                                 fontWeight: FontWeight.bold,fontSize: 30),),),
//
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//             // ListView.builder(
//             //   padding: const EdgeInsets.all(8),
//             //   itemCount: 30,
//             //   itemBuilder: (BuildContext context, int index) {
//             //     return Container(
//             //       height: 50,
//             //       child: Center(child: Text('Item $index')),
//             //     );
//             //   },
//             // ),
//           ]
//       ),
//
//     );
//   }
// }

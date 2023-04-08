// import 'dart:convert';
// import 'dart:math' as math;
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// import '../../../connection/connect.dart';
// import '../../../styles/style.dart';
// import '../../../widgets/custLottie.dart';
// import '../../../widgets/custSnackBar.dart';
//
// class DonorOrders extends StatefulWidget {
//   DonorOrders({Key? key,required this.did}) : super(key: key);
//   var did;
//   @override
//   State<DonorOrders> createState() => _DonorOrdersState();
// }
//
// class _DonorOrdersState extends State<DonorOrders> {
//   var flag=0;
//   var status;
//   var orderid;
//   var pdtid;
//   var pickdate;
//   var stock;
//   var nid;
//   var tot;
//   Future<dynamic> getData() async {
//     var data = {
//       'did': widget.did
//     };
//
//     var response =
//     await post(Uri.parse('${Con.url}viewOrdersByDonor.php'), body: data);
//     print(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       jsonDecode(response.body)[0]['result'] == 'success'
//           ? flag = 1
//           : flag = 0;
//       print(flag);
//       return json.decode(response.body);
//     } else
//       throw Exception('Error returned');
//   }
//   Future<dynamic> sendData() async {
//     var data = {
//       'oid': orderid,
//       'status':status,
//       'pid':pdtid,
//       'stock':stock.toString(),
//
//
//
//     };
//
//     var response =
//     await post(Uri.parse('${Con.url}updateOrderDonor.php'), body: data);
//     print(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       if (jsonDecode(response.body)['result'] == 'success') {
//         ScaffoldMessenger.of(context).showSnackBar(
//             snackMsg('Updated Order Status: (${status})....'));
//
//         return json.decode(response.body);
//       } else
//         throw Exception('Error returned');
//     }
//   }
//   Future<dynamic> sendNoti() async {
//     var data = {
//       'oid': orderid,
//       'pid':pdtid,
//       // 'msg_from':'seller',
//       'nid':nid,
//       'pickdate':pickdate,
//       // 'tot':tot,
//       'did':widget.did,
//
//       'date':DateTime.now().toString()
//
//
//
//     };
//
//     var response =
//     await post(Uri.parse('${Con.url}toNotificationNeedy.php'), body: data);
//     print(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       if (jsonDecode(response.body)['result'] == 'success') {
//         ScaffoldMessenger.of(context).showSnackBar(
//             snackMsg('Updated Order Status: (${status})....'));
//
//         return json.decode(response.body);
//       } else
//         throw Exception('Error returned');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Orders',style: authHead,),
//           centerTitle: true,
//           backgroundColor: Colors.white,
//           elevation: 0,
//           actions: [
//             // IconButton(onPressed: (){},icon: Icon(Icons.home),)
//           ],
//
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: FutureBuilder(
//               future: getData(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) print('Error ::${snapshot.error}');
//                 print('Inside builder ::${snapshot.hasData}');
//                 if (!snapshot.hasData) {
//                   return const Center(
//                     child: Center(child: Text('No Data')),
//                   );
//                 }            return flag==0?lottieNothing():
//
//                 ListView.separated(
//                   separatorBuilder: (context,index){
//                     return Divider();
//                   },
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (context,index){
//                     orderid=snapshot.data[index]['oid'];
//                     pdtid=snapshot.data[index]['pid'];
//                     pickdate=snapshot.data[index]['pickdate'];
//                     nid=snapshot.data[index]['nid'];
//                     // tot=snapshot.data[index]['tot'];
//                     stock=int.parse(snapshot.data[index]['stock']);
//                     return SingleChildScrollView(
//                       child: Column(
//                         // shrinkWrap: true,
//                           children:[
//                             ListTile(
//                               tileColor: Colors.grey,
//                               title: Text('#userID:${snapshot.data[index]['nid']}',style: descStyle,),
//                               trailing:Container(
//                                   color: Colors.red,
//                                   width: 80,
//                                   height: 30,
//
//                                   child: Center(child: Text('Waiting',style: TextStyle(color: Colors.white),))),
//                             ),
//                             ListTile(
//                               tileColor: Colors.grey,
//
//                               title: Text('#productID:${snapshot.data[index]['pid']}'),
//
//                             ),
//                             // ListTile(
//                             //   tileColor: Colors.grey,
//                             //
//                             //   title: Text('Total'),
//                             //   trailing: Container(
//                             //       color: Colors.white,
//                             //       width: 80,
//                             //       height: 30,
//                             //
//                             //       child: Center(child: Text('${snapshot.data[index]['tot']}'))),
//                             // ),
//                             ButtonBar(
//                               children: [
//                                 OutlinedButton(onPressed: (){
//                                   status='declined';
//                                   sendData();
//                                   setState(() {
//
//                                   });
//                                 },
//                                     child: Text('Decline',style: descStyle,)),
//                                 OutlinedButton(onPressed: (){
//
//                                   status='accepted';
//                                   stock--;
//                                   sendData();
//                                   sendNoti();
//                                   setState(() {
//
//                                   });
//
//                                 }, child: Text('Accept',style: descStyle,))
//                               ],
//                             )
//                           ]
//                       ),
//                     );
//                   },
//
//                 );
//               }
//           ),
//         ),
//       ),
//     );
//   }
// }

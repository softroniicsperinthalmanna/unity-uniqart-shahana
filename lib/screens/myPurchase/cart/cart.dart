// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:uniqartapp/widgets/custSnackBar.dart';
//
// import '../../../connection/connect.dart';
// import '../../../widgets/custLottie.dart';
// class myCart extends StatefulWidget {
//   const myCart({Key? key}) : super(key: key);
//
//   @override
//   State<myCart> createState() => _myCartState();
// }
//
// class _myCartState extends State<myCart> {
//   var cartID;
//   var flag;
//   Future<void> getCartId() async {
//     var data={
//       'logID':'11'
//     };
//     var response=await post(Uri.parse('${Con.url}findCartId.php'),body:data);
//     print(response.body);
//     print(response.statusCode);
//
//     cartID=jsonDecode(response.body)[0]['cart_id'];
//     return jsonDecode(response.body);
//
//
//   }
//  Future<dynamic> getMyCart() async {
//     var data={
//       'cartID':cartID.toString()
//     };
//     var response=await post(Uri.parse('${Con.url}getMyCart.php'),body:data);
//     print(response.body);
//     print(response.statusCode);
//
//     cartID=jsonDecode(response.body)[0]['cart_id'];
//
//        (jsonDecode(response.body)[0]['result'] == 'success')
//    ? flag = 1
//        : flag = 0;
//    print(flag);
//    return json.decode(response.body
//    );
//
//
//
//
//    }
//
//
//
//   @override
//   void initState(){
//     super.initState();
//     getCartId();
//     getMyCart();
//     setState(() {
//
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xff458F9D),
//
//           title: Text('My Bag'),
//           centerTitle: true,
//         ),
//
//         body:
//             FutureBuilder(
//               future: getMyCart(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) print('Error ::${snapshot.error}');
//                 print('Inside builder ::${snapshot.hasData}');
//                 if (!snapshot.hasData) {
//                   return const Center(
//                     child: Center(child: Text('No Data')),
//                   );
//                 }
//
//                 return flag==0?lottieNothing():
//                   ListView.builder(
//                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
//                    shrinkWrap: true,
//                     itemCount: 5,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: ListTile(
//                           title: Text('#${snapshot.data[index]['pdtID'].toString()}'),
//                           subtitle: Text('Price: Rs ${snapshot.data[index]['price'].toString()}'),
//                           trailing: IconButton(
//                             icon: Icon(Icons.add_shopping_cart),
//                             onPressed: () {
//
//
//                               // addItemToCart(item);
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ),
//                       );
//                     });
//               }
//             ),
//
//
//       ),
//     );
//   }
// }

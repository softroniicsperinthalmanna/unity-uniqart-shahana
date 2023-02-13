// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart';
//
// import '../../../connection/connect.dart';
// import '../../../styles/style.dart';
//
// class AddArtDetailsTester extends StatefulWidget {
//    AddArtDetailsTester({Key? key,required this.indexNo}) : super(key: key);
// var indexNo;
//   @override
//   State<AddArtDetailsTester> createState() => _AddArtDetailsTesterState();
// }
//
// class _AddArtDetailsTesterState extends State<AddArtDetailsTester> {
//   File? image;
//   Future pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       //if user not selected any image return null
//       if (image == null) return;
//       //if selected an image, then get the image path
//       final imageTemporary = File(image.path);
//       setState(() {
//         uploadImage(imageTemporary);
//         this.image = imageTemporary;
//
//
//       });
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }
//   var description=TextEditingController();
//   var rate=TextEditingController();
//   var stock=TextEditingController();
//   var name=TextEditingController();
//   var category;
//
//   Future<void> uploadImage(File imageTemporary)  async {
//     switch(widget.indexNo){
//       case 0: category='Calligraphy';print(category);break;
//       case 1: category='Paintings';break;
//       case 2: category='Gift Hamper';break;
//       case 3: category='Save the Date';break;
//       case 4: category='Mehandi';break;
//       default: category='Other';break;
//     }
//     print(name.text);
//     print(description.text);
//     print(rate.text);
//     print(stock.text);
//     print(category);
//     print(imageTemporary);
//
//     var data={
//       "artName":name.text,
//       "arttype":category,
//       "image": imageTemporary,
//       "description":description.text,
//       "rate":rate.text,
//       "stock":stock.text,
//
//     };
//     var res = await post(Uri.parse('${Con.url}addArt.php'),body: data);
//     print(res.body);
//     return jsonDecode(res.body);
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//        //  backgroundColor: Colors.blue.shade300,
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           padding: EdgeInsets.all(12),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//
//                 //  FlutterLogo(size: 160,),
//
//                 //Wrap the Image.file with ClipOval to make it a circular image
//                 //Or wrap with ImageWidget
//
//
//                 image != null
//                     ? Image.file(
//                       image!,
//                       width: 350,
//                       height: 310,
//                       fit: BoxFit.cover,
//                     )
//                     : InkWell(
//                   onTap:(){_ChooseImage(context);},
//                       child: Center(
//                         child: Card(
//                   elevation: 10,
//                           shadowColor:   Color(0xffAF5DA2),
//                           child: Center(
//                             child: Container(
//
//                   height: 300,
//                   width: 250,
//                  child: Opacity(
//                      opacity: 0.6,
//
//                        child: Center(child: Text('-- Click here to select Image --',style: heading1,)),
//                      )
//                 ),
//                           ),
//                         ),
//                       ),
//                     ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   //  height: 200,
//
//                   color: Color(0xffD9D9D9),
//                   padding: EdgeInsets.all(8),
//                   child:  TextFormField(
//                     controller: name,
//
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(),
//                       focusedBorder: OutlineInputBorder(),
//                       label:Text('Product Name', style:heading1
//                       ),
//
//                     ),
//                   ),
//                 ),
//                 Container(
//                  //  height: 200,
//
//                     color: Color(0xffD9D9D9),
//                     padding: EdgeInsets.all(8),
//                     child:  TextFormField(
//                       controller: description,
//                       keyboardType: TextInputType.text,
//                       maxLines: 5,
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(),
//                         label:Text('Description', style:heading1
//                         ),
//
//                       ),
//                     ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   //  height: 200,
//
//                   color: Color(0xffD9D9D9),
//                   padding: EdgeInsets.all(8),
//                   child:  TextFormField(
//                     controller: rate,
//
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(),
//                       focusedBorder: OutlineInputBorder(),
//                       label: Text('Rate (in Rupees)', style:heading1
//                       ),
//
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   //  height: 200,
//
//                   color: Color(0xffD9D9D9),
//                   padding: EdgeInsets.all(8),
//                   child:  TextFormField(
//                     controller: stock,
//
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(),
//                       focusedBorder: OutlineInputBorder(),
//                       label:  Text('No. of Stocks', style:heading1
//                       ),
//
//                     ),
//                   ),
//                 ),
//
//
//                 SizedBox(
//                   height: 20,
//                 ),
//       Align(
//         alignment: AlignmentDirectional.bottomEnd,
//         child: Container(
//           width: 120,
//           height: 50,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: color,
//             ),
//             onPressed: (){
//               uploadImage(image!);
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item added Successfully ...',style: TextStyle(fontSize: 20,color: Colors.white),),
//                 backgroundColor:  Color(
//                     0xfa8f7805),));
//             Navigator.pop(context);
//             }, child:  Center(child: Text('Add',style: heading1,))
//           ),
//         ),
//       ),
//
//
//                 const SizedBox(
//                   height: 24,
//                 ),
//
//              //   Spacer()
//               ],
//       )
//     )
//         )
//       ),
//     );
//   }
//
//   Widget buildButton({
//     required String title,
//     required IconData icon,
//     required VoidCallback onClicked,
//   }) =>
//       ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           minimumSize: Size.fromHeight(30),
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           textStyle: TextStyle(fontSize: 15),
//         ),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               size: 28,
//             ),
//             const SizedBox(
//               width: 16,
//             ),
//             Text(title),
//           ],
//         ),
//         onPressed: onClicked,
//       );
//   Future<void> _ChooseImage(BuildContext context) async {
//
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             // backgroundColor: Color(0xfa8f7805),
//             title: Text('Choose Image from...'),
//             actions: <Widget>[
//               // ElevatedButton(
//               //   // color: Colors.green,
//               //   // textColor: Colors.white,
//               //   child: Text('Proceed'),
//               //   onPressed: () {
//               //     if( _dateInput.text.isEmpty){
//               //       showDialog(context: context,
//               //           builder: (context){
//               //             return  AlertDialog(
//               //               content: Text('Choose Date'),
//               //               //  contentPadding: EdgeInsets.all(12),
//               //               actions: [
//               //                 ElevatedButton(onPressed: (){
//               //                   Navigator.pop(context);
//               //
//               //                 }, child: Text('Ok'))
//               //               ],
//               //             );
//               //
//               //           });
//               //       _dateInput.text='';
//               //     }
//               //     else{
//               //       setState(() {
//               //         Navigator.pop(context);
//               //         //   pickDate=valueText;
//               //         Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPlaced(
//               //
//               //         )));
//               //
//               //
//               //         _dateInput.text='';
//               //       });
//               //
//               //     }
//               //   },
//               // ),
//               buildButton(
//                 title: 'Gallery',
//                 icon: Icons.image_outlined,
//                 onClicked: () => pickImage(ImageSource.gallery),
//               ),
//               buildButton(
//                 title: 'Camera',
//                 icon: Icons.camera_alt_outlined,
//                 onClicked: () => pickImage(ImageSource.camera),
//               ),
//
//             ],
//           );
//         });
//   }
// }
//

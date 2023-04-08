import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:uniqartapp/widgets/custSnackBar.dart';

import '../../../connection/connect.dart';
import '../../../styles/style.dart';
import '../cart/cart.dart';
import '../order/orderPlaced.dart';

class ArtDetailPage extends StatefulWidget {
  ArtDetailPage(
      {Key? key,
      required this.index,
      required this.logID,
      required this.pid,
      required this.vid,
      required this.rate,
      required this.description,
      required this.stock,
      required this.image, required this.itemID, required this.type, required this.name})
      : super(key: key);
  var rate;
  var logID;
  var pid;
  var vid;
  var description;
  var stock;
  var image;
  var index;
  var itemID;
  var type;
  var name;

  @override
  State<ArtDetailPage> createState() => _ArtDetailPageState();
}

class _ArtDetailPageState extends State<ArtDetailPage> {
  var hasCart;
  var cid;
  Future<void> sendData() async {
    var data={
      "cid":widget.logID,
      "vid":widget.vid,
      "pid":widget.pid,
      "total":widget.rate,
      "date":DateTime.now().toString(),
      'pickup':_dateInput.text
    };
    var response= await post(Uri.parse('${Con.url}requestOrder.php'),body: data);
    print(response.body);
    print(response.statusCode);
    if(response.statusCode==200){
      if(jsonDecode(response.body)['result']=='success'){
        ScaffoldMessenger.of(context).showSnackBar(snackMsg('Order Requested....'));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SellerLogin()));
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(errorSnackMsg('Failed to request order....'));

        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SellerReg()));

      }
    }else throw Exception('Error returned');


  }

  // Future<void> getCartid() async {
  //   var data = {'logID': '11'};
  //
  //   var response =
  //       await post(Uri.parse('${Con.url}findCartId.php'), body: data);
  //   print(response.body);
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     if (jsonDecode(response.body)[0]['result'] == 'success') {
  //       cid=jsonDecode(response.body)[0]['cartID'];
  //
  //     } else {
  //       cid=jsonDecode(response.body)[0]['cartID'];
  //
  //     }
  //   } else
  //     throw Exception('Error returned');
  // }

  // Future<void> addToCart() async {
  //   var data = {
  //     "logID": '11',
  //     'created_at': DateTime.now().toString(),
  //     'itemID': widget.itemID,
  //     'price': widget.rate,
  //     'cid':cid.toString(),
  //     'pdtCat':widget.type
  //
  //   };
  //   var response = await post(Uri.parse('${Con.url}artToCart.php'), body: data);
  //   print(response.body);
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     if (jsonDecode(response.body)['result'] == 'success') {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(snackMsg('Item added successfully'));
  //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignIn()));
  //     } else {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(snackMsg("Couldn't add item to cart.."));
  //     }
  //   } else
  //     throw Exception('Error returned');
  // }

  var _dateInput = TextEditingController();
  var valueText;
  var pickDate;
  @override
  void initState() {
    super.initState();
    print(widget.rate);
    print(widget.image);
   // getCartid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff458F9D),
        leading: Icon(Icons.menu),
        title: Text('UNIQART'),
        centerTitle: true,
        actions: [
          // Padding(padding: const EdgeInsets.all(8.0), child: notifyBadge()),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: cartBadge(),
          // ),
        ],
      ),
      body: Hero(
        tag: widget.index,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 310,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffa2e7ef),
                      child: Image.network(
                        '${Con.url}artUploads/${widget.image}',
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.name}',
                    style: heading1,
                  ),
                ), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Rs ${widget.rate}',
                    style: heading1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.description}',
                    style: descStyle,
                  ),
                ),
                //  Spacer(),
                ButtonBar(
                  children: [
                    // ElevatedButton(
                    //     onPressed: () {
                    //       print(widget.type);
                    //       setState(() {
                    //     //    addToCart();
                    //       });
                    //     },
                    //     child: Text('Add to Cart')),
                    ElevatedButton(
                        onPressed: () {
                          // showTimePicker(context: context, initialTime: initialTime)
                          _displayTextInputDialog(context);
                        },
                        child: Text('Buy now')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // backgroundColor: Color(0xfa8f7805),
            title: Text('Pick Up Your Date'),
            content: TextField(
              controller: _dateInput,
              //editing controller of this TextField
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Enter Date" //label text of field
                  ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(Duration(days: 1)),
                    // firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    _dateInput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
            ),
            actions: <Widget>[
              ElevatedButton(
                // color: Colors.green,
                // textColor: Colors.white,
                child: Text('Proceed'),
                onPressed: () {
                  if (_dateInput.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('Choose Date'),
                            //  contentPadding: EdgeInsets.all(12),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ok'))
                            ],
                          );
                        });
                    _dateInput.text = '';
                  } else {
                    sendData();
                    setState(() {
                      Navigator.pop(context);
                      //   pickDate=valueText;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderPlaced()));

                      Timer(Duration(milliseconds: 500), () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });


                      _dateInput.text = '';
                    });
                  }
                },
              ),
            ],
          );
        });
  }

  // Widget cartBadge() {
  //   return Badge(
  //       //  position: BadgePosition.topEnd(),
  //
  //       textColor: Colors.amber,
  //     //  label: Text('5'),
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
  //       //  position: BadgePosition.topEnd(),
  //
  //       textColor: Colors.amber,
  //      // label: Text('3'),
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

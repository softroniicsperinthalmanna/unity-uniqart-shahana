import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uniqart_app/screens/myPurchase/order/orderPlaced.dart';
import 'package:uniqart_app/styles/style.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../../../connection/connect.dart';
class PlantDetailPage extends StatefulWidget {
  PlantDetailPage({Key? key,required this.rate,required this.name,required this.size,required this.description,required this.stock,required this.image,required this.tagID}) : super(key: key);
  var rate;
  var description;
  var stock;
  var image;
  var name;
  var size;
  var tagID;

  @override
  State<PlantDetailPage> createState() => _PlantDetailPageState();
}

class _PlantDetailPageState extends State<PlantDetailPage> {

  // Future viewCalligraphy() async {
  //   // var url = "http://192.168.180.139/uniqart_app/viewArt.php";
  //   var response = await http.get(Uri.parse("${Con.url}viewArt.php"));
  //   print(response.body);
  //   return json.decode(response.body);
  //
  // }
  // @override
  // void initState(){
  //   super.initState();
  //   viewCalligraphy();
  // }

  var _dateInput=TextEditingController();
  var valueText;
  var pickDate;
  @override
  void initState(){
    super.initState();
    print(widget.rate);
    print(widget.image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff458F9D),

        leading: Icon(Icons.menu),
        title: Text('UN!QART'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){},  icon: Icon(Icons.home)),
          ),  Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){},  icon: Icon(Icons.shopping_cart)),
          ),
        ],

      ),
      body: Hero(
        tag: widget.tagID,
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
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffa2e7ef),
                      child: Image.network('${Con.url}plantUploads/${widget.image}',fit: BoxFit.fill,)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text( widget.name,style: TextStyle(color: Colors.blue,fontSize: 25,fontWeight: FontWeight.bold),),
                ),Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Rs ${widget.rate}',style: heading1,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${widget.description}',style: descStyle,),
                ),
                //  Spacer(),
                ButtonBar(
                  children: [
                    ElevatedButton(onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item added to Cart',style: TextStyle(fontSize: 20,color: Colors.white),),
                        backgroundColor:  Color(
                            0xfa8f7805),));
                    }, child: Text('Add to Cart')),
                    ElevatedButton(onPressed: (){
                      // showTimePicker(context: context, initialTime: initialTime)
                      _displayTextInputDialog(context);
                    }, child: Text('Buy now')),
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
                    firstDate: DateTime(1950),
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
                  if( _dateInput.text.isEmpty){
                    showDialog(context: context,
                        builder: (context){
                          return  AlertDialog(
                            content: Text('Choose Date'),
                            //  contentPadding: EdgeInsets.all(12),
                            actions: [
                              ElevatedButton(onPressed: (){
                                Navigator.pop(context);

                              }, child: Text('Ok'))
                            ],
                          );

                        });
                    _dateInput.text='';
                  }
                  else{
                    setState(() {
                      Navigator.pop(context);
                      //   pickDate=valueText;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPlaced(

                      )));


                      _dateInput.text='';
                    });

                  }
                },
              ),

            ],
          );
        });
  }
}

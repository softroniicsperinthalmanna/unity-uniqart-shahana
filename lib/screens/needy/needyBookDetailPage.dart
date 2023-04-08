import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uniqartapp/screens/myPurchase/order/orderPlaced.dart';
import 'package:uniqartapp/styles/style.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../../connection/connect.dart';
import '../../widgets/custSnackBar.dart';
class NeedyBookDetailPage extends StatefulWidget {
  NeedyBookDetailPage({Key? key,required this.tagID,required this.nid,required this.pid,required this.name,required this.description,required this.stock,required this.image,required this.author,required this.publishDate,required this.donorID}) : super(key: key);

  var name;
  var description;
  var author;
  var publishDate;
  var donorID;
  var stock;
  var image;
  var tagID;
  var pid;
  var nid;

  @override
  State<NeedyBookDetailPage> createState() => _NeedyBookDetailPageState();
}

class _NeedyBookDetailPageState extends State<NeedyBookDetailPage> {

  Future<void> sendData() async {
    print(widget.nid);
    print(widget.donorID);
    print(widget.pid);
    print(_dateInput.text);
    print(DateTime.now().toString());
    var data={
      "nid":widget.nid,
      "did":widget.donorID,
      "pid":widget.pid,
      "date":DateTime.now().toString(),
      'pickup':_dateInput.text
    };
    var response= await post(Uri.parse('${Con.url}requestOrder_donor.php'),body: data);
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

    print(widget.image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff458F9D),

        leading: Icon(Icons.menu),
        title: Text('UNIQART'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){},  icon: Icon(Icons.home)),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: IconButton(onPressed: (){},  icon: Icon(Icons.shopping_cart)),
          // ),
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
                      child: Image.network('${Con.url}donatebookUploads/${widget.image}',fit: BoxFit.cover,)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${widget.stock} left',style: heading1,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${widget.description}',style: descStyle,),
                ), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${widget.publishDate}',style: descStyle,),
                ), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${widget.author}',style: descStyle,),
                ),
                //  Spacer(),
                ButtonBar(
                  children: [
                    ElevatedButton(onPressed: (){
                      _displayTextInputDialog(context);

                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Your request has been sent',style: TextStyle(fontSize: 20,color: Colors.white),),
                      //   backgroundColor:  Color(
                      //       0xfa8f7805),));
                    }, child: Text('Request')),
                    // ElevatedButton(onPressed: (){
                    //   // showTimePicker(context: context, initialTime: initialTime)
                    //   _displayTextInputDialog(context);
                    // }, child: Text('Buy now')),
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
                    sendData();
                    setState(() {
                      Navigator.pop(context);
                      //   pickDate=valueText;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPlaced(

                      )));
                      Timer(Duration(milliseconds: 500), () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });


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


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniqart_app/widgets/custSnackBar.dart';

import '../../../connection/connect.dart';
import '../../../styles/style.dart';
import '../cart/cart.dart';
import '../order/orderPlaced.dart';
class ArtDetailPage extends StatefulWidget {
   ArtDetailPage({Key? key,required this.tagID,required this.rate,required this.description,required this.stock,required this.image}) : super(key: key);
   var rate;
   var description;
   var stock;
   var image;
   var tagID;

  @override
  State<ArtDetailPage> createState() => _ArtDetailPageState();
}

class _ArtDetailPageState extends State<ArtDetailPage> {
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
        title: Text('UNIQART'),
        centerTitle: true,
        actions: [


          Padding(
            padding: const EdgeInsets.all(8.0),
            child:notifyBadge()
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:cartBadge(),
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
                      height: 310,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffa2e7ef),
                      child: Image.network('${Con.url}artUploads/${widget.image}',fit: BoxFit.cover,)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Rs ${widget.rate}',style: heading1,),
                ),Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Description',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${widget.description}',style: descStyle,),
                ),
                //  Spacer(),
                ButtonBar(
                  children: [
                    ElevatedButton(onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(snackMsg('Item added successfully'));
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
  Badge cartBadge(){
    return Badge(
      //  position: BadgePosition.topEnd(),
        textStyle:TextStyle(
          color: Colors.amber,

        ) ,
        label: Text('5'),
        child: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>myCart()));
          },  icon: Icon(Icons.shopping_cart),iconSize: 25,));
  }
  Badge notifyBadge(){
    return  Badge(
      //  position: BadgePosition.topEnd(),
        textStyle:TextStyle(
          color: Colors.amber,

        ) ,
        label: Text('3'),
        child: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>myCart()));
        },  icon: Icon(Icons.notifications),iconSize: 25,));
  }

}

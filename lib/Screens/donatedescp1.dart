import 'package:flutter/material.dart';
class DonateDescription1 extends StatelessWidget {
  const DonateDescription1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xff458F9D),
      title: Text("UNIQART",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.home))
      ],
    ),
      body:Container(
      height: double.infinity,
    width: double.infinity,
    child: Column(
    children: [
    Container(
    width: MediaQuery.of(context).size.width,
    height: 270,
    color:Color(0xff458F9D),
    child:  Column(
    children:[
    SizedBox(height: 10,),
    Padding(
    padding: const EdgeInsets.only(top: 48.0),
    child: Container(
    height: 175,
    width: 275,
    child: Image(image: AssetImage('assets/images/snap.jpg'),fit: BoxFit.fill,)),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    );
  }
}

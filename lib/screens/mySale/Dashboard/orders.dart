import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../styles/style.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Orders',style: authHead,),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){},icon: Icon(Icons.home),)
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          separatorBuilder: (context,index){
            return Divider();
          },
          itemCount: 5,
          itemBuilder: (context,index){
            return SingleChildScrollView(
              child: Column(
               // shrinkWrap: true,
                children:[
                  ListTile(
                    tileColor: Colors.grey,
                    title: Text('#userID',style: descStyle,),
                    trailing:Container(
                        color: Colors.red,
                        width: 80,
                        height: 30,

                        child: Center(child: Text('Waiting',style: TextStyle(color: Colors.white),))),
                  ),
                  ListTile(
                    tileColor: Colors.grey,

                    title: Text('#email@gmail.com'),

                  ),
                  ListTile(
                    tileColor: Colors.grey,

                    title: Text('Total'),
                    trailing: Container(
                        color: Colors.white,
                        width: 80,
                        height: 30,

                        child: Center(child: Text('Rs 450'))),
                  ),
                  ButtonBar(
                    children: [
                      OutlinedButton(onPressed: (){}, child: Text('Decline',style: descStyle,)),
                      OutlinedButton(onPressed: (){}, child: Text('Accept',style: descStyle,))
                    ],
                  )
                ]
              ),
            );
          },

        ),
      ),
    );
  }
}

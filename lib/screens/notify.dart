import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../styles/style.dart';

class Notification extends StatefulWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications',style: authHead,),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            // IconButton(onPressed: (){},icon: Icon(Icons.home),)
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
                        subtitle: Text('#Message',style: descStyle,),
                        trailing:Container(
                            color: Colors.red,
                            width: 80,
                            height: 30,

                            child: Center(child: Text('Mark Read',style: TextStyle(color: Colors.white),))),
                      ),
                    ]
                ),
              );
            },

          ),
        ),
      ),
    );
  }
}

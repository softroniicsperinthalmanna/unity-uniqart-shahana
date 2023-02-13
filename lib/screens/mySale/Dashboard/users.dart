import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../styles/style.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Users',style: authHead,),
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
                  //shrinkWrap: true,
                  children:[
                    ListTile(
                      tileColor: Colors.grey,
                      title: Text('#user',style: descStyle,),
                      subtitle: Text('#email@gmail.com'),

                      trailing:Container(
                          color: Colors.red,
                          width: 80,
                          height: 30,

                          child: Center(child: Text('12/03/2023',style: TextStyle(color: Colors.white),))),
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

                  ]
              ),
            );
          },

        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

Widget custDrawer(){
  return  Drawer(
    // backgroundColor: Colors.blue,
    child: SingleChildScrollView(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: DrawerHeader(
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 70,
                child: Icon(Icons.person,size: 110,),
              ),
            ),
          ),
          Center(
              child: OutlinedButton(
                  onPressed: (){},
                  child: Text('Edit Profile'))),
          Divider(),

          ListTile(

            title: Text('Notifications'),
            leading: Icon(Icons.notifications),
            // leading: Icon(Icons.notifications),)

          ),
          ListTile(

            title: Text('LogOut'),
            leading: Icon(Icons.logout),
            // leading: Icon(Icons.notifications),)

          )],
      ),
    ),
  );
}
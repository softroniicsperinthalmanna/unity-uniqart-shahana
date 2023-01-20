
import 'package:clgapp/models/DressListModel.dart';
import 'package:flutter/material.dart';
class DressList extends StatelessWidget {
  const DressList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff456F64),
        title: Text("UNIQART"),
        centerTitle: true,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,

          child: ListView.builder(
              itemCount: cloth.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 120,
                  width: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage(
                        "assets/images/" + cloth[index]['img'],),
                    fit: BoxFit.cover,
                    )

                  ),


                     child: Center(
                       child: Text(cloth[index]['name'],
                    style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,fontSize: 30)),
                     )
                );
              })
      ),


    );
  }
}










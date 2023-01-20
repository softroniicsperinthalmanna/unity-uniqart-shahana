import 'package:clgapp/models/jewelleryListModel.dart';
import 'package:flutter/material.dart';
class jewellery_list extends StatelessWidget {
  const jewellery_list({Key? key}) : super(key: key);


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
              itemCount: jewellery.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                        height: 100,
                        width: 450,
                          decoration: BoxDecoration(
                            image: DecorationImage(

                            image: AssetImage(
                                  "assets/images/" + jewellery[index]['img'],),
                              fit: BoxFit.cover,),

                          ),



                      //child: Align(
                        //alignment: Alignment.bottomCenter,
                        //child: Container(
                         // height: 50,
                          //width: 350,

                          child:
                            Center(
                                child: Text(jewellery[index]['name'],
                              style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,fontSize: 30),),),

                );
                 }
      ),
    ),
    );




  }
}










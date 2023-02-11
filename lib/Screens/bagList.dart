import 'package:flutter/material.dart';
import 'package:uniqart/models/bagModel.dart';
class bagList extends StatelessWidget {
  const bagList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff458F9D),
        title: Text("UNIQART"),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage("assets/images/bagggs/bag.jpg"),
                ),
              ),
              Container(
                height:700 ,
                child: ListView.builder(
                    itemCount: bagModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 300,
                        width: 450,
                        decoration: BoxDecoration(
                          image: DecorationImage(

                            image: AssetImage(
                              "assets/images/bagggs/"+ bagModel[index]['image'],),
                            fit: BoxFit.cover,),

                        ),


                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );




  }
}
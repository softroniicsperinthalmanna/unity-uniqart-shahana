import 'package:flutter/material.dart';
import 'package:uniqart/models/foodmodel.dart';
class foodList extends StatelessWidget {
  const foodList({Key? key}) : super(key: key);


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
                  image: AssetImage("assets/images/food/foodlogo.jpg"),
                ),
              ),
              Container(
                height:700 ,
                child: ListView.builder(
                    itemCount: foodModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        width: 450,
                        decoration: BoxDecoration(
                          image: DecorationImage(

                            image: AssetImage(
                              "assets/images/food"+ foodModel[index]['image'],),
                            fit: BoxFit.cover,),

                        ),
                        child:
                        Center(
                          child: Text(foodModel[index]['name'],
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 30),),),

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
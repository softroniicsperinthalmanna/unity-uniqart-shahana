import 'package:flutter/material.dart';
import 'package:uniqart/models/bookModel.dart';
class Clothes_list extends StatelessWidget {
  const Clothes_list({Key? key}) : super(key: key);


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
                  image: AssetImage("assets/images/book/booklogo.png"),
                ),
              ),
              Container(
                height:700 ,
                child: ListView.builder(
                    itemCount: bookModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        width: 450,
                        decoration: BoxDecoration(
                          image: DecorationImage(

                            image: AssetImage(
                              "assets/images/"+ bookModel[index]['image'],),
                            fit: BoxFit.cover,),

                        ),
                        child:
                        Center(
                          child: Text(bookModel[index]['name'],
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
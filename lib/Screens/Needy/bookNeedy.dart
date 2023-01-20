import 'package:clgapp/models/bookModel.dart';
import 'package:flutter/material.dart';
class Book_Needy extends StatelessWidget {
  const Book_Needy({Key? key}) : super(key: key);

  get bold => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff456F64),
        title:const Text("UNIQART"),

        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: GridView.builder(
            itemCount: book.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2
            ),
            itemBuilder: (context,index){
              return Stack(
                children: [

               Container(
                  height: 250,
                  width: 350,

                  child: Image(image: AssetImage("assets/images/"+book[index]['img'],),fit: BoxFit.cover,),
                ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      width: 350,
                      color: Color(0xff456F64),
                      child: Center(child: Text(book[index]['name'],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)),

                    ),
                  )
                ]
              );
            })
      ),
    );
  }
}

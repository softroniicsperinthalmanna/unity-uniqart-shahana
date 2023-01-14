import 'package:flutter/material.dart';

import 'models/models.dart';
class FashionPage extends StatelessWidget {
  const FashionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
      //  backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F4EF),
        title:  Text("UNIQART",
          style: TextStyle(color: Color(0xff283C5B),
        ),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: IconButton(onPressed: (){},icon: Icon(Icons.search,color: Colors.black,)),
          )
        ],
        ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemCount: fashionList.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Container(
                    height:202,
                    child: Image(image: AssetImage("assets/images/"+fashionList[index]['image']),fit: BoxFit.fill,),
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',
              backgroundColor: Colors.yellow
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Order',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blue,
          ),
        ],
      ),

    );
  }
}

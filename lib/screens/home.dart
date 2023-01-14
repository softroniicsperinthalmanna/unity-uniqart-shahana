import 'package:flutter/material.dart';
class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);
  List services=['cart.png','sale.png','needy.png','giv.png'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Center(
          child: Card(

            color: Color(0xff8E785E),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.90,
              width: MediaQuery.of(context).size.width * 0.90,
              child: GridView.builder(
                itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3

                  ),
                  itemBuilder: (context,index){
                  return Container(
                    // height: 400,
                    // width: 200,
                    height: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Image(image: AssetImage("assets/images/"+services[index]),fit: BoxFit.fill,),
                  );
                  }),
            ),
          ),
        )
      ),
    );
  }
}

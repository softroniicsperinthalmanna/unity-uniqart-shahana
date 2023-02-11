import 'package:flutter/material.dart';
class Donate extends StatelessWidget {
  const Donate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff458F9D),
        title: Text("UNIQART",
        style: TextStyle(color: Colors.white),
      ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.home))
        ],
      ),
      body:Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              color:Color(0xff458F9D),
              child:  Column(
                  children: [
                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: Container(
                          height: 175,
                          width: 275,
                          child: Image(image: AssetImage('assets/images/donate/donateLogo.jpg'),fit: BoxFit.fill,)),
                    ),
                    SizedBox(height: 12,),
                    Text('FREE YOUR HANDS FOR NEEDY ! ! !',style: TextStyle(color:Colors.white),)
                  ],
                ),
            ),
            SizedBox(height: 10,),
            Text('ITEMS FOR DONATE',style: TextStyle(color:Color(0xff0B4B57),fontSize: 24),),
            Container(
              child: GridView.builder(
                itemCount: 3,
                  gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                itemBuilder: (index,context){
                  return Container(
                    child:Text('Hello')
                  );
                },

              ),
            )
          ]
        ),
      ) ,
    );
  }
}

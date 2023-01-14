import 'package:flutter/material.dart';
class PurchaseHome extends StatefulWidget {
  const PurchaseHome({Key? key}) : super(key: key);

  @override
  State<PurchaseHome> createState() => _PurchaseHomeState();
}

class _PurchaseHomeState extends State<PurchaseHome> {
  List<dynamic> services=['bride.webp','jwls.jpg','tops.jpg','plants.jpg','clothes.jpg','fashion.png','bag.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('UNIQART'),
          centerTitle:true

      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/college.jpg"),
                    fit: BoxFit.fill
                  )
                ),

              ),
              SizedBox(height: 10,),
              Container(
                height:100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: services.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/images/"+services[index]),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 10,),
      Container(
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
              SizedBox(
                height: 20,
              ),
              Container(
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
    ],
               ),
        ),

           ),
    );
  }
}
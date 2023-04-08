import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../connection/connect.dart';
import '../../../styles/style.dart';
class MyCategories extends StatefulWidget {
   MyCategories({Key? key,required this.logId}) : super(key: key);
var logId;

  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
  var catImage;
  var catText;

  Future<dynamic> getData() async {
    var data={
      "log_id":widget.logId.toString()
    };
    var response=await post(Uri.parse("${Con.url}getMyCategory.php",),body: data);
    print(response.body);
    print(response.statusCode);

    return jsonDecode(response.body);
  }
  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:FutureBuilder(
        future: getData(),
        builder: (context,AsyncSnapshot snapshot){
          return  Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(

              itemCount: snapshot.data!.length,
              itemBuilder: (context,index){
print(snapshot.data);
if(snapshot.hasError){
  print(snapshot.hasError);
}
                if(snapshot.hasData){
                  if(snapshot.data![index]['pdt_Category']=='art'){
                    catImage='art.png';
                    catText='Art';

                  }
                  else  if(snapshot.data![index]['pdt_Category']=='bag') {
                    catImage = 'bag.png';
                    catText='Baggy';
                  }
                  else  if(snapshot.data![index]['pdt_Category']=='book'){
                    catImage='book.png';
                    catText='Book';

                  }
                  else  if(snapshot.data![index]['pdt_Category']=='cloth'){
                    catImage='cloth.png';
                    catText='Clothing';
                  }
                  else  if(snapshot.data![index]['pdt_Category']=='plant'){
                    catImage='plant.png';
                    catText='Plant';
                  }
                  else{
                    return Center(
                      child: Text('No categories'),
                    );
                  }


                }

                return  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(

                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(

                          image: DecorationImage(

                        image: AssetImage("assets/images/catelog/"+catImage),fit: BoxFit.fill


                          )
                        ),
                      ),
                    ),
                    Center(child: Text(catText.toUpperCase(),style: catStyle,)),


                  ],
                );

              },




                //    Center(child: Text(catelogModel[index]['name'].toUpperCase(),style: catStyle,)),


            ),
          );
        },

      )
    );
  }
}

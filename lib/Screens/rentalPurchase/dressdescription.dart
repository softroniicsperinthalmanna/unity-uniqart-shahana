import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/style.dart';
class DressDescription extends StatelessWidget {
  const DressDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //: kBackMouseButton,
      appBar: AppBar(
        backgroundColor: Color(0xffAF5DA2),
        title:const Text("UNIQART"),

        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.90,
          width: MediaQuery.of(context).size.width * 0.90,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 250,
                  child: Image(image: AssetImage("assets/images/saree.jpg"),fit: BoxFit.cover,),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description', style:heading1
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 350,

                          color: Color(0xffD9D9D9),
                          padding: EdgeInsets.all(8),
                          child: Text('In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used asc' ,)),
                      SizedBox(
                        height: 10,
                      ),

                      Text('Rate: ',style: heading1,),
                      Container(
                        width: 350,
                        color: Color(0xffD9D9D9),
                        padding: EdgeInsets.all(8),
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('size & fit:',style:heading1,),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 350,                        color: Color(0xffD9D9D9),
                          padding: EdgeInsets.all(8),
                          child: SizedBox(
                            height: 15,
                          )


                      ),
                      Text('material & care:',style:heading1,),
                      Container(
                          width: 350,                          color: Color(0xffD9D9D9),
                          padding: EdgeInsets.all(8),
                          child: SizedBox(
                            height: 15,
                          )


                      ),
                     // Text('pattern:',style:heading1,),
                      //Container(
                        //  width: 350,                          color: Color(0xffD9D9D9),
                          //padding: EdgeInsets.all(8),
                          //child: SizedBox(
                            //height: 15,
                          //)


                      //),
                      SizedBox(
                        height: 20,
                      ),


                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 50,
                          width: 170,
                          color: Color(0xffAF5DA2),

                          child: Center(child: Text('BUY',style: heading1,)),

                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

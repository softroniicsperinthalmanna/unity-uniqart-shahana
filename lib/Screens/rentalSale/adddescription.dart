import 'package:clgapp/styles/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AddDescription extends StatelessWidget {
  const AddDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //: kBackMouseButton,
      appBar: AppBar(
        backgroundColor: Color(0xff69456F),
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
                  child: Image(image: AssetImage("assets/images/snap.jpg"),fit: BoxFit.cover,),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description', style:heading1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 350,

                          color: Color(0xffD9D9D9),
                          padding: EdgeInsets.all(8),
                          child: TextFormField( )),
                      SizedBox(
                        height: 10,
                      ),

                      Text('Rate: ',style:heading1 ,),
                      TextFormField(),
                      Container(
                        width: 350,
                        color: Color(0xffD9D9D9),
                        padding: EdgeInsets.all(8),),
                      SizedBox(
                        height: 10,
                      ),
                      Text('size:',style:heading1,),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: 350,                        color: Color(0xffD9D9D9),
                          padding: EdgeInsets.all(8),
                          child: SizedBox(
                            height: 15,
                          )
                      ),
                      SizedBox(
                        height: 50,
                      ),


                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 50,
                          width: 170,
                          color: Color(0xff69456F),

                          child: Center(child: Text('ADD',style: heading1,)),

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

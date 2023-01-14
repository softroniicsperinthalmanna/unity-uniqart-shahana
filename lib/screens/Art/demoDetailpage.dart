import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/style.dart';
class DetailPageArt extends StatelessWidget {
  const DetailPageArt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.90,
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center
            ,
            children: [
              Container(
                height: 300,
                width: 350,
                child: Image(image: AssetImage("assets/images/bag.jpg"),fit: BoxFit.cover,),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description',style:heading1 ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 350,

                        color: Color(0xffD9D9D9),
                        padding: EdgeInsets.all(8),
                        child: Text('In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is availablehbdabsdjadc hbdahsbca sabdahdchv bdhabc' ,)),
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: [
                        Text('Rate: ',style: heading1,),
                        Text('Rs 234')

                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 70,
                        width: 142,
                        color: Color(0xffD9D9D9),

                        child: Center(child: Text('Buy',style: heading1,)),

                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
